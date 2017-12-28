# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Thomas Kuther <archlinux@kuther.net>
# Contributor: Gianni Vialetto <gianni at rootcube dot net>
# Contributor: Paul N. Maxwell <msg dot maxwel at gmail dot com>
# Contributor: Thomas Mudrunka <harvie@@email..cz>
# Contributor: Max Fierke <max@maxfierke.com>

pkgbase=apparmor
pkgname=("${pkgbase}" 'apparmor-parser' 'apparmor-libapparmor' 'apparmor-utils' 'apparmor-profiles' 'apparmor-pam' 'apparmor-vim')
pkgver=2.12.0
_majorver="$(expr "${pkgver}" : '\([0-9]*\.[0-9]*\)\.')"
pkgrel=1
pkgdesc='Linux application security framework - mandatory access control for programs'
arch=('i686' 'x86_64')
url='http://wiki.apparmor.net/index.php/Main_Page'
license=('GPL')
makedepends=('flex' 'swig' 'perl' 'python' 'perl-locale-gettext' 'perl-rpc-xml' 'audit')
source=("https://launchpad.net/${pkgbase}/${_majorver}/${pkgver}/+download/${pkgbase}-${_majorver}.tar.gz"{,.asc}
	"apparmor_load.sh"
	"apparmor_unload.sh"
	"apparmor.service")
sha512sums=('d85fd47c66333fe5658ee5e977b32142697f6e36c575550712ee2ace2ad0fbf2aa59c8fd3b82ad8821c0190adf8cc150cf623ea09a84d5b32bde050a03dd6e9a'
            'SKIP'
            'ae9598c2f7c7e04697ef542ef09b816eff0cdb32182a133769760d0669cdceb7ebf896f7c0523d6499394d2ac20d2d3ddec2189ead7ea3d98534c7b9fccdae25'
            '9f729a2d838cc48065ba3758b4c021e9ab57210a351724cc1a96819169d3f08efba13469483227f5bb482e5f4ea6a48f8cb682996716137e0c1fd0876b2b9a2d'
            'a288614318b35ac5ed50897d6064ee4c81f3f1628e171c6b5229261045d4b31aa977795584f7ed2753170ae8ce023ef7dafeb38fd12f07ab35ba78d020972b5b')
# 3D3664BB: AppArmor Development Team (AppArmor signing key) <apparmor@lists.ubuntu.com>
validpgpkeys=('3ECDCBA5FB34D254961CC53F6689E64E3D3664BB')

_core_perl_dir='/usr/bin/core_perl'
_vendorarch_perl_dir="$(perl -V:vendorarch | sed "s/^vendorarch='\(.*\)';$/\1/g")"
export MAKEFLAGS+=" POD2MAN=${_core_perl_dir}/pod2man"
export MAKEFLAGS+=" POD2HTML=${_core_perl_dir}/pod2html"
export MAKEFLAGS+=" PODCHECKER=${_core_perl_dir}/podchecker"
export MAKEFLAGS+=" PROVE=${_core_perl_dir}/prove"
export MAKEFLAGS+=" PYTHON=python3"

prepare() {
	cd "${srcdir}/${pkgbase}-${_majorver}/parser"
	# Skip compiling LaTex documents and hence avoid an additional dependency on texlive-latex
	sed -i -e 's/pdflatex/true/g' Makefile

	cd "${srcdir}/${pkgbase}-${_majorver}/utils"
	# Adapt logprof paths to Arch Linux defaults
	sed -e '/logfiles/ s/syslog /syslog.log /g' \
		-e '/logfiles/ s/messages/messages.log/g' \
		-e '/parser/ s# /sbin/# /usr/bin/#g' \
		-i logprof.conf
	# Skip building and installing vim related files within the utils package
	# becuase of false references to $srcdir and non-default file locations
	sed -i '/vim/d' Makefile

	cd "${srcdir}/${pkgbase}-${_majorver}/profiles/apparmor.d"
	# Adapt profile names to Arch linux defaults
	find . -name "*sbin*" -print0 | while read -r -d $'\0' i; do
		sed -i -e 's@sbin@bin@g' "${i}"
		mv "${i}" "${i/sbin/bin}"
	done
	for i in klogd ping syslog-ng syslogd; do
		sed -e "s@/bin/${i}@/usr/bin/${i}@g" \
			-e "s@bin\.${i}@usr\.bin\.${i}@g" \
			-i "bin.${i}"
		mv "bin.${i}" "usr.bin.${i}"
	done
}

build() {
	cd "${srcdir}/${pkgbase}-${_majorver}/libraries/libapparmor"
	unset PERL_MM_OPT
	NOCONFIGURE=1 ./autogen.sh
	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--with-perl \
		--with-python
	make

	cd "${srcdir}/${pkgbase}-${_majorver}"

	make -C parser

	make -C utils

	make -C profiles

	make -C changehat/pam_apparmor

	make -C utils/vim -j1
}

package_apparmor() {
	pkgdesc='Linux application security framework - mandatory access control for programs (metapackage)'
	depends=('apparmor-parser' 'apparmor-libapparmor' 'apparmor-utils' 'apparmor-profiles' 'apparmor-pam' 'apparmor-vim')
	optdepends=('linux-apparmor: an arch kernel with AppArmor patches')
	install='apparmor.install'
}

package_apparmor-parser() {
	pkgdesc='AppArmor parser - loads AA profiles to kernel module'
	depends=('apparmor-libapparmor')

	cd "${srcdir}/${pkgbase}-${_majorver}"
	make -C parser DESTDIR="${pkgdir}" install
	mv "${pkgdir}/lib" "${pkgdir}/usr/lib"
	mv "${pkgdir}/sbin" "${pkgdir}/usr/bin"
}

package_apparmor-libapparmor() {
	pkgdesc='AppArmor library'
	makedepends=('swig' 'perl' 'python')
	depends=('python')

	cd "${srcdir}/${pkgbase}-${_majorver}"
	make -C libraries/libapparmor DESTDIR="${pkgdir}" install
	install -D -m644 "libraries/libapparmor/swig/perl/LibAppArmor.pm" "${pkgdir}/${_vendorarch_perl_dir}"
}

package_apparmor-utils() {
	pkgdesc='AppArmor userspace utilities'
	depends=('perl' 'perl-locale-gettext' 'perl-term-readkey' 'perl-file-tail' 'perl-rpc-xml' 'python')

	cd "${srcdir}/${pkgbase}-${_majorver}"
	make -C utils DESTDIR="${pkgdir}" BINDIR="${pkgdir}/usr/bin" install
	install -D -m755 "${srcdir}/apparmor_load.sh" "${pkgdir}/usr/bin/apparmor_load.sh"
	install -D -m755 "${srcdir}/apparmor_unload.sh" "${pkgdir}/usr/bin/apparmor_unload.sh"
	install -D -m644 "${srcdir}/apparmor.service" "${pkgdir}/usr/lib/systemd/system/apparmor.service"
}

package_apparmor-profiles() {
	pkgdesc='AppArmor sample pre-made profiles'
	depends=('apparmor-parser')

	# Add default profiles to the backup array
	cd "${srcdir}/${pkgbase}-${_majorver}/profiles/apparmor.d"
	# Without the PKGBUILD check the following command would confuse `makepkg --printsrcinfo`
	[[ -f "./PKGBUILD" ]] || backup=($(find . -type f | sed 's@./@etc/apparmor.d/@'))

	cd "${srcdir}/${pkgbase}-${_majorver}"
	make -C profiles DESTDIR="${pkgdir}" install
}

package_apparmor-pam() {
	pkgdesc='AppArmor PAM library'
	depends=('apparmor-libapparmor' 'pam')

	cd "${srcdir}/${pkgbase}-${_majorver}"
	make -C changehat/pam_apparmor DESTDIR="${pkgdir}/usr" install
	install -D -m644 changehat/pam_apparmor/README "${pkgdir}/usr/share/doc/apparmor/README.pam_apparmor"
}

package_apparmor-vim() {
	pkgdesc='AppArmor VIM support'
	depends=('vim')

	cd "${srcdir}/${pkgbase}-${_majorver}/utils/vim"
	install -D -m644 apparmor.vim "${pkgdir}/usr/share/vim/vimfiles/syntax/apparmor.vim"
}

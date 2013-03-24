# Maintainer: Keshav Padram <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

_pkgname="gummiboot"
pkgname="${_pkgname}-git"

pkgver=20130324
pkgrel=1
pkgdesc="Simple text-mode UEFI Boot Manager - GIT Version"
url="http://freedesktop.org/wiki/Software/gummiboot"
arch=('x86_64' 'i686')
license=('LGPL2.1')

makedepends=('git' 'gnu-efi-libs' 'docbook-xsl')
depends=('util-linux' 'dosfstools')
optdepends=('mactel-boot: For bless command in Apple Mac systems')

conflicts=("${_pkgname}" 'gummiboot-efi' 'gummiboot-efi-git')
provides=("${_pkgname}" 'gummiboot-efi' 'gummiboot-efi-git')

options=('!strip' '!makeflags')
install="${_pkgname}.install"

source=('loader.conf'
        'arch.conf')

sha1sums=('82a59f90d9138c26f8db52bb8e94991602cf1edd'
          'aff6e152c3f7494e6113a8e2f073810366433015')

_gitroot="git://anongit.freedesktop.org/gummiboot"
_gitname="gummiboot"
_gitbranch="master"

_update_git() {
	
	cd "${srcdir}/"
	
	msg "Connecting to GIT server...."
	
	if [[ -d "${srcdir}/${_gitname}/" ]]; then
		cd "${srcdir}/${_gitname}/"
		git reset --hard
		git fetch
		git checkout "${_gitbranch}"
		git merge "remotes/origin/${_gitbranch}"
		msg "The local GIT repo has been updated."
	else
		git clone "${_gitroot}" "${_gitname}"
		cd "${srcdir}/${_gitname}/"
		git checkout "${_gitbranch}"
		msg "GIT checkout done or server timeout"
	fi
	
	echo
	
}

build() {
	
	if [[ "${CARCH}" != "x86_64" ]]; then
		echo "${pkgname} package can be built only in a x86_64 system. Exiting."
		exit 1
	else
		_update_git
		echo
	fi
	
	rm -rf "${srcdir}/${_gitname}_build/" || true
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"
	cd "${srcdir}/${_gitname}_build/"
	
	make clean || true
	echo
	
	unset CFLAGS
	unset CPPFLAGS
	unset LDFLAGS
	
	./autogen.sh
	echo
	
	./configure --enable-manpages --sysconfdir="/etc" --libexecdir="/usr/lib" --libdir="/usr/lib"
	echo
	
	make
	echo
	
}

package() {
	
	cd "${srcdir}/${_gitname}_build/"
	make DESTDIR="${pkgdir}/" install
	echo
	
	## Install gummiboot example configuration files
	install -d "${pkgdir}/usr/lib/gummiboot/loader/entries/"
	install -D -m0644 "${srcdir}/loader.conf" "${pkgdir}/usr/lib/gummiboot/loader/loader.conf"
	install -D -m0644 "${srcdir}/arch.conf" "${pkgdir}/usr/lib/gummiboot/loader/entries/arch.conf"
	
}

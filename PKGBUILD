# Maintainer: Keshav Padram <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

_gitroot="git://anongit.freedesktop.org/gummiboot"
_gitname="gummiboot"
_gitbranch="master"

_pkgname="gummiboot"
pkgname="${_pkgname}-git"

pkgver=a0a53b2
pkgrel=2
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

source=("${_gitname}::git+${_gitroot}#branch=${_gitbranch}"
        'loader.conf'
        'arch.conf')

sha1sums=('SKIP'
          '82a59f90d9138c26f8db52bb8e94991602cf1edd'
          'aff6e152c3f7494e6113a8e2f073810366433015')

pkgver() {
	cd "${srcdir}/${_gitname}/"
	git describe --always | sed 's|-|.|g'
}

build() {
	
	if [[ "${CARCH}" != "x86_64" ]]; then
		echo "${pkgname} package can be built only in a x86_64 system. Exiting."
		exit 1
	fi
	
	rm -rf "${srcdir}/${_gitname}_build/" || true
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"
	cd "${srcdir}/${_gitname}_build/"
	
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	sed 's|-DGNU_EFI_USE_MS_ABI|-DGNU_EFI_USE_MS_ABI -maccumulate-outgoing-args|g' -i "${srcdir}/${_gitname}_build/Makefile.am" || true
	
	# sed 's|EFI_STATUS efi_main|EFI_STATUS EFIAPI efi_main|g' -i "${srcdir}/${_gitname}_build/src/efi/gummiboot.c" || true
	
	./autogen.sh
	echo
	
	./configure --enable-manpages --sysconfdir="/etc" --libexecdir="/usr/lib" --libdir="/usr/lib" --bindir="/usr/bin" --sbindir="/usr/bin"
	echo
	
	make V=1 -j1
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

# Maintainer: Keshav Padram Amburay <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

_gitroot="git://anongit.freedesktop.org/gummiboot"
_gitname="gummiboot"
_gitbranch="master"

_pkgname="gummiboot"
pkgname="${_pkgname}-git"

pkgver=35.7.g5d85fe4
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

source=("${_gitname}::git+${_gitroot}#branch=${_gitbranch}"
        'loader.conf'
        'arch.conf')

sha1sums=('SKIP'
          '7a44df90e4988254c518faae61a0aa259b09a3f2'
          '99b7cd4160ab039f63ce7d8d1e05b275aa2b2965')

pkgver() {
	cd "${srcdir}/${_gitname}/"
	echo "$(git describe --tags)" | sed -e 's|-|.|g'
}

build() {
	
	rm -rf "${srcdir}/${_gitname}_build/" || true
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"
	cd "${srcdir}/${_gitname}_build/"
	
	## Unset all compiler FLAGS
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
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
	
	## Strip all debug code from /usr/bin/gummiboot
	strip "${pkgdir}/usr/bin/gummiboot"
	
	## Install gummiboot example configuration files
	install -d "${pkgdir}/usr/lib/gummiboot/loader/entries/"
	install -D -m0644 "${srcdir}/loader.conf" "${pkgdir}/usr/lib/gummiboot/loader/loader.conf"
	install -D -m0644 "${srcdir}/arch.conf" "${pkgdir}/usr/lib/gummiboot/loader/entries/arch.conf"
	
}

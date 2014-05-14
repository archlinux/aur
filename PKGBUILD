# Maintainer: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

_gitroot="git://anongit.freedesktop.org/gummiboot"
_gitname="gummiboot"
_gitbranch="master"

_pkgname="gummiboot"
pkgname="${_pkgname}-git"

pkgver=45
pkgrel=1
pkgdesc="Simple text-mode UEFI Boot Manager - GIT Version"
url="http://freedesktop.org/wiki/Software/gummiboot"
arch=('x86_64' 'i686')
license=('LGPL2.1')

makedepends=('git' 'gnu-efi-libs' 'docbook-xsl')
depends=('util-linux' 'dosfstools')
optdepends=('mactel-boot: For bless command in Apple Mac systems')

conflicts=("${_pkgname}" 'gummiboot-efi' 'gummiboot-efi-git')
provides=("${_pkgname}=${pkgver}" "gummiboot-efi=${pkgver}" "gummiboot-efi-git=${pkgver}")

options=('!strip' '!makeflags')
install="${_pkgname}.install"

source=("${_gitname}::git+${_gitroot}#branch=${_gitbranch}"
        'gummiboot-allow-arch-specific-default-entry.patch'
        'loader.conf'
        'arch.conf')

sha1sums=('SKIP'
          '9bf77c97911cc571aab6ced7742540ec1682cecd'
          '9a28643459a6d11631089f265921212e6f897591'
          '1ffc417fb2e1db6c5b7720831a9ab6b989c4aadb')

pkgver() {
	cd "${srcdir}/${_gitname}/"
	echo "$(git describe --tags)" | sed -e 's|-|.|g'
}

prepare() {
	
	rm -rf "${srcdir}/${_gitname}_build/" || true
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"
	
	cd "${srcdir}/${_gitname}_build/"
	
	# patch -Np1 -i "${srcdir}/gummiboot-allow-arch-specific-default-entry.patch" || true
	# echo
	
}

build() {
	
	cd "${srcdir}/${_gitname}_build/"
	
	## Unset all compiler FLAGS
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	./autogen.sh
	echo
	
	./configure \
		--enable-manpages \
		--bindir="/usr/bin" \
		--sbindir="/usr/bin" \
		--sysconfdir="/etc" \
		--libdir="/usr/lib" \
		--libexecdir="/usr/lib" \
		--with-efi-libdir="/usr/lib" \
		--with-efi-ldsdir="/usr/lib" \
		--with-efi-includedir="/usr/include"
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

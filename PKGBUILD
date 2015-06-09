# Maintainer : Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Hokum <hokum_at_mail_dot_ru>

_gitroot="http://git.code.sf.net/p/gptfdisk/code"
_gitname="gptfdisk"
_gitbranch="master"

_pkgname="gptfdisk"
pkgname="${_pkgname}-git"

pkgver=1.0.0.124.8017e08
pkgrel=1
pkgdesc="A text-mode partitioning tool that works on Globally Unique Identifier (GUID) Partition Table (GPT) disks - GIT Version"
arch=('i686' 'x86_64')
url="http://www.rodsbooks.com/gdisk/"
makedepends=('git')
depends=('gcc-libs' 'util-linux' 'popt' 'ncurses')
license=('GPL2')
options=('strip' '!emptydirs' 'zipman' '!libtool' 'docs')

conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")

source=("${_gitname}::git+${_gitroot}#branch=${_gitbranch}")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}/"
	
	_ACTUAL_VER="$(grep '#define GPTFDISK_VERSION' "${srcdir}/${_gitname}/support.h" | awk '{print $3}' | sed 's|"||g')"
	echo "${_ACTUAL_VER}.$(git rev-list --count HEAD).$(git describe --always)" | sed -e 's|-|.|g'
	
	unset _ACTUAL_VER
}

build() {
	
	rm -rf "${srcdir}/${_gitname}_build/" || true
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"
	
	cd "${srcdir}/${_gitname}_build/"
	
	git clean -x -d -f
	echo
	
	make V=1
	echo
	
}

package() {
	
	cd "${srcdir}/${_gitname}_build/"
	
	install -Dp -m0755 "${srcdir}/${_gitname}_build/gdisk" "${pkgdir}/usr/bin/gdisk"
	install -Dp -m0755 "${srcdir}/${_gitname}_build/cgdisk" "${pkgdir}/usr/bin/cgdisk"
	install -Dp -m0755 "${srcdir}/${_gitname}_build/sgdisk" "${pkgdir}/usr/bin/sgdisk"
	install -Dp -m0755 "${srcdir}/${_gitname}_build/fixparts" "${pkgdir}/usr/bin/fixparts"
	
	install -Dp -m0644 "${srcdir}/${_gitname}_build/gdisk.8" "${pkgdir}/usr/share/man/man8/gdisk.8"
	install -Dp -m0644 "${srcdir}/${_gitname}_build/cgdisk.8" "${pkgdir}/usr/share/man/man8/cgdisk.8"
	install -Dp -m0644 "${srcdir}/${_gitname}_build/sgdisk.8" "${pkgdir}/usr/share/man/man8/sgdisk.8"
	install -Dp -m0644 "${srcdir}/${_gitname}_build/fixparts.8" "${pkgdir}/usr/share/man/man8/fixparts.8"
	
	install -Dp -m0644 "${srcdir}/${_gitname}_build/README" "${pkgdir}/usr/share/${_pkgname}/README"
	install -Dp -m0644 "${srcdir}/${_gitname}_build/NEWS" "${pkgdir}/usr/share/${_pkgname}/NEWS"
	
}

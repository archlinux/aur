# Maintainer : Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Hokum <hokum_at_mail_dot_ru>

_pkgname="gptfdisk"
pkgname="${_pkgname}-git"

pkgver=1.0.0.136.4216648
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

source=("gptfdisk::git+http://git.code.sf.net/p/gptfdisk/code#branch=master")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}/"
	
	_ACTUAL_VER="$(grep '#define GPTFDISK_VERSION' "${srcdir}/${_pkgname}/support.h" | awk '{print $3}' | sed 's|"||g')"
	echo "${_ACTUAL_VER}.$(git rev-list --count HEAD).$(git describe --always)" | sed -e 's|-|.|g'
	
	unset _ACTUAL_VER
}

prepare() {
	
	cd "${srcdir}/${_pkgname}/"
	
	git clean -x -d -f
	echo
	
	git reset --hard
	echo
	
	sed 's|ncursesw/ncurses.h|ncurses.h|g' -i "${srcdir}/${_pkgname}/gptcurses.cc"
}

build() {
	
	cd "${srcdir}/${_pkgname}/"
	
	make V=1
	echo
	
}

package() {
	
	cd "${srcdir}/${_pkgname}/"
	
	install -Dp -m0755 "${srcdir}/${_pkgname}/gdisk" "${pkgdir}/usr/bin/gdisk"
	install -Dp -m0755 "${srcdir}/${_pkgname}/cgdisk" "${pkgdir}/usr/bin/cgdisk"
	install -Dp -m0755 "${srcdir}/${_pkgname}/sgdisk" "${pkgdir}/usr/bin/sgdisk"
	install -Dp -m0755 "${srcdir}/${_pkgname}/fixparts" "${pkgdir}/usr/bin/fixparts"
	
	install -Dp -m0644 "${srcdir}/${_pkgname}/gdisk.8" "${pkgdir}/usr/share/man/man8/gdisk.8"
	install -Dp -m0644 "${srcdir}/${_pkgname}/cgdisk.8" "${pkgdir}/usr/share/man/man8/cgdisk.8"
	install -Dp -m0644 "${srcdir}/${_pkgname}/sgdisk.8" "${pkgdir}/usr/share/man/man8/sgdisk.8"
	install -Dp -m0644 "${srcdir}/${_pkgname}/fixparts.8" "${pkgdir}/usr/share/man/man8/fixparts.8"
	
	install -Dp -m0644 "${srcdir}/${_pkgname}/README" "${pkgdir}/usr/share/${_pkgname}/README"
	install -Dp -m0644 "${srcdir}/${_pkgname}/NEWS" "${pkgdir}/usr/share/${_pkgname}/NEWS"
	
}

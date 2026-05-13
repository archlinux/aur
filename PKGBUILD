# Maintainer: SummerBreeze630 <xzwf2003 AT 163 DOT com>

_pkgbase=wizstr
pkgname=${_pkgbase}-git
pkgver=2026.1.1.r1.gb5d9c9ac
pkgrel=3
pkgdesc="C++ string processing library"
arch=('x86_64' 'aarch64')
url="https://gitee.com/libbylg/str"
license=('MulanPSL-2.0')
depends=('gcc-libs')
makedepends=('cmake')
conflicts=("wizstr")
_srcdir="${pkgname}${_archivever}"
source=("${_srcdir}::git+${url}.git")
sha256sums=('SKIP')
options=('staticlibs')

pkgver() {
    cd ${srcdir}/${_srcdir}
    git describe --long --tags --abbrev=8 |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g;s/rc.\.//'
}

build() {
	mkdir -p build

	cmake -B build \
		-S "${_srcdir}" \
		-DWIZSTR_NAMESPACE=${_pkgbase} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release

	cmake --build build \
		-j $(nproc)
}

package() {
	DESTDIR="${pkgdir}" \
		cmake --build build \
		--target install

	install -Dm644 "${_srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

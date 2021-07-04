# Maintainer: Javier Tia <javier dot tia at gmail dot com>
# Old Maintainer: Manuel Mendez <mmendez534@gmail.com>

pkgname=include-what-you-use
pkgver=0.16
pkgrel=2
_clang_major=12
_clang_minor=0
_clang_ver="${_clang_major}.${_clang_minor}"
pkgdesc="A tool for use with clang to analyze #includes in C and C++ source files"
url="http://include-what-you-use.org"
license=('LLVM Release License')
source=("https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('2923e18c40ddc5c03458b896d991adde03d489c6645ecc3cc4f69a508e323534afdef3233943e99533ffc21c64a10a8a5c635dc4797a61edf09d0a7a918a3cd5')
arch=('x86_64')
_min="${_clang_ver}"
_max=$((_clang_major + 1)).0
depends=("clang>=${_min}" "clang<${_max}" 'python3')
makedepends=("clang>=${_min}" "clang<${_max}" "cmake" "llvm>=${_min}" "llvm<${_max}")
install=iwyu.install

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	rm -rf build && mkdir build && cd build
	cmake -DCMAKE_PREFIX_PATH=/usr/lib -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"

	make install DESTDIR=${pkgdir}

	install -Dm755 ../fix_includes.py "${pkgdir}/usr/bin/iwyu-fix-includes"
	sed -i "s|^#!/usr/bin/python$|#!/usr/bin/python2|" "${pkgdir}/usr/bin/iwyu-fix-includes"
	rm -f "${pkgdir}/usr/bin/fix_includes.py"

	install -Dm755 ../iwyu_tool.py "${pkgdir}/usr/bin/iwyu-tool"
	sed -i "s|^#!/usr/bin/python$|#!/usr/bin/python2|" "${pkgdir}/usr/bin/iwyu-tool"
	rm -f "${pkgdir}/usr/bin/iwyu_tool.py"
}

# vim:set ts=2 sw=2 et:

# Maintainer: Javier Tia <javier dot tia at gmail dot com>
# Old Maintainer: Manuel Mendez <mmendez534@gmail.com>

pkgname=include-what-you-use
pkgver=0.20
pkgrel=1
_clang_major=16
_clang_minor=0
_clang_ver="${_clang_major}.${_clang_minor}"
pkgdesc="A tool for use with clang to analyze #includes in C and C++ source files"
url="http://include-what-you-use.org"
license=('LLVM Release License')
source=("https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('77195dc36338a37d3397c78701d81e52fc1c6a3441979fa016f154b0fc860598959e6430e78a51bbf9049f6b2bb62956e50f5531ac5c94c6554e2383ace540f5')
arch=('x86_64')
_min="${_clang_ver}"
_max=$((_clang_major + 1)).0
depends=("clang>=${_min}" "clang<${_max}" 'python3')
makedepends=("clang>=${_min}" "clang<${_max}" "cmake" "llvm>=${_min}" "llvm<${_max}" "ninja")
install=iwyu.install

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	rm -rf build && mkdir build && cd build
	cmake -G "Ninja" ../
  ninja
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"

	DESTDIR="${pkgdir}" ninja install

	install -Dm755 ../fix_includes.py "${pkgdir}/usr/bin/iwyu-fix-includes"
	install -Dm755 ../iwyu_tool.py "${pkgdir}/usr/bin/iwyu-tool"

  # ninja
	mv "${pkgdir}/usr/local/bin/include-what-you-use" "${pkgdir}/usr/bin/include-what-you-use"
  mv "${pkgdir}/usr/local/share" "${pkgdir}/usr"
	rm -f "${pkgdir}/usr/local/bin/fix_includes.py"
	rm -f "${pkgdir}/usr/local/bin/iwyu_tool.py"
  rmdir "${pkgdir}/usr/local/bin"
  rmdir "${pkgdir}/usr/local"
}

# vim:set ts=2 sw=2 et:

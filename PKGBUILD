# Maintainer: Javier Tia <javier dot tia at gmail dot com>
# Old Maintainer: Manuel Mendez <mmendez534@gmail.com>

pkgname=include-what-you-use
pkgver=0.19
pkgrel=1
_clang_major=15
_clang_minor=0
_clang_ver="${_clang_major}.${_clang_minor}"
pkgdesc="A tool for use with clang to analyze #includes in C and C++ source files"
url="http://include-what-you-use.org"
license=('LLVM Release License')
source=("https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('0847ae898696b51540ab9f5715e69bae67db42409d60205227d543ba6597b12cc2ea5bf68a3315c31f22e7186e05c06a86f5ae5b893c23bfe4cd9ef6f06ccddc')
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

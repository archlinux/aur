# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=codevis-db-git
pkgver=r8.040d708
pkgrel=1
pkgdesc="an analysis and visualization tool designed to assist in code maintenance for C++ codebases"
arch=('x86_64')
url="https://gitlab.com/CodethinkLabs/codevis/codevis"
license=('Apache')
depends=('sqlite' 'catch2' 'qt5-base' 'lcov' 'clang' 'boost-libs' 'qt5-webengine' 'python' 'qt5-svg' 'llvm-libs' 'glibc' 'gcc-libs' 'bash')
makedepends=('git' 'cmake' 'llvm' 'boost' 'extra-cmake-modules')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.com/CodethinkLabs/codevis/codevis.git' 'git+https://github.com/tcanabrava/configuration-parser.git' 'git+https://github.com/tcanabrava/backward-cpp.git' 'git+https://github.com/tcanabrava/soci.git')
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-db-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-db-git}"
	git submodule init
	git config submodule.submodules/configuration-parser.url "$srcdir/configuration-parser"
	git config submodule.submodules/backward-cpp.url "$srcdir/backward-cpp"
	git config submodule.thirdparty/soci.url "$srcdir/soci"
	git -c protocol.file.allow=always submodule update
}

build() {
	cmake -B build -S "${pkgname%-db-git}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}

# Maintainer: inhzus <inhzus@gmail.com>
pkgname=cppinsights-git
pkgver=r4.524cc07
pkgrel=1
pkgdesc="C++ Insights - See your source code with the eyes of a compiler"
arch=('x86_64')
url="https://cppinsights.io"
license=('MIT')
groups=()
depends=(llvm-libs clang)
makedepends=('git' 'sed' 'ninja')
provides=("cppinsights")
conflicts=("cppinsights")
replaces=()
backup=()
options=()
# install=
source=("$pkgname::git+https://github.com/andreasfertig/cppinsights.git")
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname}"
    test -d build || mkdir build
    cd build
    cmake -G"Ninja" ..
    sed -i "s/-isystem/-I/g" build.ninja
    sed -i "s|LINK_LIBRARIES.*|LINK_LIBRARIES=-L/usr/lib -lclang-cpp -lLLVM-10|" build.ninja
    ninja
}

package() {
	cd "$srcdir/${pkgname}/build"
    install -Dm755 "insights" "${pkgdir}/usr/bin/insights"
}


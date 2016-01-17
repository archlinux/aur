# Maintainer: Michael Spencer <sonrisesoftware@gmail.com>

_pkgname=papyros-terminal
pkgname=$_pkgname-git
pkgver=0.1.0.r0.g8c84376
pkgrel=1
pkgdesc="The terminal app for Papyros"
arch=("i686" "x86_64")
url="https://github.com/papyros/terminal-app"
license=("GPL")
depends=("qt5-base-git" "qt5-declarative" "qml-material-git" "ttf-roboto-mono-powerline-git"
         "libpapyros-git")
makedepends=("git" "cmake" "extra-cmake-modules")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/papyros/terminal-app.git")
sha256sums=("SKIP")

pkgver() {
    cd "$_pkgname"
    # cutting off 'foo-' prefix that presents in the git tag
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake "$srcdir/$_pkgname" -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}

# Additional functions to generate a changelog

changelog() {
    cd "$_pkgname"
  	git log $1..HEAD --no-merges --format=" * %s"
}

gitref() {
    cd "$_pkgname"
  	git rev-parse HEAD
}

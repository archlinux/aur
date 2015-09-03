# Maintainer: Riley Trautman <asonix.dev@gmail.com>

_pkgname=liri-browser
pkgname=$_pkgname-git
pkgver=git
pkgrel=1
pkgdesc="A UI framework for QtQuick implementing Material Design"
arch=("i686" "x86_64")
url="https://github.com/liri-browser/liri-browser"
license=("GPLv3")
depends=("qt5-base" "qt5-webengine" "qml-material-git")
makedepends=("git")
provides=("$_pkgname" "$pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+https://github.com/liri-browser/liri-browser.git"
        "liri-browser" "liri-browser.desktop")
sha256sums=("SKIP" "SKIP" "SKIP")

pkgver() {
    cd "$pkgname"
    # cutting off 'foo-' prefix that presents in the git tag
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
	mkdir -p build
	cd build
	qmake "$srcdir/$pkgname"
	make
}

package() {
	cd build
	make INSTALL_ROOT="$pkgdir" install
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/applications
  install -m755 ../liri-browser "$pkgdir"/usr/bin/liri-browser
  install -m755 ../liri-browser.desktop "$pkgdir"/usr/share/applications/liri-browser.desktop
}

# Additional functions to generate a changelog

changelog() {
    cd "$pkgname"
    git log $1..HEAD --no-merges --format=" * %s"
}

gitref() {
    cd "$pkgname"
    git rev-parse HEAD
}

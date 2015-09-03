# Maintainer: Riley Trautman <asonix.dev@gmail.com>

pkgname=liri-browser
pkgver=0.2
pkgrel=1
pkgdesc="A Web Browser using the QML Material framework from the Papyros Project"
arch=("i686" "x86_64")
url="https://github.com/liri-browser/liri-browser"
license=("GPLv3")
depends=("qt5-base" "qt5-webengine" "qml-material-git")
makedepends=("git")
provides=("$pkgname")
source=("$pkgname::git+https://github.com/liri-browser/liri-browser.git"
        "liri-browser.sh" "liri-browser.desktop")
sha256sums=("SKIP" "SKIP" "SKIP")

prepare() {
  pushd "$(pwd)" > /dev/null
  cd "$srcdir/$pkgname"
  git checkout v$pkgver
  popd > /dev/null

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

  install -m755 ../liri-browser.sh "$pkgdir"/usr/bin/liri-browser
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

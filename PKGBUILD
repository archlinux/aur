# Maintainer: Riley Trautman <asonix.dev@gmail.com>

_pkgname=liri-browser
pkgname=${_pkgname}-git
pkgver=0.3.r243.gc39f696
pkgrel=1
pkgdesc="A Web Browser using the QML Material framework from the Papyros Project"
arch=("i686" "x86_64")
url="https://github.com/liri-project/liri-browser"
license=("GPLv3")
depends=("qt5-base" "qt5-webengine" "qt5-multimedia" "qml-material-git")
makedepends=("git")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install=${_pkgname}.install
source=("${_pkgname}::git+https://github.com/liri-project/liri-browser.git"
"liri-browser.sh" "liri-browser.desktop" "liri-browser.install")
sha256sums=("SKIP" "SKIP" "SKIP" "SKIP")

pkgver() {
  cd "${_pkgname}"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  qmake "liri-browser.pro"
  make
}

package() {
  cd "${_pkgname}"
  make INSTALL_ROOT="$pkgdir" install

  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/applications

  for i in 16x16 22x22 32x32 48x48 64x64 128x128 256x256; do
    install -Dm644 "$srcdir"/"${_pkgname}"/icons/liri-browser.png \
      "$pkgdir"/usr/share/icons/hicolor/$i/apps/liri-browser.png
  done
  install -m755 ../liri-browser.sh \
    "$pkgdir"/usr/bin/liri-browser
  install -m755 ../liri-browser.desktop \
    "$pkgdir"/usr/share/applications/liri-browser.desktop
}

# Additional functions to generate a changelog

changelog() {
  cd "${_pkgname}"
  git log $1..HEAD --no-merges --format=" * %s"
}

gitref() {
  cd "${_pkgname}"
  git rev-parse HEAD
}

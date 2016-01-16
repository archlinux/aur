# Maintainer: Michael Spencer <sonrisesoftware@gmail.com>

_pkgname=liri-player
pkgname=${_pkgname}-git
pkgver=r21.9f79ce9
pkgrel=1
pkgdesc="A Material Design VLC based media player"
arch=("i686" "x86_64")
url="https://github.com/liri-project/liri-player"
license=("GPLv3")
depends=("qt5-base" "qt5-declarative" "qt5-quickcontrols" "qt5-multimedia" "vlc"
         "qml-material-git")
makedepends=("git")
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=("${_pkgname}::git+https://github.com/liri-project/liri-player.git"
        "qmlvlc::git+https://github.com/RSATom/QmlVlc.git"
        "yalibvlcwrapper::git+https://github.com/RSATom/ya-libvlc-wrapper.git"
        "libvlcsdk::git+https://github.com/RSATom/libvlc-sdk.git"
        "liri-player.desktop")
sha256sums=("SKIP" "SKIP" "SKIP" "SKIP" "SKIP")

pkgver() {
  cd "$srcdir/${_pkgname}"

  ( set -o pipefail
    git describe --long 2>/dev/null | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  pushd $(pwd) >> /dev/null

  cd "$srcdir/${_pkgname}"
  git submodule init
  git config submodule.dependencies/QmlVlc.url "$srcdir/qmlvlc"
  git submodule update

  cd "dependencies/QmlVlc"
  git submodule init
  git config submodule.libvlc_wrapper.url "$srcdir/yalibvlcwrapper"
  git submodule update

  cd "libvlc_wrapper"
  git submodule init
  git config submodule.libvlc-sdk.url "$srcdir/libvlcsdk"
  git submodule update

  popd >> /dev/null

  mkdir -p build
  cd build
  qmake "$srcdir/${_pkgname}"
  make
}

package() {
  cd build

  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/applications

  install -m755 liri-player \
    "$pkgdir"/usr/bin/liri-player
  install -m755 ../liri-player.desktop \
    "$pkgdir"/usr/share/applications/liri-player.desktop
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

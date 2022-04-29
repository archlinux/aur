# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=synthclone
pkgname="$_pkgname-qt5-git"
pkgver=0.3.0.r19.gd8dab9e
pkgrel=1
pkgdesc='A tool to automate sampling of MIDI-capable instruments (Qt5 port, git version)'
arch=(x86_64)
url='https://github.com/edogawa23/synthclone.git'
license=(GPL LGPL)
depends=(gcc-libs glibc qt5-base)
makedepends=(libarchive libsamplerate libsndfile libzip lilv jack portaudio
             portmidi python suil)
provides=($_pkgname $_pkgname-qt5 libsynthclone.so)
conflicts=($_pkgname $_pkgname-qt5)
source=("$_pkgname-qt5::git+https://github.com/edogawa23/synthclone.git#branch=qt5-port")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname-qt5
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^version-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd $_pkgname-qt5
  ./configure --prefix=/usr --skip-api-docs=1
  make
}

package() {
  depends+=(libarchive.so libjack.so liblilv-0.so libportaudio.so libportmidi.so
            libsamplerate.so libsndfile.so libsuil-0.so libzip.so)
  cd $_pkgname-qt5
  make install INSTALL_ROOT="$pkgdir"
}

# Maintainer: Ángel Guzmán Maeso <angel@guzmanmaeso.com>
pkgname=whatly
pkgver=6.8.0
pkgrel=1
pkgdesc="Feature-rich WhatsApp Web desktop client based on Qt WebEngine"
arch=('x86_64')
url="https://github.com/shakaran/whatly"
license=('MIT')
depends=('qt6-webengine' 'qt6-svg' 'qt6-positioning' 'qt6-webchannel')
makedepends=('cmake' 'ninja' 'qt6-tools' 'git')
provides=('whatly')
conflicts=('whatly-bin' 'whatly-git')
# The release tarball does not carry the libnotify-qt submodule, so build from
# the tag over git and wire the submodule in from a second source.
source=("$pkgname::git+https://github.com/shakaran/whatly.git#tag=v$pkgver"
        "libnotify-qt::git+https://github.com/ahm-forks/libnotify-qt.git")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  git submodule init
  git config submodule.src/libnotify-qt.url "$srcdir/libnotify-qt"
  git -c protocol.file.allow=always submodule update
}

build() {
  cmake -S "$srcdir/$pkgname" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

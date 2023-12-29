# Maintainer: Yuriy Davygora <davygora@gmail.com>

_pkgname=koboredux
pkgname=$_pkgname-git
pkgver=0.7.5.1
pkgrel=2
pkgdesc='Arcade style 2D shooter'
arch=(x86_64)
url='http://koboredux.com/'
license=(GPL2)

makedepends=(
  'base-devel'
  'git'
  'cmake'
)
depends=(
  'sdl'
  'audiality2'
)

conflicts=(
    "$_pkgname"
)
provides=(
    "$_pkgname"
)

source=("git+https://github.com/olofson/koboredux#tag=v$pkgver")
sha256sums=(SKIP)

pkgver() {
  cd "$_pkgname"
  git describe --tags --abbrev=0 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git checkout -b v$pkgver v$pkgver
}

build() {
  rm -rf build; mkdir build; cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr "$srcdir/$_pkgname"
  make
}

package() {
  cd build
  DESTDIR="$pkgdir" make install
  cd ../$_pkgname

  # install .desktop file
  install -D -m644 "icons/net.olofson.koboredux.desktop" \
    "$pkgdir/usr/share/applications/net.olofson.koboredux.desktop"

  # install icons
  install -Dm644 "icons/koboredux.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/koboredux.png"
}

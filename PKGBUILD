# Maintainer: Mikołaj "D1SoveR" Banasik <d1sover@gmail.com>
pkgname='luxtorpeda-git'
pkgver=59.0.0.r365.8b9b6a7
pkgrel=1
pkgdesc='Steam Play compatibility tool to run games using native Linux engines'
arch=('x86_64' 'i686')
url='https://github.com/luxtorpeda-dev/luxtorpeda'
license=('GPL2')
depends=('libusb' 'sdl2' 'sdl2_image')
makedepends=('git' 'rust')
optdepends=('steam: The Steam client')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("git+${url}.git"
        'reproducible-build.patch'
        'size-optimisations.patch')
sha256sums=('SKIP'
            '38a0cc7ec879a2f2dec10adf98d9d76ad7ea9a66a097122031f1759a2c4761d1'
            '02fe3f63b7ff6e3f020c61ce02b2f91a8129668bc06aa16ba37709ed755b9334')

pkgver() {
  cd "${pkgname%-git}"
  local base="$(grep -oP '(?<=^version = ")[^"]+(?="$)' Cargo.toml)"
  local revision_count="$(git rev-list --count HEAD)"
  local revision_commit="$(git rev-parse --short HEAD)"
  echo "$base.r$revision_count.$revision_commit"
}

prepare() {
  cd "${pkgname%-git}"
  patch -Np1 -i "$srcdir/reproducible-build.patch"
  patch -Np1 -i "$srcdir/size-optimisations.patch"
}

build() {
  cd "${pkgname%-git}"
  mkdir -p "target/release"
  make luxtorpeda
}

check() {
  cd "${pkgname%-git}"
  make test
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}

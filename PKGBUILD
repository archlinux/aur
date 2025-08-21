# Maintainer: Zenn <mine.minefis@gmail.com>
pkgname=wl_shimeji-git
pkgver=0.0.2.r90.g9ad350f
pkgrel=1
pkgdesc="Shimeji reimplementation for Wayland in C"
arch=('x86_64')
url="https://github.com/CluelessCatBurger/wl_shimeji"
license=('GPL-2.0')
depends=('python>=3.10' 'python-pillow' 'wayland-compositor')
makedepends=('git' 'libarchive' 'wayland' 'wayland-protocols' 'uthash')
source=("$pkgname::git+https://github.com/CluelessCatBurger/wl_shimeji.git"
        "jsonh::git+https://github.com/sheredom/json.h"
        "qoi::git+https://github.com/phoboslab/qoi"
        "py-qoi::git+https://github.com/mathpn/py-qoi")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  git submodule init
  git config submodule.src/third_party/json.h.url "$srcdir/jsonh"
  git config submodule.src/third_party/qoi.url "$srcdir/qoi"
  git config submodule.src/shimejictl/qoi.url "$srcdir/py-qoi"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}

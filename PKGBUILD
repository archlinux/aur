# Maintainer: willemw <willemw12@gmail.com>

pkgname=gnofract4d-git
pkgver=4.4.r0.gf6208cd
pkgrel=1
pkgdesc='Create beautiful fractal images'
arch=(any)
url=https://fract4d.github.io/gnofract4d
license=(BSD)
depends=(gtk4 libjpeg libpng libxml2 python-cairo python-gobject)
makedepends=(git meson)
optdepends=('ffmpeg: to create videos')
checkdepends=(python-pytest)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/fract4d/gnofract4d.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  #arch-meson _build
  meson setup --prefix=/usr --buildtype=plain _build
  meson compile -C _build
}

check() {
  cd $pkgname
  #meson test -C build
  ./test.py
}

package() {
  cd $pkgname
  #install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 doc/${pkgname%-git}.1 -t "$pkgdir/usr/share/man/man1"
  meson install -C _build --destdir "$pkgdir"
}

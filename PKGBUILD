# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Contributor: Andrea Feletto <andrea@andreafeletto.com>

pkgname=river-noxwayland
pkgver=0.2.4
pkgrel=1
pkgdesc='A dynamic tiling wayland compositor'
arch=('x86_64')
url='https://github.com/riverwm/river'
license=('GPL3')
depends=('libevdev'
         'libxkbcommon'
         'mesa'
         'pixman'
         'wayland'
         'wlroots')
makedepends=('scdoc'
             'wayland-protocols'
             'zig')
optdepends=('polkit: access seat through systemd-logind')
source=("https://github.com/riverwm/river/releases/download/v$pkgver/river-$pkgver.tar.gz"{,.sig})
validpgpkeys=('5FBDF84DD2278DB2B8AD8A5286DED400DDFD7A11') # Isaac Freund <mail@isaacfreund.com>
sha256sums=('26c1c41a65ce3804069afad6988410515cf478d2b76303ebc699766d3d4dc69f'
            'SKIP')
provides=('river')
conflicts=('river')

build() {
  cd "river-$pkgver"
  
  DESTDIR="build" zig build \
    --prefix /usr \
    --search-prefix /usr \
    -Dcpu=native \
    -Dpie \
    -Drelease-safe
}

check() {
  cd "river-$pkgver"
  
  zig build test \
    --prefix /usr \
    --search-prefix /usr \
    -Dcpu=native \
    -Dpie \
    -Drelease-safe
}

package() {
  cd "river-$pkgver"

  cp -a build/* "$pkgdir"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 contrib/river.desktop -t "$pkgdir/usr/share/wayland-sessions"

  install -d "$pkgdir/usr/share/$pkgname"
  cp -a example "$pkgdir/usr/share/$pkgname"
}

pkgname=river-noxwayland
pkgver=0.2.5
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
         'wlroots0.16')
makedepends=('scdoc'
             'wayland-protocols'
             'zig')
optdepends=('polkit: access seat through systemd-logind')
source=("https://github.com/riverwm/river/releases/download/v$pkgver/river-$pkgver.tar.gz"{,.sig})
validpgpkeys=('5FBDF84DD2278DB2B8AD8A5286DED400DDFD7A11') # Isaac Freund <mail@isaacfreund.com>
sha256sums=('SKIP'
            '6c8786d9bcc373d732493bb325a689d4b9b73536d77452ee95a7ba9ddfa47815')
provides=('river')
conflicts=('river')

build() {
  cd "river-$pkgver"

  export PKG_CONFIG_PATH='/usr/lib/wlroots0.16/pkgconfig'
  DESTDIR="build" zig build \
    --prefix /usr \
    --search-prefix /usr \
    -Dcpu=native \
    -Dpie \
    -Doptimize=ReleaseSafe
}

check() {
  cd "river-$pkgver"

  zig build test \
    --prefix /usr \
    --search-prefix /usr \
    -Dcpu=native \
    -Dpie \
    -Doptimize=ReleaseSafe
}

package() {
  depends+=(libwlroots.so=11)
  cd "river-$pkgver"

  cp -a build/* "$pkgdir"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 contrib/river.desktop -t "$pkgdir/usr/share/wayland-sessions"

  install -d "$pkgdir/usr/share/$pkgname"
  cp -a example "$pkgdir/usr/share/$pkgname"
}

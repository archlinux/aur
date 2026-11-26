# Maintainer: Martin Kopecký <kopecky@thekrew.app>
pkgname=spot-bin
pkgver=0.8.1
pkgrel=1
pkgdesc='TOML+CSS dialog runtime for Wayland (layer-shell overlays), prebuilt binary'
arch=('x86_64')
url='https://github.com/KopyTKG/spot'
license=('MIT')
depends=('glibc' 'gtk4' 'gtk4-layer-shell')
provides=('spot')
conflicts=('spot' 'spot-git')

_release="$url/releases/download/v$pkgver"
# The tagged source archive supplies LICENSE, README.md and examples/.
source=("spot-linux-x64-$pkgver::$_release/spot-linux-x64"
        "spot-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=("spot-linux-x64-$pkgver")
sha256sums=('1b19a1b8a6d5af65a9586f7c5a09ac085b27fa9686897afe6a96c65a3be0b23a'
            'dc24b90d7f9868aee1d019d5dc07c555a508880f2bcd3c94e46560bef93642ff')

package() {
  install -Dm755 "$srcdir/spot-linux-x64-$pkgver" "$pkgdir/usr/bin/spot"
  cd "$srcdir/spot-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/spot/README.md"
  # examples/ has a demo/ subdirectory, which `install -t ... examples/*` would refuse
  cp -r examples "$pkgdir/usr/share/doc/spot/"
  [ ! -d docs ] || cp -r docs "$pkgdir/usr/share/doc/spot/"   # absent before v0.2.1
  [ ! -f packaging/systemd/spot.service ] ||   # absent before v0.4.1
    install -Dm644 packaging/systemd/spot.service "$pkgdir/usr/lib/systemd/user/spot.service"
}

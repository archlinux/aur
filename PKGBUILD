# Maintainer: Martin Kopecký <kopecky@thekrew.app>
pkgname=spot-bin
pkgver=0.5.0
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
sha256sums=('93a61b558f30a00f55fdcb7194b631679dbd86998c17ee3683c3cd492654a7c9'
            '94e6dd6577771b0d7538e853ef23e600e70a2b1e9d1e2fcb0379855c1356392b')

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

# Maintainer: Martin Kopecký <kopecky@thekrew.app>
pkgname=spot-bin
pkgver=0.9.0
pkgrel=1
pkgdesc='TOML+CSS dialog runtime for Wayland (layer-shell overlays), prebuilt binary'
arch=('x86_64')
url='https://github.com/KopyTKG/spot'
license=('MIT')
depends=('glibc' 'gtk4' 'gtk4-layer-shell')
optdepends=('wl-clipboard: submit.copy')
provides=('spot')
conflicts=('spot' 'spot-git')

_release="$url/releases/download/v$pkgver"
# The tagged source archive supplies LICENSE, README.md and examples/.
source=("spot-linux-x64-$pkgver::$_release/spot-linux-x64"
        "spot-mod-host-linux-x64-$pkgver::$_release/spot-mod-host-linux-x64"
        "spot-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=("spot-linux-x64-$pkgver" "spot-mod-host-linux-x64-$pkgver")
sha256sums=('fb08cc56effa606c35a1a0e2b622b679848bdfde0a3402fac74328b52bdd6435'
            'a35d6e6ded9b93e97f073725641d4a39193cfc0d8884f12fe9b1aea41b66cd7a'
            '99aa8c8a54ae328a82ca1dc0098597dc12e75c20455b41838a8769e0d5564a71')

package() {
  install -Dm755 "$srcdir/spot-linux-x64-$pkgver" "$pkgdir/usr/bin/spot"
  # Beside spot, where it looks for it; runs mods in their sandbox.
  install -Dm755 "$srcdir/spot-mod-host-linux-x64-$pkgver" "$pkgdir/usr/bin/spot-mod-host"
  cd "$srcdir/spot-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/spot/README.md"
  # examples/ has a demo/ subdirectory, which `install -t ... examples/*` would refuse
  cp -r examples "$pkgdir/usr/share/doc/spot/"
  [ ! -d docs ] || cp -r docs "$pkgdir/usr/share/doc/spot/"   # absent before v0.2.1
  [ ! -f packaging/systemd/spot.service ] ||   # absent before v0.4.1
    install -Dm644 packaging/systemd/spot.service "$pkgdir/usr/lib/systemd/user/spot.service"
}

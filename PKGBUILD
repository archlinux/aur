# Maintainer: Martin Kopecký <kopecky@thekrew.app>
pkgname=spot-bin
pkgver=0.9.3
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
sha256sums=('8881fbbfd709563f1db6ac27417dce7b76a682e3437c7e8869fc17eb39867ce5'
            'fb62a5b78e065f1f98220bd5c3f66db2ceb4120d804779d072aa199a0317aa79'
            'e1c4556dd0cc78e91cce3f21f5b7e625f2e7f5e85974f3b36c9a9539490e79d6')

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

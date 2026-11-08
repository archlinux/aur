# Maintainer: Nauris Steins <me@naurissteins.com>
pkgname=veila-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Secure, elegant, and fast Wayland screen locker"
arch=('x86_64')
url="https://github.com/naurissteins/Veila"
license=('GPL-3.0-or-later')
provides=('veila')
conflicts=('veila' 'veila-git')
options=('!debug')
depends=('libxkbcommon' 'pam' 'wayland')
optdepends=('systemd: optional idle/sleep watcher via veila.service'
            'fontconfig: resolve installed font families and script fallback fonts')
backup=('etc/pam.d/veila')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/naurissteins/Veila/releases/download/$pkgver/veila-$pkgver-x86_64-linux.tar.gz"
  "veila.pam"
)
sha256sums=('0e634790cbeb9ecc5e16799a61e080ac186c39e79c5522f9fe8522693406e6dc'
            '2f9b7a7a8a8583ed40969240ee7d0d42ffba4a44b69a7d241bd60634795a8e84')

package() {
  cd "veila-$pkgver-x86_64-linux"

  install -Dm755 bin/veila "$pkgdir/usr/bin/veila"
  ln -s veila "$pkgdir/usr/bin/veilad"

  install -Dm644 share/veila/systemd/veila.service \
    "$pkgdir/usr/lib/systemd/user/veila.service"
  ln -s veila.service "$pkgdir/usr/lib/systemd/user/veilad.service"
  install -Dm644 "$srcdir/veila.pam" "$pkgdir/etc/pam.d/veila"

  local asset_dir asset_file
  for asset_dir in share/veila/fonts share/veila/icons share/veila/systemd share/veila/themes; do
    while IFS= read -r -d '' asset_file; do
      install -Dm644 "$asset_file" "$pkgdir/usr/share/veila/${asset_file#share/veila/}"
    done < <(find "$asset_dir" -type f -print0)
  done

  install -Dm644 README.md "$pkgdir/usr/share/doc/veila/README.md"
  if [[ -f share/man/man1/veila.1 ]]; then
    install -Dm644 share/man/man1/veila.1 "$pkgdir/usr/share/man/man1/veila.1"
  fi
}

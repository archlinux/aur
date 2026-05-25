# Maintainer: Nauris Steins <me@naurissteins.com>
pkgname=veila-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Secure, elegant, and fast Wayland screen locker"
arch=('x86_64')
url="https://github.com/naurissteins/Veila"
license=('GPL-3.0-or-later')
provides=('veila')
conflicts=('veila' 'veila-git')
options=('!debug')
depends=('libxkbcommon' 'pam')
optdepends=('systemd: enable the bundled user services with systemctl --user')
backup=('etc/pam.d/veila')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/naurissteins/Veila/releases/download/$pkgver/veila-$pkgver-x86_64-linux.tar.gz"
  "veila.pam"
)
sha256sums=('351d918ff780a7b2644aa171b85c07cb9cbc3f7a210451e6569c3b96a4d2cdd1'
            '2f9b7a7a8a8583ed40969240ee7d0d42ffba4a44b69a7d241bd60634795a8e84')

package() {
  cd "veila-$pkgver-x86_64-linux"

  install -Dm755 bin/veila "$pkgdir/usr/bin/veila"
  install -Dm755 bin/veilad "$pkgdir/usr/bin/veilad"
  install -Dm755 bin/veila-curtain "$pkgdir/usr/bin/veila-curtain"

  install -Dm644 share/veila/systemd/veilad.service \
    "$pkgdir/usr/lib/systemd/user/veilad.service"
  if [[ -f share/veila/systemd/veila-idle.service ]]; then
    install -Dm644 share/veila/systemd/veila-idle.service \
      "$pkgdir/usr/lib/systemd/user/veila-idle.service"
  fi
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

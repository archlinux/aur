# Maintainer: Nauris Steins <me@naurissteins.com>
pkgname=veila-git
_repo=Veila
pkgver=0.4.1.r0.g0000000
pkgrel=1
pkgdesc="Secure, elegant, and fast Wayland screen locker (latest git)"
arch=('x86_64')
url="https://github.com/naurissteins/Veila"
license=('GPL-3.0-or-later')
provides=('veila')
conflicts=('veila' 'veila-bin')
options=('!debug')
depends=('libxkbcommon' 'pam')
makedepends=('cargo' 'git' 'pkgconf' 'wayland')
optdepends=('systemd: enable the bundled user services with systemctl --user')
backup=('etc/pam.d/veila')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_repo"
  git describe --long --tags --abbrev=7 | sed 's/^v//; s/-/.r/; s/-/./'
}

prepare() {
  cd "$srcdir/$_repo"
  cargo fetch --locked
}

build() {
  cd "$srcdir/$_repo"
  cargo build --frozen --release --workspace
}

package() {
  cd "$srcdir/$_repo"

  install -Dm755 target/release/veila "$pkgdir/usr/bin/veila"
  install -Dm755 target/release/veilad "$pkgdir/usr/bin/veilad"
  install -Dm755 target/release/veila-curtain "$pkgdir/usr/bin/veila-curtain"

  install -Dm644 assets/systemd/veilad.service \
    "$pkgdir/usr/lib/systemd/user/veilad.service"
  install -Dm644 assets/systemd/veila-idle.service \
    "$pkgdir/usr/lib/systemd/user/veila-idle.service"
  install -Dm644 packaging/arch/veila.pam "$pkgdir/etc/pam.d/veila"

  local asset_dir asset_file
  for asset_dir in assets/fonts assets/icons assets/systemd assets/themes; do
    while IFS= read -r -d '' asset_file; do
      install -Dm644 "$asset_file" "$pkgdir/usr/share/veila/${asset_file#assets/}"
    done < <(find "$asset_dir" -type f -print0)
  done

  install -Dm644 README.md "$pkgdir/usr/share/doc/veila/README.md"
  install -Dm644 docs/man/veila.1 "$pkgdir/usr/share/man/man1/veila.1"
}

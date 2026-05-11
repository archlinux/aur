# Maintainer: Nauris Steins <me@naurissteins.com>
pkgname=veila-git
_repo=Veila
pkgver=0.3.0.r0.g0000000
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
optdepends=('systemd: enable the bundled user service with systemctl --user')
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

  install -d "$pkgdir/usr/share/veila"
  cp -R assets/fonts "$pkgdir/usr/share/veila/"
  cp -R assets/icons "$pkgdir/usr/share/veila/"
  cp -R assets/systemd "$pkgdir/usr/share/veila/"
  cp -R assets/themes "$pkgdir/usr/share/veila/"

  install -Dm644 README.md "$pkgdir/usr/share/doc/veila/README.md"
}

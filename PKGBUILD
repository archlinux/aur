# Maintainer: timvisee <3a4fb3964f@sinenomine.email>
# Maintainer: orhun <orhunparmaksiz@gmail.com>
#
# Based on template. Changes made here will be overwritten each release.
# See: https://gitlab.com/timvisee/prs/-/tree/master/pkg/aur/prs-git

pkgname=prs-git
pkgver=0.2.14.r0.gb3f3adf
pkgrel=1
pkgdesc="Secure, fast & convenient password manager CLI using GPG and git to sync (git)"
arch=('any')
url="https://gitlab.com/timvisee/prs"
license=('GPL3')
depends=('gpgme' 'dbus' 'libxcb' 'libxkbcommon' 'skim' 'tomb')
makedepends=('rust' 'python' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')
_prs_cli_features=alias,clipboard,notify,backend-gpgme,select-skim-bin,tomb

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  cargo build --package prs-cli --no-default-features --features $_prs_cli_features --release --locked
}

check() {
  cd "${pkgname%-git}"
  cargo test --package prs-cli --no-default-features --features $_prs_cli_features --release --locked
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

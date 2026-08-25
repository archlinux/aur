# Maintainer: Diego Garcia <diego.garcia.cr@gmail.com>
pkgname=smirk-git
pkgver=r3.ff18a57
pkgrel=1
pkgdesc="Emoji picker for Wayland that opens in an actually reasonable time"
arch=('x86_64' 'aarch64')
url="https://github.com/Yiin/smirk"
license=('MIT')
depends=('gtk4' 'libadwaita' 'wl-clipboard' 'wtype')
makedepends=('cargo')
install=$pkgname.install
source=(
  "${pkgname%-git}::git+$url.git"
  "smirk-toggle"
  "smirk.service"
  "smirk-git.install")
sha256sums=('SKIP'
            '70ceec7fc0e4d59a6b98e3de9104fa8ce1e6cdf69c21e63f65839d649d3f821d'
            'c60c0755f5d5d0b5e867f39812fb848e63d87a8b7fdc42ca277d1c94ea65fda5'
            '0828319165f6f997bd1a47be304431d7477d3c1d7d661816613e5fe22a37a775')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  install -Dm755 "target/release/smirk" "$pkgdir/usr/bin/smirk"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "${startdir}"
  install -Dm755 "smirk-toggle" "$pkgdir/usr/bin/smirk-toggle"
  install -Dm644 "smirk.service" "$pkgdir/usr/lib/systemd/user/smirk.service"
}

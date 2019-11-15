# Maintainer: Joakim Repomaa <aur@j.repomaa.com>

pkgname=autopass.cr-git
pkgver=0.r14.ed2280b
pkgrel=2
pkgdesc='a rofi frontend for pass'
arch=(x86_64)
url='https://gitlab.com/repomaa/autopass.cr'
license=('MIT')
depends=(pass rofi xdotool gpgme gc libyaml libevent)
makedepends=(crystal shards rust git python)

source=(
  "${pkgname}::git+https://gitlab.com/repomaa/autopass.cr"
  'autopass.socket'
  'autopass.service'
)
sha512sums=(
  SKIP
  SKIP
  SKIP
)
provides=('autopass')
conflicts=('autopass')
optdepends=('passed-git: batch editing of pass entries with sed')

pkgver() {
  cd "${pkgname}"
  printf '0.r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  shards build --release
}

package() {
  cd "${pkgname}"
  install -d "$pkgdir/usr/bin"
  install -m755 bin/autopass "$pkgdir/usr/bin/autopass"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 autopass.socket "$pkgdir/usr/lib/systemd/user/autopass.socket"
  install -Dm644 autopass.service "$pkgdir/usr/lib/systemd/user/autopass.service"
}

# vim:set ts=2 sw=2 et:

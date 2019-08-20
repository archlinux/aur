# Maintainer: Jeremy Audet <jerebear@protonmail.com>

pkgname='killjoy-notifier-logfile-git'
pkgver=0 # see pkgver()
pkgrel=1
pkgdesc='Log unit state changes on behalf of killjoy'
arch=('x86_64')
url="https://github.com/Ichimonji10/${pkgname%-git}"
license=('GPL3')
depends=('dbus')
makedepends=('git' 'rust')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/Ichimonji10/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  cargo build --locked --release
}

check() {
  cd "${pkgname%-git}"
  cargo test --locked --release
}

package() {
  install -Dm755 \
    -t "${pkgdir}/usr/bin" \
    "${pkgname%-git}/target/release/${pkgname%-git}"

  install -Dm644 \
    -t "${pkgdir}/usr/lib/systemd/user" \
    "${pkgname%-git}/package/session/${pkgname%-git}.service"

  install -Dm644 \
    -t "${pkgdir}/usr/share/dbus-1/services" \
    "${pkgname%-git}/package/session/name.jerebear.KilljoyNotifierLogfile1.service"
}

# vim:set ts=2 sw=2 et:

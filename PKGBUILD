# Maintainer: Your Name <your.email@example.com>
# Contributor: padoruuuu <https://github.com/padoruuuu>

pkgname=ulatencyd-rs-git
pkgver=0.1.0.r33.gc4b52da   # placeholder, will be overwritten by pkgver()
pkgrel=1
pkgdesc="A Rust rewrite of ulatencyd – cgroup v2 + scheduler latency daemon (git version)"
arch=('x86_64')
url="https://github.com/padoruuuu/-ulatencyd-rs"
license=('GPL')
depends=('dbus' 'polkit' 'glibc')
makedepends=('rust' 'cargo' 'git')
optdepends=('systemd: systemd service file support')
provides=('ulatencyd-rs')
conflicts=('ulatencyd-rs')
source=("$pkgname::git+$url.git")   # no commit pin – tracks latest main
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  # Use commit count and short hash – works even without tags
  printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  cargo build --release
}

package() {
  cd "$pkgname"

  install -Dm755 target/release/ulatencyd "$pkgdir/usr/sbin/ulatencyd"
  install -Dm755 target/release/ulatencyctl "$pkgdir/usr/bin/ulatencyctl"

  install -dm755 "$pkgdir/usr/lib/ulatencyd/rules"
  install -m644 rules/*.toml "$pkgdir/usr/lib/ulatencyd/rules/"

  install -dm755 "$pkgdir/etc/ulatencyd"
  install -m644 ulatencyd.toml "$pkgdir/etc/ulatencyd/ulatencyd.toml"

  install -Dm644 contrib/dbus/org.ulatencyd.Ulatencyd1.conf \
    "$pkgdir/etc/dbus-1/system.d/org.ulatencyd.Ulatencyd1.conf"

  install -Dm644 contrib/polkit/rs.ulatencyd.policy \
    "$pkgdir/usr/share/polkit-1/actions/rs.ulatencyd.policy"
  install -Dm644 contrib/polkit/rs.ulatencyd.rules \
    "$pkgdir/usr/share/polkit-1/rules.d/rs.ulatencyd.rules"

  install -Dm644 contrib/systemd/ulatencyd.service \
    "$pkgdir/usr/lib/systemd/system/ulatencyd.service"
}

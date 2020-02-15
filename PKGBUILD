# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=greetd-git
pkgver=r146.07baaae3c3
pkgrel=1
pkgdesc="Generic greeter daemon"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/greetd"
license=(MIT)
source=("git+$url")
sha256sums=('SKIP')
conflicts=(greetd)
provides=(greetd)
depends=(pam)
makedepends=(rust)
optdepends=(
  'greetd-gtkgreet: Simple GTK based greeter'
  'greetd-dlm: Dumb Login Manager'
  'greetd-wlgreet: Wayland greeter'
)

pkgver() {
  cd greetd
  printf 'r%d.%s' \
    $(git rev-list --count HEAD) \
    $(git rev-parse HEAD | head -c10)
}

build() {
  cd greetd
  cargo build --release
}

check() {
  cd greetd
  cargo test --release
}

package() {
  install -d "$pkgdir"/usr/bin
  install -m755 greetd/target/release/greetd "$pkgdir"/usr/bin/
  install -m755 greetd/target/release/agreety "$pkgdir"/usr/bin/

  install -d "$pkgdir"/usr/lib/systemd/system
  install -m644 greetd/greetd.service "$pkgdir"/usr/lib/systemd/system/

  install -d "$pkgdir"/etc/greetd
  install -m644 greetd/config.toml "$pkgdir"/etc/greetd/
}

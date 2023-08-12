# Maintainer: eckso <eckso@eckso.io>
pkgname=knobs
pkgver=0.8.6
pkgrel=1
pkgdesc="Get or set system clock frequencies, power limits, and related values."
arch=('i686' 'x86_64')
url="https://git.sr.ht/~eckso/knobs"
license=('AGPL3')
provides=('knobs')
makedepends=('cargo' 'git')
optdepends=()
depends=('systemd')
conflicts=('knobs')
source=("$pkgname::git+https://git.sr.ht/~eckso/knobs")
sha1sums=('SKIP')
install=$pkgname.install

build() {
  cd $pkgname
  git checkout v$pkgver
  if command -v rustup > /dev/null 2>&1; then
    rustup run stable cargo build --release
  else
    cargo build --release
  fi
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/knobs-daemon" "$pkgdir/usr/bin/knobs-daemon"
  install -Dm755 "target/release/knobs-client" "$pkgdir/usr/bin/knobs"
  install -Dm644 "contrib/systemd/knobs-daemon.service" "$pkgdir/usr/lib/systemd/system/knobs-daemon.service"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/doc/${pkgname}/LICENSE"
}

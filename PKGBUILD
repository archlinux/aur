# Maintainer: eckso <eckso@eckso.io>

pkgname=knobs
pkgver=0.9.5
pkgrel=1
pkgdesc='Manage system clock frequencies, power limits, and related values.'
arch=('i686' 'x86_64')
url='https://git.sr.ht/~eckso/knobs'
license=('AGPL3')
provides=('knobs')
makedepends=('cargo' 'clang' 'cmake' 'git')
optdepends=()
depends=('systemd')
conflicts=('knobs')
_commit='a6d7484e1fa1f46cf3810d2361c48275a51eda39'
source=("$pkgname::git+https://git.sr.ht/~eckso/knobs#commit=$_commit")
sha1sums=('SKIP')
install=$pkgname.install

build() {
  cd $pkgname
  if command -v rustup > /dev/null 2>&1; then
    rustup run stable cargo build --release --features ryzen
  else
    cargo build --release --features ryzen
  fi
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/knobs-daemon" "$pkgdir/usr/bin/knobs-daemon"
  install -Dm755 "target/release/knobs" "$pkgdir/usr/bin/knobs"
  install -dm755 "$pkgdir/etc/knobs"
  install -Dm644 "contrib/config/config.toml" "$pkgdir/etc/knobs/config.toml"
  install -Dm644 "contrib/systemd/knobs-daemon.service" "$pkgdir/usr/lib/systemd/system/knobs-daemon.service"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/doc/${pkgname}/LICENSE"
  install -Dm644 "doc/CHANGELOG.md" "$pkgdir/usr/share/doc/${pkgname}/CHANGELOG.md"
}

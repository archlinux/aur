# Maintainer: eckso <eckso@eckso.io>
pkgname=knobs
pkgver=0.8.4
pkgrel=1
pkgdesc="Set and display clock frequencies, power limits, and related values."
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

build() {
  cd "$pkgname"
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
  install -Dm755 "crate/knobs-daemon-bin/contrib/systemd/knobs-daemon.service" "$pkgdir/usr/lib/systemd/system/knobs-daemon.service"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/doc/${pkgname}/LICENSE"
  ln -s "knobs" "$pkgdir/usr/bin/amd-pstate"
  ln -s "knobs" "$pkgdir/usr/bin/cpu"
  ln -s "knobs" "$pkgdir/usr/bin/cpufreq"
  ln -s "knobs" "$pkgdir/usr/bin/drm"
  ln -s "knobs" "$pkgdir/usr/bin/i915"
  ln -s "knobs" "$pkgdir/usr/bin/intel-pstate"
  ln -s "knobs" "$pkgdir/usr/bin/intel-rapl"
}

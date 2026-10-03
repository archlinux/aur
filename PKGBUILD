pkgname=pnpm-git
pkgver=v12.9.0.1.gbf5cdd3390
pkgver() {
  cd pnpm
  git describe --long --tags | sed -e "s/pnpr@//" -e 's/alpha./r/' -e 's/\-/\./g'
}
pkgrel=1
pkgdesc="Fast, disk space efficient package manager"
arch=('x86_64')
url="https://github.com/pnpm/pnpm"
license=('MIT')
makedepends=(git rust)
optdepends=(nodejs)
conflicts=(pnpm)
provides=(pnpm)
source=("git+${url}.git")
b2sums=('SKIP')
prepare() {
  cd pnpm
  rm .cargo/config.toml # vendored crates
  # cargo fetch --locked
}

build() {
  cd pnpm
  cargo build --release --bin pnpm
}

package() {
  cd pnpm
  install -Dm755 target/release/pnpm -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  cd "$pkgdir/usr/bin"
  ln pnpm pn
  install -Dm755 <(echo -e '#!/bin/sh\nexec/usr/bin/pnpm dlx' '"$@"') pnpx
  ln pnpx pnx
}

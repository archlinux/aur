pkgname=pnpm-git
pkgver=12.11.2.0.g1e37c514f2
pkgver() {
  cd pnpm
  git describe --long --tags | sed -e "s/v//" -e "s/pnpr@//" -e 's/alpha./r/' -e 's/\-/\./g'
}
pkgrel=1
pkgdesc="Fast, disk space efficient package manager"
arch=('x86_64')
url="https://github.com/pnpm/pnpm"
license=('MIT')
makedepends=(git mold rust)
optdepends=(nodejs)
conflicts=(pnpm)
provides=(pnpm)
source=("git+${url}.git")
b2sums=('SKIP')

build() {
  cd pnpm
  export RUSTFLAGS+=" -C link-args=-fuse-ld=mold" # needed for aws-lc ?
  cargo build --release --bin pnpm
}

package() {
  cd pnpm
  install -Dm755 target/release/pnpm -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  cd "$pkgdir/usr/bin"
  ln pnpm pn
  install -Dm755 <(echo -e '#!/bin/sh'"\n exec/usr/bin/pnpm dlx" '"$@"') pnpx
  ln pnpx pnx
}

pkgname=pnpm-git
pkgver=0.1.0.r13.162.g743d1c7ff2
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
  for _a in pn pnpx pnx
    do install -Dm755 pnpm/npm/pnpm/$_a -t "$pkgdir/usr/bin"
  done
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

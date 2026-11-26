# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor:  Philip Goto <philip.goto@gmail.com>

pkgname=popsicle-git
pkgver=1.12.0.r0.ga0da0d5
pkgrel=1
pkgdesc="Linux utility for flashing multiple USB devices in parallel, written in Rust"
url="https://github.com/pop-os/popsicle"
arch=(x86_64 aarch64 armv7h)
license=(MIT)
depends=(gtk3)
makedepends=(
    git
    cargo
    clang
    help2man
    just
    lld
    )
provides=(popsicle)
conflicts=(popsicle)
source=("git+https://github.com/pop-os/popsicle.git")
sha256sums=('SKIP')

pkgver() {
  cd popsicle
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd popsicle
  cargo fetch --locked
}

build() {
  cd popsicle
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  just build-release --frozen
}

package() {
  cd popsicle
  just rootdir="${pkgdir}" install
  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


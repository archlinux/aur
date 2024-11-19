# Maintainer: quietvoid <tcChlisop0@gmail.com>

pkgname=dovi_tool-git
pkgver=2.1.2.r10.ga4f1b62
pkgrel=1
pkgdesc='CLI tool combining multiple utilities for working with Dolby Vision'
arch=('x86_64')
url='https://github.com/quietvoid/dovi_tool'
license=('MIT')
makedepends=('git' 'cargo')
depends=('fontconfig')
conflicts=('dovi-tool')
provides=('dovi-tool')
source=(git+https://github.com/quietvoid/dovi_tool.git)
sha256sums=('SKIP')

pkgver() {
  cd dovi_tool

  git describe --match "[0-9]*" --long HEAD --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cargo fetch \
    --locked \
    --manifest-path dovi_tool/Cargo.toml
}

build() {
  cargo build \
    --release \
    --frozen \
    --manifest-path dovi_tool/Cargo.toml
}

check() {
  cargo test \
    --release \
    --frozen \
    --manifest-path dovi_tool/Cargo.toml
}

package() {
  cd dovi_tool

  cargo install \
    --frozen \
    --offline \
    --no-track \
    --path . \
    --root "${pkgdir}"/usr

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/dovi_tool/LICENSE"
}

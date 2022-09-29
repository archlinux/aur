# Maintainer: Gustav Sörnäs <gustav at sornas dot net>

pkgname=swim-git
pkgver=r75.1892912
pkgrel=1
pkgdesc="Build tool for the Spade programming language"
arch=('x86_64')
url="https://gitlab.com/spade-lang/swim.git"
license=('EUPL-1.2')
sha256sums=('SKIP')
depends=('gcc-libs')
optdepends=()
makedepends=('git' 'rust')
source=("git+$url")

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    RUSTFLAGS="--remap-path-prefix=$(pwd)=" cargo build --locked --release --target-dir=target
}

check() {
    cd "${srcdir}/${pkgname%-git}"
    SWIM_DOWNLOAD_SPADE=1 cargo test --locked --target-dir=target
}

package() {
    cd "${srcdir}/${pkgname%-git}"

    install -Dm 755 target/release/swim -t "${pkgdir}/usr/bin"
    install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

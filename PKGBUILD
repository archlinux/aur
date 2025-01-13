# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Chris Down <chris@chrisdown.name>

pkgname=udp-over-tcp-git
pkgver=0.4.0.r28.g089491a
pkgrel=1
pkgdesc="Proxy UDP traffic over a TCP stream"
arch=('i686' 'x86_64')
url="https://github.com/mullvad/udp-over-tcp"
license=('Apache-2.0 AND MIT')
conflicts=("${pkgname::-4}")
provides=("${pkgname::-4}")
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname::-4}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname::-4}"
  RUSTUP_TOOLCHAIN=stable \
  cargo fetch \
  --locked \
  --target "$(rustc -vV | sed -n 's/host: //p')"

}

build() {
  cd "$srcdir/${pkgname::-4}"

  CARGO_TARET_DIR=target \
  RUSTUP_TOOLCHAIN=stable \
  cargo \
  build \
  --frozen \
  --release \
  --all-features

}

package() {
  cd "$srcdir/${pkgname::-4}"

  RUSTUP_TOOLCHAIN=stable cargo install \
    --all-features \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path .
}

# Maintainer: Maxim Balashov <rsg245@yandex.com>

pkgname=portablemc-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='Lightweight cli launcher for minecraft on rust'
arch=(x86_64)
url='https://github.com/mindstorm38/portablemc'
license=('Apache-2.0')
depends=(
  gcc-libs
  glibc
  libxcb
  openssl
)

makedepends=(cargo python)
# checkdepends=(cargo)

provides=('portablemc')
conflicts=('portablemc')

source=("portablemc-${pkgver}-x86_64.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"portablemc-${pkgver}-x86_64.tar.gz.sig::${url}/archive/refs/tags/v${pkgver}.tar.gz.sig")

sha256sums=('88224f3d89f798fcfe97d61a6db4078262eaa9fcb5549c950801937b418e6b81'
	    '5b2161c1ecec7cc9450847015a79b625ceb0f404bc75f3ac7117fd9c4c507c7e')

prepare() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

# check() {
#   cd "${pkgname}-${pkgver}"

#   export RUSTUP_TOOLCHAIN=stable
#   export CARGO_TARGET_DIR=target
#   cargo test --frozen --release
# }

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

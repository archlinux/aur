# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=lazycc
pkgver=0.1.1
pkgrel=1
pkgdesc='A git hook for writing conventional commits for lazy people'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://gitlab.com/ogarcia/lazycc'
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust')
source=("https://gitlab.com/ogarcia/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
b2sums=('82b748182d1cce158be90425ac1e62d14b8dd987049bedd69ba77ad85346cec58ff6ef39e30f503a08b429ebfb5e8b4bfe51e543b834f6f7452b9319b0b75f02')

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

package() {
  # binary
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  # readme
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  # sample config
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dot.lazyccrc" \
    "${pkgdir}/usr/share/doc/${pkgname}/dot.lazyccrc"
}

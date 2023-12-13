# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=lazycc
pkgver=0.1.0
pkgrel=1
pkgdesc='A git hook for writing conventional commits for lazy people'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://gitlab.com/ogarcia/lazycc'
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust')
source=("https://gitlab.com/ogarcia/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
b2sums=('2ed7212be18b55f0d658007533a4a5396edad0060cdef28b4826f11620811a16ac92e897a41ff923ac809912298b66d0c8eb397dc6dc0f2fef402ec50d68524c')

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

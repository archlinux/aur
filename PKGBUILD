# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: éclairevoyant
# Contributor: strawberry <strawberry@puppygock.gay>

pkgname=conduit
pkgver=0.10.17
pkgrel=1
pkgdesc='A simple, fast and reliable chat server powered by Matrix'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://conduit.rs'
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('clang' 'git' 'rust')
options=('!lto')
backup=("etc/${pkgname}.toml")
source=("${pkgname}::git+https://gitlab.com/famedly/${pkgname}.git#tag=v${pkgver}"
        "${pkgname}.service")
b2sums=('8c4e4b293f2fba31994fd104645dd861bd65df013e978101ad62fb51b09bd4e3f15f56a953510e3523c36a0abd11ef322932982e2ab0bd3c49a2d3dd771c8ff2'
        '2fb72123f70b2521134a5cd92ff62d62f6122e2bae52ce02d821c3716f40bd92c59819bf82a84ebe80e4b9b066b98c7e6309359aeac734ae0f20d63b41906d56')

prepare() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN="stable"
  cargo fetch --locked
}

build() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN="stable"
  export CARGO_TARGET_DIR="target"
  export CXXFLAGS="$CXXFLAGS -include cstdint"
  cargo build --release --locked
}

package() {
  # binary
  install -Dm755 "${srcdir}/${pkgname}/target/release/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  # conf
  install -Dm644 "${srcdir}/${pkgname}/${pkgname}-example.toml" \
    "${pkgdir}/etc/${pkgname}.toml"
  sed -i 's/\/matrix-conduit\//\/conduit\//' "${pkgdir}/etc/${pkgname}.toml"
  # service
  install -Dm644 "${srcdir}/${pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}

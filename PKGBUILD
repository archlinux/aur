# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: éclairevoyant
# Contributor: strawberry <strawberry@puppygock.gay>

pkgname=conduit
pkgver=0.10.15
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
b2sums=('ba009fd8d45cf8408c4bbd5eb6e2ffbd1f0a980be2d3dab3dffa369c51c038c988a572c4ee8960a0c088703ab7a6fbeff65ac7494399d589a87e514940c897b6'
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

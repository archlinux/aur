# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
_pkgname=FishFight
pkgname=fishfight
pkgver=0.3
pkgrel=1
pkgdesc="Fish Fight is a tactical 2D shooter. Made with Rust-lang and Macroquad"
arch=('any')
url="https://fishfight.org/"
license=('MIT APACHE')
makedepends=('cargo')
provides=(${pkgname})
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname}.sh"
)
sha512sums=(
  '83553106b481d4d738f57651d1f1b58892d6f91465862413a5db5adb25a00fef2eb884948a6f859daa6501bb015138c923348795d0d4419b2aa5cdf4c7fb84f9'
  '47ae00125796e46500cdf45cf8aae88dd2770f98d960f59c07f2df3fc661cbb8138dff34cb84c7339520a8aae3ee5a705a4ebee596252247c13c451805008577'
)
prepare() {
  cd "${srcdir}"/"${_pkgname}-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}"/"${_pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${srcdir}"/"${_pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
	cd "${srcdir}"/"${_pkgname}-${pkgver}"
  install -Dm0755 "target/release/${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"
  cp -r "assets" "${pkgdir}/opt/${pkgname}/"
	#install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  find ${pkgdir}/opt/${pkgname}/assets/sounds/ -type f -exec chmod 444 {} \;
  install -Dm0755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}" 
}

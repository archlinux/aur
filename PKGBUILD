# Mainainer: The one with the braid <info@braid.business>

pkgname=teapot-tools
pkgver=0.4.3
pkgrel=1
keywords=("depot_tools" "chromium" "flutter")
pkgdesc="Replacement for depot_tools (gclient) and luci-go (cipd)"
arch=("any")
_srcname=teapot_tools
provides=("depod-tools" "luci-go")
conflicts=("depot-tools" "depot-tools-git")
license=("Apache-2.0")
depends=(
	"git"
	"python"
)
build_depends=(
	"openssl"
	"protoc"
	"cargo"
	"cargo-auditable"
)
source=(
	"${pkgname}-${pkgver}.tar.xz::https://codeberg.org/selfisekai/${_srcname}/archive/v${pkgver}.tar.gz"
)

prepare() {
	cd "${_srcname}"
	cargo fetch --locked
}

build() {
	cd "${_srcname}"
	cargo auditable build --frozen --release --bin download_from_google_storage
	cargo auditable build --frozen --release --bin gclient
}

package() {
	install -Dm755 "${srcdir}/${_srcname}/target/release/download_from_google_storage" "${pkgdir}"/usr/bin/download_from_google_storage
	install -Dm755 "${srcdir}/${_srcname}/target/release/gclient" "${pkgdir}"/usr/bin/gclient
	install -Dm644 "${srcdir}/${_srcname}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('21a690e1c3a705b9b44a8612e5210e0717b26e1c5639bc0a82db735a45eeb933')

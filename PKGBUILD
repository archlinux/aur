# Mainainer: The one with the braid <info@braid.business>

pkgbase=teapot-tools
pkgdesc="Replacement for depot_tools (gclient) and luci-go (cipd)"
pkgver=0.4.3
pkgrel=4
url="https://codeberg.org/selfisekai/teapot_tools/"
arch=("x86_64" "i686" "pentium4" "arm" "armv6h" "arm7h" "aarch64" "riscv64")
_srcname=teapot_tools
_shortname=teapot
license=("Apache-2.0")
depends=(
	"git"
	"python"
)
makedepends=(
	"openssl"
	"cargo"
	"cargo-auditable"
)
source=(
	"${pkgbase}-${pkgver}.tar.xz::https://codeberg.org/selfisekai/${_srcname}/archive/v${pkgver}.tar.gz"
)
sha256sums=('21a690e1c3a705b9b44a8612e5210e0717b26e1c5639bc0a82db735a45eeb933')

prepare() {
	cd "${_srcname}"
	cargo fetch --locked
}

build() {
	cd "${_srcname}"
	cargo auditable build --frozen --release --bin gclient
	cargo auditable build --frozen --release --bin download_from_google_storage
}

check() {
	cd "${_srcname}"
	cargo check
}

_package-gclient() {
	pkgdesc="Replacement for depot_tools (gclient)"
	provides=("depot-tools" "depot-tools-git")
	conflicts=("depot-tools" "depot-tools-git" "teapot-tools")

        install -Dm755 "${srcdir}/${_srcname}/target/release/gclient" "${pkgdir}/usr/bin/gclient"
        install -Dm644 "${srcdir}/${_srcname}/LICENSE" "${pkgdir}/usr/share/licenses/${_shortname}-gclient/LICENSE"
}

_package-cipd() {
	pkgdesc="Replacement for luci-go (cipd)"
        provides=("luci-go")
        conflicts=("teapot-tools-cipd")

        install -Dm755 "${srcdir}/${_srcname}/target/release/download_from_google_storage" "${pkgdir}/usr/bin/download_from_google_storage"
        install -Dm644 "${srcdir}/${_srcname}/LICENSE" "${pkgdir}/usr/share/licenses/${_shortname}-cipd/LICENSE"
}

pkgname=("${_shortname}-gclient" "${_shortname}-cipd")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$_shortname}")
    _package${_p#$_shortname}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:


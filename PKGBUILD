# Maintainer: nathawat <nathawat at noreply dot codeberg dot org>

pkgname=hyprmt
pkgver=3.0.0
pkgrel=1
_tag=v${pkgver}
pkgdesc="Hyprland monitor toggle utility inspired by the Windows + P display picker"
arch=("x86_64")
url="https://codeberg.org/nathawat/hyprmt"
license=("GPL-3.0-or-later")
depends=("glibc" "hyprland>=0.55.0")
makedepends=("cargo")
optdepends=("fuzzel: overlay picker support")
provides=("hyprmt")
conflicts=("hyprmt-brightstay")
replaces=("hyprmt-brightstay")
source=(
    "${pkgname}-${pkgver}.tar.gz::https://codeberg.org/nathawat/hyprmt/archive/${_tag}.tar.gz"
    "${pkgname}.sysusers"
    "45-${pkgname}.rules"
    "${pkgname}.conf"
    "${pkgname}.install"
)
b2sums=(
    '81323ac6b075d5db99a6c972357077fa7b7ae627ba7e39458abc223365f607b957b1fb3ff3597ecc3565a5d4172bfc827cf80e843d0e002a26bef934e58099c1'
    '8577cab4f6c94058f8926e82765d25c9c9b43cc13ae7d462965770684293dc0692c305226107d570517185f119df8df4c6f9de8bec991e5ee59edc8bcd957a09'
    'e0d5cd0bab39ca44e978b7315de99ed05c687cce9acfb7e5f22a11e1b9d4f8743b41761ffa6cc85812bd265b3dfc90e231e56bd99bd5c3f6cd982c6aef02ca23'
    'f6f411b54c813432f854c258a3de9c4588119ef7ef6bd4785d5af52696a83a3182c20de8f8de0af6da04d8200727d187d2e3a44aac2a8b59b7e92c98265a3ef6'
    'e023fb49449f158b2a607f80517f446d942e140bc45e4b4a2f303aac382dedac7f8aadd3260f96a0fdb821bc5274c8e8056eae17a43c2b6c4605511681859e2e'
)

prepare() {
    cd "${srcdir}/${pkgname}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/${pkgname}"
  cargo build --frozen --release
}

check() {
  cd "${srcdir}/${pkgname}"
  cargo test --frozen
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${startdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.sysusers"
  install -Dm644 "${startdir}/45-${pkgname}.rules" "${pkgdir}/usr/lib/udev/rules.d/${pkgname}.rules"
  install -Dm644 "${startdir}/${pkgname}.conf" "${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"
  install -Dm644 "${startdir}/${pkgname}.install" "${pkgdir}/usr/share/libalpm/scripts/${pkgname}.install"
}

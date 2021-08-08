# Maintainer: imp0 <jan <(@)> siteworld <(.)> be>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=helvum
pkgver=0.2.1
pkgrel=1
pkgdesc='GTK-based patchbay for pipewire, inspired by the JACK tool catia'
arch=('x86_64')
url='https://gitlab.freedesktop.org/ryuukyu/helvum'
license=('GPL3')
depends=('gtk4' 'pipewire')
makedepends=('rust' 'clang' 'semver')
conflicts=('helvum-git')
source=("https://gitlab.freedesktop.org/ryuukyu/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
    "${pkgname}.desktop")
sha512sums=('667908a8c4296f742e91705bb74d2276f8e8d721eb4b16f8e5f97f99156075b194540083b36d69c4fe6ee0558584047dd5862d71c91c59b9d59f9d0cc2eb9a1a'
    '0a76aa3b7c98d08ded9d4c7a2254faa0b83a2f2339db81b995819b0f0e4721cf79df17473ca22a4d8aab161b162e70f7e63b728e603c6b9cb09f2f361aa8e537')

# This package needs at least rust 1.51 to build correctly: https://gitlab.freedesktop.org/ryuukyu/helvum/-/issues/4
# No proper solution to handle this was implemented in rust so far: https://rust-lang.github.io/rfcs/2495-min-rust-version.html
# This check will fail when the installed rust version doesn't meet the minimum requirement, although it shouldn't occur when an up-to-date build environment is used.
prepare() {
  min_ver='1.51'
  echo "Checking for minimal required rust version (${min_ver})..."
  rust_ver=$(rustc --version | awk '{print $2}' | sed 's/-nightly//')
  semver -r ">=${min_ver}" "${rust_ver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

package() {
  # Installs desktop entry
  install -dm755 "${pkgdir}/usr/share/applications"
  install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Changes path
  cd "${pkgname}-${pkgver}"

  # Installs license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Installs binary
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:

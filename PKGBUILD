# Maintainer: Xuepoo
# This file is a shared template for both `vem` and `vem-bin` (identical
# binary-repackage approach — there's no separate from-source build yet, so
# `vem-bin` exists purely for AUR naming-convention discoverability).
# CI (.github/workflows/release.yml, publish-aur job) substitutes
# vem-bin / 0.1.17 / 1 / https://github.com/vemjs/vem-desktop/releases/download/v0.1.17/Vem_0.1.17_amd64.deb / https://github.com/vemjs/vem-desktop/releases/download/v0.1.17/Vem_0.1.17_arm64.deb and
# writes the result to PKGBUILD before running updpkgsums + makepkg.
# Don't hand-edit a generated PKGBUILD in the AUR checkout; edit this
# template and cut a new release (or re-run the workflow via dispatch).
pkgname=vem-bin
pkgver=0.1.17
pkgrel=1
pkgdesc="A next-generation Vim editor powered by VectoJS, running natively via Tauri"
arch=('x86_64' 'aarch64')
url="https://vem.run"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg')
# The two packages must never provide/conflict with themselves, and the
# provide must be versioned — an unversioned `provides=(vem)` makes the
# installed package satisfy *any* version of `vem`, so `paru -S vem`
# resolves to "already installed" instead of offering the upgrade.
if [ "$pkgname" = "vem-bin" ]; then
  provides=("vem=${pkgver}")
  conflicts=('vem')
else
  conflicts=('vem-bin')
fi
options=('!strip')
source_x86_64=("vem-${pkgver}-x86_64.deb::https://github.com/vemjs/vem-desktop/releases/download/v0.1.17/Vem_0.1.17_amd64.deb")
source_aarch64=("vem-${pkgver}-aarch64.deb::https://github.com/vemjs/vem-desktop/releases/download/v0.1.17/Vem_0.1.17_arm64.deb")
sha256sums_x86_64=('543e9406d114ea9c7e72db0daeddf16f16811c5c8641a9c8bd753495260feac8')
sha256sums_aarch64=('e0ece6ca0babfba23a33a871e7b60d6ebcf753cea1eab876561655586d67250f')

package() {
  case "$CARCH" in
    x86_64) _debfile="vem-${pkgver}-x86_64.deb" ;;
    aarch64) _debfile="vem-${pkgver}-aarch64.deb" ;;
  esac
  bsdtar -xf "${srcdir}/${_debfile}" -C "${srcdir}"
  bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}"
}

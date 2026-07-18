# Maintainer: Xuepoo
# This file is a shared template for both `vem` and `vem-bin` (identical
# binary-repackage approach — there's no separate from-source build yet, so
# `vem-bin` exists purely for AUR naming-convention discoverability).
# CI (.github/workflows/release.yml, publish-aur job) substitutes
# vem-bin / 0.1.10 / 1 / https://github.com/vemjs/vem-desktop/releases/download/v0.1.10/Vem_0.1.10_amd64.deb / https://github.com/vemjs/vem-desktop/releases/download/v0.1.10/Vem_0.1.10_arm64.deb and
# writes the result to PKGBUILD before running updpkgsums + makepkg.
# Don't hand-edit a generated PKGBUILD in the AUR checkout; edit this
# template and cut a new release (or re-run the workflow via dispatch).
pkgname=vem-bin
pkgver=0.1.10
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
source_x86_64=("vem-${pkgver}-x86_64.deb::https://github.com/vemjs/vem-desktop/releases/download/v0.1.10/Vem_0.1.10_amd64.deb")
source_aarch64=("vem-${pkgver}-aarch64.deb::https://github.com/vemjs/vem-desktop/releases/download/v0.1.10/Vem_0.1.10_arm64.deb")
sha256sums_x86_64=('1d502d49e19fbc65dbc4e7bac9dda04675f72bb31bc1d9559a69b5aab90da64b')
sha256sums_aarch64=('c46a5b62d10117e5b2babef81bf792c93a04426b88bcec18e572c7eadb42e186')

package() {
  case "$CARCH" in
    x86_64) _debfile="vem-${pkgver}-x86_64.deb" ;;
    aarch64) _debfile="vem-${pkgver}-aarch64.deb" ;;
  esac
  bsdtar -xf "${srcdir}/${_debfile}" -C "${srcdir}"
  bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}"
}

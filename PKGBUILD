pkgname=patchy-image-editor-bin
pkgver=0.90
pkgrel=1
pkgdesc="PSD-oriented image editor repackaged from the upstream Flatpak bundle"
arch=('x86_64')
url="https://github.com/SethRobinson/Patchy"
license=('MIT')
depends=(
  'qt6-base'
  'qt6-declarative'
  'qt6-imageformats'
  'qt6-svg'
)
makedepends=('ostree')
optdepends=(
  'kimageformats: additional image formats, including HEIC/HEIF'
  'libheif: HEIC/HEIF codec support'
)
provides=("patchy-image-editor=${pkgver}")
conflicts=('patchy-image-editor-git')
options=('!debug' '!strip')
source=(
  "PatchyLinux-${pkgver}.flatpak::https://rtsoft.com/files/PatchyLinux.flatpak"
  'LICENSE'
)
sha256sums=('ba7cb336db1a576649d325860a1826d315dd564e83c97d2c35452e3aafd495be'
            'bbc50c8c376e0e5980939be7df6769feed1a30289c7efc6391b204dfb15de88d')

prepare() {
  local bundle="${srcdir}/PatchyLinux-${pkgver}.flatpak"
  local commit
  local repo="${srcdir}/ostree-repo"

  ostree --repo="${repo}" init --mode=bare-user-only
  ostree --repo="${repo}" static-delta apply-offline "${bundle}"
  commit="$(ostree --repo="${repo}" static-delta show "${bundle}" | sed -n 's/^To: //p')"
  [[ -n "${commit}" ]] || {
    error 'Unable to determine the Flatpak OSTree commit'
    return 1
  }
  ostree --repo="${repo}" checkout --user-mode --union "${commit}" patchy-flatpak
}

check() {
  local appdir="${srcdir}/patchy-flatpak/files"

  ldd -r "${appdir}/bin/patchy" > patchy-ldd.log
  if grep -Eq 'not found|undefined symbol' patchy-ldd.log; then
    cat patchy-ldd.log
    return 1
  fi
  QT_QPA_PLATFORM=offscreen \
    "${appdir}/bin/patchy" --version | grep -Fx "Patchy ${pkgver}"
}

package() {
  local appdir="${srcdir}/patchy-flatpak/files"

  install -Dm755 "${appdir}/bin/patchy" "${pkgdir}/usr/bin/patchy"
  install -d "${pkgdir}/usr/share"
  cp -a "${appdir}/share/applications" "${pkgdir}/usr/share/"
  cp -a "${appdir}/share/icons" "${pkgdir}/usr/share/"
  cp -a "${appdir}/share/metainfo" "${pkgdir}/usr/share/"
  cp -a "${appdir}/share/patchy" "${pkgdir}/usr/share/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

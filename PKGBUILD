# Maintainer: fgonzalezurriola <fgonzalezurriola@gmail.com>
pkgname=shaula-bin
pkgver=0.1.6
pkgrel=1
pkgdesc='Capture, preview, save, and copy screenshots on Wayland (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/fgonzalezurriola/shaula'
license=('MIT')
depends=(
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk4'
  'gtk4-layer-shell'
  'hicolor-icon-theme'
  'json-glib'
  'pango'
  'wayland'
  'wl-clipboard'
  'xdg-desktop-portal'
)
optdepends=(
  'grim: native capture on Niri and wlroots compositors'
  'niri: compositor-specific setup integration'
  'quickshell: Noctalia Shell integration'
  'ttf-geist: recommended UI font'
  'ttf-excalifont: recommended annotation font'
)
provides=('shaula')
conflicts=('shaula')
install='shaula.install'
source=("LICENSE::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/shaula-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/shaula-linux-aarch64.tar.gz")
sha256sums=('51100d4e517c591b0c6fa0bf94f10b86d7309736a46a23d53b0c85bf4c86966a')
sha256sums_x86_64=('61f11f893d9d06774711bba16d3cbfe612f7e25c53c1a49ad202b467a3319e99')
sha256sums_aarch64=('e964a120282d2b12afab8161861b9e0a1dfc914fae8758232377d69229226460')

package() {
  install -d "${pkgdir}/usr"
  cp -a "${srcdir}/bin" "${srcdir}/share" "${pkgdir}/usr/"

  while IFS= read -r relative || [[ -n ${relative} ]]; do
    [[ -n ${relative} && ${relative} != \#* ]] || continue
    [[ -f "${pkgdir}/usr/${relative}" ]] || {
      printf 'missing release payload: %s\n' "${relative}" >&2
      return 1
    }
    if [[ ${relative} == bin/* ]]; then
      [[ -x "${pkgdir}/usr/${relative}" ]] || {
        printf 'non-executable release binary: %s\n' "${relative}" >&2
        return 1
      }
    fi
  done < "${srcdir}/share/shaula/release-manifest.txt"

  [[ ! -e "${pkgdir}/usr/share/icons/hicolor/index.theme" ]]
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

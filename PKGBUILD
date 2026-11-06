# Maintainer: fgonzalezurriola <fgonzalezurriola@gmail.com>
pkgname=shaula-bin
pkgver=0.1.10
pkgrel=1
pkgdesc='Capture, annotate, save, and copy screenshots on Wayland (prebuilt)'
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
# Release automation replaces the checked-in markers with the matching
# immutable LICENSE and release-archive hashes only inside the temporary AUR
# clone.
sha256sums=('51100d4e517c591b0c6fa0bf94f10b86d7309736a46a23d53b0c85bf4c86966a')
sha256sums_x86_64=('b61186c6a5ece64bb0e54537484df4a655c7a65179dd66b19188a1de49988859')
sha256sums_aarch64=('bbe50f3b719ff4f6c9a14ea4253529db9c14c8494ef73a3e721dc3f70aef0db9')

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

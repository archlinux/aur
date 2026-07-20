# Maintainer: fgonzalezurriola <fgonzalezurriola@gmail.com>
pkgname=shaula-bin
pkgver=0.1.8
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
sha256sums_x86_64=('8e2f01be2205b03098a140b8c42ee1032d35853c691bbedc42158b87ac2ca40d')
sha256sums_aarch64=('0e2d66c02f8369bb4673e875d45c7ceee4bc3bea09cd6874b75f633a79659209')

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

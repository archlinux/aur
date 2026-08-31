# Maintainer: Samuel Bernard <samuel.bernard@gmail.com>

pkgname=gravitymark
pkgver=1.89
pkgrel=1
pkgdesc="Cross-platform GPU benchmark and stress test"
arch=('x86_64' 'aarch64')
url="https://gravitymark.tellusim.com/"
license=('LicenseRef-GravityMark-EULA')

depends=(
  'hicolor-icon-theme'
  'libglvnd'
  'libx11'
  'libxcb'
  'libxext'
  'libxrandr'
  'vulkan-icd-loader'
)
optdepends=(
  'vulkan-driver: Vulkan driver for Vulkan benchmarks'
)
# Keep the prebuilt upstream binaries unmodified; their launcher ensures that
# relative RUNPATH entries resolve from the package-owned runtime directory.
options=('!strip')
source=(
  'gravitymark.sh'
  'gravitymark.desktop'
)
source_x86_64=(
  "GravityMark-${pkgver}-x86_64.run::https://tellusim.com/download/GravityMark_${pkgver}.run"
)
source_aarch64=(
  "GravityMark-${pkgver}-aarch64.run::https://tellusim.com/download/GravityMark_${pkgver}_arm64.run"
)
sha256sums=(
  '73cee5ba4c5e13a70d8d4d721cb3f836e278542e75d1d3eca28892519271504e'
  'dc1be911ce5e5dd0e5d05f28cc1a2bbcb72b8ab269a63c4c254a2c371e786715'
)
sha256sums_x86_64=(
  'de090c7b9e40f10f225d9393f2cf73a660ad4edc21f6b333eea3190a8722e005'
)
sha256sums_aarch64=(
  '24919031efe3dd9b81f3b64453b7c04da60c3dfc2129ac18a94b28c0c97e6ba8'
)

prepare() {
  local _src="${srcdir}/GravityMark_${pkgver}_linux"

  rm -rf "$_src"
  mkdir "$_src"

  sh "${srcdir}/GravityMark-${pkgver}-${CARCH}.run" --tar xf -C "$_src"
  bsdtar -xOf "${_src}/browser.zip" browser/images/gravitymark.svg \
    > "${srcdir}/gravitymark.svg"
}

package() {
  local _src="${srcdir}/GravityMark_${pkgver}_linux"

  install -dm755 "${pkgdir}/opt/gravitymark/bin"
  for _file in "${_src}/bin/"*; do
    if [[ "$_file" == *.so ]]; then
      install -m644 "$_file" "${pkgdir}/opt/gravitymark/bin/"
    else
      install -m755 "$_file" "${pkgdir}/opt/gravitymark/bin/"
    fi
  done
  install -m644 \
    "${_src}/browser.zip" \
    "${_src}/data.zip" \
    "${pkgdir}/opt/gravitymark/"
  install -m755 "${_src}"/run_*.sh \
    "${pkgdir}/opt/gravitymark/"
  install -Dm755 "${srcdir}/gravitymark.sh" \
    "${pkgdir}/usr/bin/gravitymark"
  install -Dm644 "${srcdir}/gravitymark.desktop" \
    "${pkgdir}/usr/share/applications/gravitymark.desktop"
  install -Dm644 "${srcdir}/gravitymark.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gravitymark.svg"
  install -Dm644 "${_src}/GravityMark_EULA.pdf" \
    "${pkgdir}/usr/share/licenses/${pkgname}/GravityMark_EULA.pdf"
  install -Dm644 "${_src}/GravityMark_Commercial.pdf" \
    "${pkgdir}/usr/share/licenses/${pkgname}/GravityMark_Commercial.pdf"
  install -Dm644 "${_src}/Acknowledgements.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/Acknowledgements.txt"
  install -Dm644 "${_src}/GravityMark_Manual.pdf" \
    "${pkgdir}/usr/share/doc/${pkgname}/GravityMark_Manual.pdf"
}

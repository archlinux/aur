# Maintainer: slwyts <slwyts@foxmail.com>
# Repo: https://github.com/slwyts/bakaxl-aur
pkgname=bakaxl
pkgver=4.0.0+bunny
_rev=a03f125
pkgrel=1
pkgdesc="BakaXL Minecraft Launcher (repacked from official .deb; desktop entry patched for AMD/INTEL+NV dual-GPU Mesa EGL)"
arch=('x86_64')
url="https://www.bakaxl.com"
license=('custom')
depends=('gtk3' 'webkit2gtk-4.1' 'libsoup3' 'hicolor-icon-theme')

source=(
  "https://github.com/BakaXL-Launcher/BakaXL/releases/download/${pkgver}-${_rev}/bakaxl-${pkgver}-${_rev}-linux-x86_64.deb"
  "LICENSE"
)
sha256sums=(
  '8ed0f18fd1c00e2cf61f822412ef6b83b4b867883860672fee84e0fee1f337af'
  'SKIP'
)

package() {
  cd "${srcdir}"
  ar x "bakaxl-${pkgver}-${_rev}-linux-x86_64.deb" data.tar.gz
  tar xzf data.tar.gz -C "${pkgdir}"

  # Patch desktop entry with GPU fix for dual-GPU (AMD iGPU + NVIDIA)
  sed -i 's|^Exec=BakaXL$|Exec=env __EGL_VENDOR_LIBRARY_FILENAMES=/usr/share/glvnd/egl_vendor.d/50_mesa.json __NV_PRIME_RENDER_OFFLOAD=0 DRI_PRIME=0 /usr/bin/BakaXL|' \
    "${pkgdir}/usr/share/applications/BakaXL.desktop"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

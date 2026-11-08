# Maintainer: kals
# Binary assets are produced by the main repository's Gitea release workflow.
pkgbase=deskwaifu-bin
pkgname=('deskwaifu-bin' 'deskwaifu-ocr-bin')
pkgver=0.2.3
pkgrel=1
pkgdesc='DeskWaifu application and all default plugins'
arch=('x86_64')
url='https://github.com/ad2248/DeskWaifu'
license=('LicenseRef-Live2D-Open-Software' 'LicenseRef-Live2D-Proprietary' 'BSD-3-Clause' 'MIT' 'Unlicense')
options=('!strip' '!debug')
_tag=0.2.3
_upstream_pkgrel=1
_main="upstream-deskwaifu-bin-${pkgver}-${_upstream_pkgrel}-${CARCH}.pkg.tar.zst"
_ocr="upstream-deskwaifu-ocr-bin-${pkgver}-${_upstream_pkgrel}-${CARCH}.pkg.tar.zst"
source=(
  "${_main}::${url}/releases/download/${_tag}/${_main#upstream-}"
  "${_ocr}::${url}/releases/download/${_tag}/${_ocr#upstream-}"
)
noextract=("$_main" "$_ocr")
sha256sums=(
  '96f9b833a1e39e0bf0b49dc15495daa5e41284c8c47e0b0578ab4132c75628e3'
  '83b2fe89128709e6cc0f2bab75cbd6ea9e570c4e2f3cd43912f89ffe372d8536'
)

package_deskwaifu-bin() {
  depends=('glibc' 'gcc-libs' 'wayland' 'libglvnd' 'systemd-libs' 'qt6-base>=6.5' 'qt6-wayland>=6.5' 'qt6-scxml>=6.5' 'qt6-websockets>=6.5' 'qt6-multimedia>=6.5' 'layer-shell-qt>=6.6' 'bash' 'python' 'psmisc')
  optdepends=('deskwaifu-ocr-bin: optional in-process OCR module (models provisioned separately)')
  provides=("deskwaifu=$pkgver")
  conflicts=('deskwaifu')
  # Select only the installed payload; never nest upstream package metadata.
  bsdtar -xpf "$srcdir/$_main" -C "$pkgdir" usr
}

package_deskwaifu-ocr-bin() {
  pkgdesc='DeskWaifu in-process OCR module using system ONNX Runtime (no models or dictionaries)'
  license=('MIT' 'Apache-2.0')
  depends=("deskwaifu-bin>=$pkgver" 'glibc' 'gcc-libs' 'qt6-base>=6.5' 'opencv' 'yaml-cpp' 'onnxruntime-cpu')
  provides=("deskwaifu-ocr=$pkgver")
  conflicts=('deskwaifu-ocr')
  bsdtar -xpf "$srcdir/$_ocr" -C "$pkgdir" usr
  # The upstream component uses the un-suffixed name for its license directory.
  # ONNX Runtime is a system dependency, so no bundled runtime license is installed here.
  mv "$pkgdir/usr/share/licenses/deskwaifu-ocr" "$pkgdir/usr/share/licenses/$pkgname"
}

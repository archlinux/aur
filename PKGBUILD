# Maintainer: kals
# Binary assets are produced by the main repository's Gitea release workflow.
pkgbase=deskwaifu-bin
pkgname=('deskwaifu-bin' 'deskwaifu-ocr-bin')
pkgver=0.1.0
pkgrel=1
pkgdesc='DeskWaifu application and all default plugins'
arch=('x86_64')
url='https://github.com/ad2248/DeskWaifu'
license=('LicenseRef-Live2D-Open-Software' 'LicenseRef-Live2D-Proprietary' 'BSD-3-Clause' 'MIT' 'Unlicense')
options=('!strip' '!debug')
_tag=0.1.0
_upstream_pkgrel=1
_main="upstream-deskwaifu-bin-${pkgver}-${_upstream_pkgrel}-${CARCH}.pkg.tar.zst"
_ocr="upstream-deskwaifu-ocr-bin-${pkgver}-${_upstream_pkgrel}-${CARCH}.pkg.tar.zst"
source=(
  "${_main}::${url}/releases/download/${_tag}/${_main#upstream-}"
  "${_ocr}::${url}/releases/download/${_tag}/${_ocr#upstream-}"
)
noextract=("$_main" "$_ocr")
sha256sums=(
  'c39ac0952fe61e641954d347cb7bd76a8a545db944970fa880c62b5b00460958'
  'd9fb518cfa17a40e080792ef4e6da57d2104201c0643dde6bd8cdbf4bde413b8'
)

package_deskwaifu-bin() {
  depends=('glibc' 'gcc-libs' 'wayland' 'libglvnd' 'systemd-libs' 'qt6-base>=6.5' 'qt6-wayland>=6.5' 'qt6-scxml>=6.5' 'qt6-websockets>=6.5' 'qt6-multimedia>=6.5' 'layer-shell-qt>=6.6' 'bash' 'python' 'psmisc')
  optdepends=('deskwaifu-ocr-bin: optional native OCR helper (models provisioned separately)')
  provides=("deskwaifu=$pkgver")
  conflicts=('deskwaifu')
  # Select only the installed payload; never nest upstream package metadata.
  bsdtar -xpf "$srcdir/$_main" -C "$pkgdir" usr
}

package_deskwaifu-ocr-bin() {
  pkgdesc='DeskWaifu native OCR helper and ONNX Runtime CPU runtime (no models or dictionaries)'
  license=('MIT' 'Apache-2.0')
  depends=("deskwaifu-bin=$pkgver-$pkgrel" 'glibc' 'gcc-libs' 'qt6-base>=6.5' 'opencv' 'yaml-cpp')
  provides=("deskwaifu-ocr=$pkgver")
  conflicts=('deskwaifu-ocr')
  bsdtar -xpf "$srcdir/$_ocr" -C "$pkgdir" usr
}

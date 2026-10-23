# Maintainer: agony <27015 at riseup dot net>

pkgname=sherpa-onnx-bin
_pkgname=sherpa-onnx
pkgver=2.0.0
pkgrel=1
pkgdesc="Speech-to-text, TTS, diarization and VAD with next-gen Kaldi and onnxruntime (prebuilt)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/k2-fsa/sherpa-onnx"
license=('Apache-2.0')
depends=('alsa-lib' 'glibc' 'libgcc' 'libstdc++')
makedepends=('patchelf')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
_release="${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}"
_raw="https://raw.githubusercontent.com/k2-fsa/${_pkgname}/v${pkgver}/${_pkgname}/c-api"
# The ARM tarballs ship no headers; the two C API headers at the same tag are identical to the x86_64 copy
source=("c-api-${pkgver}.h::${_raw}/c-api.h"
        "cxx-api-${pkgver}.h::${_raw}/cxx-api.h")
source_x86_64=("${_release}-linux-x64-shared.tar.bz2")
source_aarch64=("${_release}-linux-aarch64-shared-cpu.tar.bz2")
source_armv7h=("${_release}-linux-arm-gnueabihf-shared.tar.bz2")
sha256sums=('9764470f09d219d6e7a80c6950059502c900ef82691ed6bea260d8ce9518f78a'
            'a49d7bdecb49b2b04e4dfe59f9a423ea4670cd0b2d2ce308d8160ee5c0ec0c7c')
sha256sums_x86_64=('ee729caa387ede28fb62dd0c111e267da5ed436c9438ee502da9ee0a2e03ab7c')
sha256sums_aarch64=('0ee6e6a6de388f9db6f24c241ee6631c7509d47f3c8e5cd7b05259ff92f722b6')
sha256sums_armv7h=('9704207d48105817b5c41587688df88d80e73e63db4abbfc7fca164f5d4fc191')

package() {
  local src
  case "$CARCH" in
    x86_64) src="${_pkgname}-v${pkgver}-linux-x64-shared" ;;
    aarch64) src="${_pkgname}-v${pkgver}-linux-aarch64-shared-cpu" ;;
    armv7h) src="${_pkgname}-v${pkgver}-linux-arm-gnueabihf-shared" ;;
  esac
  local libdir="/usr/lib/${_pkgname}"

  # Bundled onnxruntime stays out of /usr/lib: extra/onnxruntime ships the same soname
  # Only the three sherpa libraries are taken: the armv7h tarball also bundles libasound, which must stay the system one
  install -Dm755 "${src}"/lib/{libonnxruntime,libsherpa-onnx-c-api,libsherpa-onnx-cxx-api}.so -t "${pkgdir}${libdir}"
  install -Dm755 "${src}"/bin/sherpa-onnx-* -t "${pkgdir}/usr/bin"
  install -Dm644 "c-api-${pkgver}.h" "${pkgdir}/usr/include/${_pkgname}/c-api/c-api.h"
  install -Dm644 "cxx-api-${pkgver}.h" "${pkgdir}/usr/include/${_pkgname}/c-api/cxx-api.h"

  # Upstream RPATH is relative to the tarball tree; point binaries at the private libdir
  local f
  for f in "${pkgdir}"/usr/bin/*; do
    if [[ $(head -c4 "$f") == $'\x7fELF' ]]; then
      patchelf --set-rpath "${libdir}" "$f"
    fi
  done
}

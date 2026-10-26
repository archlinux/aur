# Maintainer: agony <27015 at riseup dot net>

pkgname=sherpa-onnx-bin
_pkgname=sherpa-onnx
pkgver=2.0.1
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
sha256sums=('5698f38ba09ad2bdf085c56a6cbbd7741acf15e25f4ce5c7097b9702cadf437f'
            '144b4b33c468078748449b3a8f6ebfb0d92d5c398b2d39067c9fbc008c091c9f')
sha256sums_x86_64=('2e823376987c3b6960d50726b6560155e2ad92da0b8b3886325773225ec6bdec')
sha256sums_aarch64=('a8fc9fb3940d1aa3f83136767742b05068f00253f560d53c4f5aeb75ab4cb350')
sha256sums_armv7h=('099c6bc956b26df246712ff9902419ff9cbc938c014177ea3e205b32675b48d5')

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

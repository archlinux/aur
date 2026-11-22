# Maintainer: agony <27015 at riseup dot net>

pkgname=sherpa-onnx-bin
_pkgname=sherpa-onnx
pkgver=2.0.3
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
sha256sums=('1f738de63a206328253ff471edda96b011fa1bd6f2a028f82967a7761abc2edd'
            '6fb6afc866784836a08832c611c867153f185b0a65fa418f743fcc3323d7dd7f')
sha256sums_x86_64=('615b1bf0140bf09051c15fde6579e48543696352ebd477217d2e69b49d9aec13')
sha256sums_aarch64=('c42748225180235bdd4ba10f8c4575b54beb8d5b26a5303bb3051026a0fe4e53')
sha256sums_armv7h=('77000a63843bda0b7476d90ebde9ddfd261c787aee65f4e0eccf36fc91e9eb6b')

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

# Maintainer: agony <27015 at riseup dot net>

pkgname=sherpa-onnx-bin
_pkgname=sherpa-onnx
pkgver=1.13.8
pkgrel=2
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
sha256sums=('2a1b95084be8fd1deb3228fcad2fd3f7f0258b64582f7402281ec174c7b7f4ce'
            '5b02af132b382a82addfa47f927d9cb41bb71d8598d78253ded41410fb12dbda')
sha256sums_x86_64=('c0bdb7907d3a74bba1d55d22bf4d9fa75586cf1530614ebe88a27b9118e015c4')
sha256sums_aarch64=('4e3734f82bc1379fd91f219f5869c7e9d03b7a4f7561907d8abca4849c51a789')
sha256sums_armv7h=('832c200eb361e361c587812f116436760e7728d2ee93ea4759ad5d59ab5c2e6c')

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

# Maintainer: agony <27015 at riseup dot net>

pkgname=sherpa-onnx-bin
_pkgname=sherpa-onnx
pkgver=1.13.8
pkgrel=1
pkgdesc="Speech-to-text, TTS, diarization and VAD with next-gen Kaldi and onnxruntime (prebuilt)"
arch=('x86_64')
url="https://github.com/k2-fsa/sherpa-onnx"
license=('Apache-2.0')
depends=('alsa-lib' 'glibc' 'libgcc' 'libstdc++')
makedepends=('patchelf')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x64-shared.tar.bz2")
sha256sums=('c0bdb7907d3a74bba1d55d22bf4d9fa75586cf1530614ebe88a27b9118e015c4')

package() {
  local src="${_pkgname}-v${pkgver}-linux-x64-shared"
  local libdir="/usr/lib/${_pkgname}"

  # Bundled onnxruntime stays out of /usr/lib: extra/onnxruntime ships the same soname
  install -d "${pkgdir}${libdir}" "${pkgdir}/usr/include"
  cp -dr --no-preserve=ownership "${src}"/lib/. "${pkgdir}${libdir}/"
  install -Dm755 "${src}"/bin/* -t "${pkgdir}/usr/bin"
  cp -dr --no-preserve=ownership "${src}/include/${_pkgname}" "${pkgdir}/usr/include/"

  # Upstream RPATH is relative to the tarball tree; point binaries at the private libdir
  local f
  for f in "${pkgdir}"/usr/bin/*; do
    if [[ $(head -c4 "$f") == $'\x7fELF' ]]; then
      patchelf --set-rpath "${libdir}" "$f"
    fi
  done
}

# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zig"
pkgver=0.11.0
_pkgver="${pkgver%.*}"
pkgrel=2

_pkgname="${_basename}${_pkgver}"
pkgname="${_pkgname}-bin"
pkgdesc="A general-purpose programming language and toolchain for maintaining robust, optimal, and reusable software"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'powerpc64le'
  'riscv64'
  'x86_64'
)
url="https://ziglang.org"
license=('MIT')
makedepends=(
  'minisign'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
options=(
  '!strip'
)
source_aarch64=("${url}/download/${pkgver}/${_basename}-linux-aarch64-${pkgver}.tar.xz"
                "${url}/download/${pkgver}/${_basename}-linux-aarch64-${pkgver}.tar.xz.minisig")
source_armv7h=("${url}/download/${pkgver}/${_basename}-linux-armv7a-${pkgver}.tar.xz"
               "${url}/download/${pkgver}/${_basename}-linux-armv7a-${pkgver}.tar.xz.minisig")
source_i686=("${url}/download/${pkgver}/${_basename}-linux-x86-${pkgver}.tar.xz"
             "${url}/download/${pkgver}/${_basename}-linux-x86-${pkgver}.tar.xz.minisig")
source_powerpc64le=("${url}/download/${pkgver}/${_basename}-linux-powerpc64le-${pkgver}.tar.xz"
                    "${url}/download/${pkgver}/${_basename}-linux-powerpc64le-${pkgver}.tar.xz.minisig")
source_riscv64=("${url}/download/${pkgver}/${_basename}-linux-riscv64-${pkgver}.tar.xz"
                "${url}/download/${pkgver}/${_basename}-linux-riscv64-${pkgver}.tar.xz.minisig")
source_x86_64=("${url}/download/${pkgver}/${_basename}-linux-x86_64-${pkgver}.tar.xz"
               "${url}/download/${pkgver}/${_basename}-linux-x86_64-${pkgver}.tar.xz.minisig")
sha256sums_aarch64=('956eb095d8ba44ac6ebd27f7c9956e47d92937c103bf754745d0a39cdaa5d4c6'
                    'SKIP')
sha256sums_armv7h=('aebe8bbeca39f13f9b7304465f9aee01ab005d243836bd40f4ec808093dccc9b'
                   'SKIP')
sha256sums_i686=('7b0dc3e0e070ae0e0d2240b1892af6a1f9faac3516cae24e57f7a0e7b04662a8'
                 'SKIP')
sha256sums_powerpc64le=('75260e87325e820a278cf9e74f130c7b3d84c0b5197afb2e3c85eff3fcedd48d'
                        'SKIP')
sha256sums_riscv64=('24a478937eddb507e96d60bd4da00de9092b3f0920190eb45c4c99c946b00ed5'
                    'SKIP')
sha256sums_x86_64=('2d00e789fec4f71790a6e7bf83ff91d564943c5ee843c5fd966efc474b423047'
                   'SKIP')

if   [ "${CARCH}" = 'aarch64'     ]; then _arch=aarch64;
elif [ "${CARCH}" = 'armv7h'      ]; then _arch=armv7a;
elif [ "${CARCH}" = 'i686'        ]; then _arch=x86;
elif [ "${CARCH}" = 'powerpc64le' ]; then _arch=powerpc64le;
elif [ "${CARCH}" = 'riscv64'     ]; then _arch=riscv64;
elif [ "${CARCH}" = 'x86_64'      ]; then _arch=x86_64;
else _arch=DUMMY;
fi

verify() {
  # https://ziglang.org/download/
  local ziglang_minisign="RWSGOq2NVecA2UPNdBUZykf1CCb147pkmdtYxgb3Ti+JO/wCYvhbAb/U"

  minisign -V \
    -P "${ziglang_minisign}" \
    -m "${_basename}-linux-${_arch}-${pkgver}.tar.xz"
}

package() {
  cd "${srcdir}/${_basename}-linux-${_arch}-${pkgver}"
  install -vDm755 "${_basename}" "${pkgdir}/opt/${_pkgname}/${_basename}"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cp -a --no-preserve=ownership "doc" -T "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -a --no-preserve=ownership "lib" -t "${pkgdir}/opt/${_pkgname}"

  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"
  ln -vsf "/opt/${_pkgname}/${_basename}" "${pkgdir}/usr/bin/${_pkgname}"
  ln -vsf "/opt/${_pkgname}/lib"          "${pkgdir}/usr/lib/${_pkgname}"
}

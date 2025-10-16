# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zig"
pkgver=0.14.1
_pkgver="${pkgver%.*}"
pkgrel=3

_pkgname="${_basename}${_pkgver}"
pkgname="${_pkgname}-bin"
pkgdesc="A general-purpose programming language and toolchain for maintaining robust, optimal, and reusable software"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'loong64'
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
source_aarch64=("${url}/download/${pkgver}/${_basename}-aarch64-linux-${pkgver}.tar.xz"
                "${url}/download/${pkgver}/${_basename}-aarch64-linux-${pkgver}.tar.xz.minisig")
source_armv7h=("${url}/download/${pkgver}/${_basename}-armv7a-linux-${pkgver}.tar.xz"
               "${url}/download/${pkgver}/${_basename}-armv7a-linux-${pkgver}.tar.xz.minisig")
source_i686=("${url}/download/${pkgver}/${_basename}-x86-linux-${pkgver}.tar.xz"
             "${url}/download/${pkgver}/${_basename}-x86-linux-${pkgver}.tar.xz.minisig")
source_loong64=("${url}/download/${pkgver}/${_basename}-loongarch64-linux-${pkgver}.tar.xz"
                "${url}/download/${pkgver}/${_basename}-loongarch64-linux-${pkgver}.tar.xz.minisig")       
source_powerpc64le=("${url}/download/${pkgver}/${_basename}-powerpc64le-linux-${pkgver}.tar.xz"
                    "${url}/download/${pkgver}/${_basename}-powerpc64le-linux-${pkgver}.tar.xz.minisig")
source_riscv64=("${url}/download/${pkgver}/${_basename}-riscv64-linux-${pkgver}.tar.xz"
                "${url}/download/${pkgver}/${_basename}-riscv64-linux-${pkgver}.tar.xz.minisig")
source_x86_64=("${url}/download/${pkgver}/${_basename}-x86_64-linux-${pkgver}.tar.xz"
               "${url}/download/${pkgver}/${_basename}-x86_64-linux-${pkgver}.tar.xz.minisig")
sha256sums_aarch64=('f7a654acc967864f7a050ddacfaa778c7504a0eca8d2b678839c21eea47c992b'
                    'SKIP')
sha256sums_armv7h=('1b34d9ecfaeb3b360e86c0bc233e1a8a2bbed2d40f2d4f20c12bde2128714324'
                   'SKIP')
sha256sums_i686=('4bce6347fa112247443cb0952c19e560d1f90b910506cf895fd07a7b8d1c4a76'
                 'SKIP')
sha256sums_loong64=('fdc344789be6becbe220bf5ad035156e653cc148f4da270188cbac87729f17e0'
                    'SKIP')
sha256sums_powerpc64le=('15523e748efd9224ae164482e5cc1f8c11b035246b9749fb5b00758484f384a1'
                        'SKIP')
sha256sums_riscv64=('005f214f74dbafb7b4d8bd305f4e9d25048f711d9ec6fa7b3d4fca177e11b882'
                    'SKIP')
sha256sums_x86_64=('24aeeec8af16c381934a6cd7d95c807a8cb2cf7df9fa40d359aa884195c4716c'
                   'SKIP')

if   [ "${CARCH}" = 'aarch64'     ]; then _arch=aarch64;
elif [ "${CARCH}" = 'armv7h'      ]; then _arch=armv7a;
elif [ "${CARCH}" = 'i686'        ]; then _arch=x86;
elif [ "${CARCH}" = 'loong64'     ]; then _arch=loongarch64;
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
    -m "${_basename}-${_arch}-linux-${pkgver}.tar.xz"
}

package() {
  cd "${srcdir}/${_basename}-${_arch}-linux-${pkgver}"
  install -vDm755 "${_basename}" "${pkgdir}/opt/${_pkgname}/${_basename}"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cp -a --no-preserve=ownership "doc" -T "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -a --no-preserve=ownership "lib" -t "${pkgdir}/opt/${_pkgname}"

  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"
  ln -vsf "/opt/${_pkgname}/${_basename}" "${pkgdir}/usr/bin/${_pkgname}"
  ln -vsf "/opt/${_pkgname}/lib"          "${pkgdir}/usr/lib/${_pkgname}"
}

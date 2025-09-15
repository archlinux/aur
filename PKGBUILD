# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zig"
pkgver=0.6.0
_pkgver="${pkgver%.*}"
pkgrel=1

_pkgname="${_basename}${_pkgver}"
pkgname="${_pkgname}-bin"
pkgdesc="A general-purpose programming language and toolchain for maintaining robust, optimal, and reusable software"
arch=(
  'aarch64'
  'armv6h'
  'armv7h'
  'i686'
  'riscv64'
  'x86_64'
)
url="https://ziglang.org"
_url="https://github.com/ziglang/${_basename}"
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
source=("${_basename}-${pkgver}-README.md::${_url}/raw/refs/tags/${pkgver}/README.md")
source_aarch64=("${url}/download/${pkgver}/${_basename}-linux-aarch64-${pkgver}.tar.xz"
                "${url}/download/${pkgver}/${_basename}-linux-aarch64-${pkgver}.tar.xz.minisig")
source_armv6h=("${url}/download/${pkgver}/${_basename}-linux-armv6kz-${pkgver}.tar.xz"
                "${url}/download/${pkgver}/${_basename}-linux-armv6kz-${pkgver}.tar.xz.minisig")
source_armv7h=("${url}/download/${pkgver}/${_basename}-linux-armv7a-${pkgver}.tar.xz"
                "${url}/download/${pkgver}/${_basename}-linux-armv7a-${pkgver}.tar.xz.minisig")
source_i686=("${url}/download/${pkgver}/${_basename}-linux-i386-${pkgver}.tar.xz"
             "${url}/download/${pkgver}/${_basename}-linux-i386-${pkgver}.tar.xz.minisig")
source_riscv64=("${url}/download/${pkgver}/${_basename}-linux-riscv64-${pkgver}.tar.xz"
                "${url}/download/${pkgver}/${_basename}-linux-riscv64-${pkgver}.tar.xz.minisig")
source_x86_64=("${url}/download/${pkgver}/${_basename}-linux-x86_64-${pkgver}.tar.xz"
               "${url}/download/${pkgver}/${_basename}-linux-x86_64-${pkgver}.tar.xz.minisig")
sha256sums=('59b58748a0dbefc234ec6b77d34b552e30beb7e7f8caecbdc29fe3f26ad44928')
sha256sums_aarch64=('e7520efd42cfa02be48c2e430d08fe1f3cbb999d21d9f0d3ffd0febb976b2f41'
                    'SKIP')
sha256sums_armv6h=('36b6493b3fed43eb1f0000e765798ad31a6bb7d7fd3f553ac1c3761dbc919b82'
                   'SKIP')
sha256sums_armv7h=('946969abe357def95ca9cbbfcebfcf2d90cf967bcd3f48ee87662e32d91d8f35'
                   'SKIP')
sha256sums_i686=('a97a2f9ae21575743cdd763c1917d49400d83fc562ef64582b18bade43eb24ce'
                 'SKIP')
sha256sums_riscv64=('68ddee43f7503c8ae5f26a921f3602c34719a02ed2241f528c0b8b888cc14b38'
                    'SKIP')
sha256sums_x86_64=('08fd3c757963630645441c2772362e9c2294020c44f14fce1b89f45de0dc1253'
                   'SKIP')

if   [ "${CARCH}" = 'aarch64' ]; then _arch=aarch64;
elif [ "${CARCH}" = 'armv6h'  ]; then _arch=armv6kz;
elif [ "${CARCH}" = 'armv7h'  ]; then _arch=armv7a;
elif [ "${CARCH}" = 'i686'    ]; then _arch=i386;
elif [ "${CARCH}" = 'riscv64' ]; then _arch=riscv64;
elif [ "${CARCH}" = 'x86_64'  ]; then _arch=x86_64;
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
  cd "${srcdir}"
  install -vDm644 "${_basename}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  
  cd "${_basename}-linux-${_arch}-${pkgver}"
  install -vDm755 "${_basename}" "${pkgdir}/opt/${_pkgname}/${_basename}"
  # install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cp -a --no-preserve=ownership "doc" -T "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -a --no-preserve=ownership "lib" -t "${pkgdir}/opt/${_pkgname}"

  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"
  ln -vsf "/opt/${_pkgname}/${_basename}" "${pkgdir}/usr/bin/${_pkgname}"
  ln -vsf "/opt/${_pkgname}/lib"          "${pkgdir}/usr/lib/${_pkgname}"
}

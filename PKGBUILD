# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zig"
pkgver=0.13.0
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
sha256sums_aarch64=('041ac42323837eb5624068acd8b00cd5777dac4cf91179e8dad7a7e90dd0c556'
                    'SKIP')
sha256sums_armv7h=('4b0550239c2cd884cc03ddeb2b9934708f4b073ad59a96fccbfe09f7e4f54233'
                   'SKIP')
sha256sums_i686=('876159cc1e15efb571e61843b39a2327f8925951d48b9a7a03048c36f72180f7'
                 'SKIP')
sha256sums_powerpc64le=('6a467622448e830e8f85d20cabed151498af2b0a62f87b8c083b2fe127e60417'
                        'SKIP')
sha256sums_riscv64=('9f7f3c685894ff80f43eaf3cad1598f4844ac46f4308374237c7f912f7907bb3'
                    'SKIP')
sha256sums_x86_64=('d45312e61ebcc48032b77bc4cf7fd6915c11fa16e4aad116b66c9468211230ea'
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

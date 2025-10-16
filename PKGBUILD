# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zig"
pkgver=0.9.1
_pkgver="${pkgver%.*}"
pkgrel=2

_pkgname="${_basename}${_pkgver}"
pkgname="${_pkgname}-bin"
pkgdesc="A general-purpose programming language and toolchain for maintaining robust, optimal, and reusable software"
arch=(
  'aarch64'
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
options=(
  '!strip'
)
source=("${_basename}-${pkgver}-README.md::${_url}/raw/refs/tags/${pkgver}/README.md")
source_aarch64=("${url}/download/${pkgver}/${_basename}-linux-aarch64-${pkgver}.tar.xz"
                "${url}/download/${pkgver}/${_basename}-linux-aarch64-${pkgver}.tar.xz.minisig")
source_armv7h=("${url}/download/${pkgver}/${_basename}-linux-armv7a-${pkgver}.tar.xz"
                "${url}/download/${pkgver}/${_basename}-linux-armv7a-${pkgver}.tar.xz.minisig")
source_i686=("${url}/download/${pkgver}/${_basename}-linux-i386-${pkgver}.tar.xz"
             "${url}/download/${pkgver}/${_basename}-linux-i386-${pkgver}.tar.xz.minisig")
source_riscv64=("${url}/download/${pkgver}/${_basename}-linux-riscv64-${pkgver}.tar.xz"
                "${url}/download/${pkgver}/${_basename}-linux-riscv64-${pkgver}.tar.xz.minisig")
source_x86_64=("${url}/download/${pkgver}/${_basename}-linux-x86_64-${pkgver}.tar.xz"
               "${url}/download/${pkgver}/${_basename}-linux-x86_64-${pkgver}.tar.xz.minisig")
sha256sums=('abf0482bcc378a474f380ca7175cb6d18bc7fa97cb214d6cd15647f15f455bb7')
sha256sums_aarch64=('5d99a39cded1870a3fa95d4de4ce68ac2610cca440336cfd252ffdddc2b90e66'
                    'SKIP')
sha256sums_armv7h=('6de64456cb4757a555816611ea697f86fba7681d8da3e1863fa726a417de49be'
                   'SKIP')
sha256sums_i686=('e776844fecd2e62fc40d94718891057a1dbca1816ff6013369e9a38c874374ca'
                 'SKIP')
sha256sums_riscv64=('208dea53662c2c52777bd9e3076115d2126a4f71aed7f2ff3b8fe224dc3881aa'
                    'SKIP')
sha256sums_x86_64=('be8da632c1d3273f766b69244d80669fe4f5e27798654681d77c992f17c237d7'
                   'SKIP')

if   [ "${CARCH}" = 'aarch64' ]; then _arch=aarch64;
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

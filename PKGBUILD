# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zig"
pkgver=0.7.1
_pkgver="${pkgver%.*}"
pkgrel=1

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
sha256sums=('5fdbcb17c5ffe8b0c7974760b781826b5ff0fa0e50f53730a610e31ffd67440a')
sha256sums_aarch64=('48ec90eba407e4587ddef7eecef25fec7e13587eb98e3b83c5f2f5fff2a5cbe7'
                    'SKIP')
sha256sums_armv7h=('5a0662e07b4c4968665e1f97558f8591f6facec45d2e0ff5715e661743107ceb'
                   'SKIP')
sha256sums_i686=('4882e052e5f83690bd0334bb4fc1702b5403cb3a3d2aa63fd7d6043d8afecba3'
                 'SKIP')
sha256sums_riscv64=('187294bfd35983348c3fe042901b42e67e7e36ab7f77a5f969d21c0051f4d21f'
                    'SKIP')
sha256sums_x86_64=('18c7b9b200600f8bcde1cd8d7f1f578cbc3676241ce36d771937ce19a8159b8d'
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

  cp -a --no-preserve=ownership "docs" -T "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -a --no-preserve=ownership "lib"  -t "${pkgdir}/opt/${_pkgname}"

  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"
  ln -vsf "/opt/${_pkgname}/${_basename}" "${pkgdir}/usr/bin/${_pkgname}"
  ln -vsf "/opt/${_pkgname}/lib"          "${pkgdir}/usr/lib/${_pkgname}"
}

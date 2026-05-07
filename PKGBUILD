# Maintainer:  Adam Mlady <adam.mlady@elevated.ovh>

_basename="zig"
pkgver=0.16.0
_pkgver="${pkgver%.*}"
pkgrel=2

_pkgname="${_basename}-${_pkgver}"
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
  "${_pkgname}=$pkgver"
)
conflicts=(
  "${_basename}"
)
options=(
  '!strip'
)

if   [ "${CARCH}" = 'aarch64'     ]; then
  _arch=aarch64;
elif [ "${CARCH}" = 'armv7h'      ]; then
  _arch=armv7a;
elif [ "${CARCH}" = 'i686'        ]; then
  _arch=x86;
elif [ "${CARCH}" = 'powerpc64le' ]; then
  _arch=powerpc64le;
elif [ "${CARCH}" = 'riscv64'     ]; then
  _arch=riscv64;
elif [ "${CARCH}" = 'x86_64'      ]; then
  _arch=x86_64;
else
  echo "Error: Unknown CPU Architecture" >&2
  exit 1
fi

source=("${url}/download/${pkgver}/${_basename}-${_arch}-linux-${pkgver}.tar.xz"
        "${url}/download/${pkgver}/${_basename}-${_arch}-linux-${pkgver}.tar.xz.minisig")
sha256sums=('SKIP'
            'SKIP')

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
  ln -vsf "/opt/${_pkgname}/${_basename}" "${pkgdir}/usr/bin/${_basename}"
  ln -vsf "/opt/${_pkgname}/lib"          "${pkgdir}/usr/lib/${_basename}"
}


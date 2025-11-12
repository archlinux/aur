# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zig"
pkgver=0.2.0
_pkgver="${pkgver%.*}"
pkgrel=2

_pkgname="${_basename}${_pkgver}"
pkgname="${_pkgname}-bin"
pkgdesc="A general-purpose programming language and toolchain for maintaining robust, optimal, and reusable software"
arch=(
  'x86_64'
)
url="https://ziglang.org"
_url="https://github.com/ziglang/${_basename}"
license=('MIT')
depends=(
  'sh'
)
makedepends=(
  'minisign'
  'patchelf'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_basename}-install-prefix.sh"
  "${_basename}-${pkgver}-README.md::${_url}/raw/refs/tags/${pkgver}/README.md"
  "${_basename}-${pkgver}-LICENSE::${_url}/raw/refs/tags/${pkgver}/LICENSE"
)
source_x86_64=(
  "${url}/download/${pkgver}/${_basename}-linux-x86_64-${pkgver}.tar.xz"
  "${url}/download/${pkgver}/${_basename}-linux-x86_64-${pkgver}.tar.xz.minisig"
)
sha256sums=('f8d36c8e623f8dc341cb9d40823805c584f1699f98e5502c386608ac06b65f9e'
            'a0ac3410325a38cd99ab640385748ae9a5dfea0c3cf621445d5819bc0639080d'
            '12043f8e6dfb42e979158fbecbbeeb0cf70d2721ea2864f627379331b95c58e6')
sha256sums_x86_64=('209c6fb745d42474c0a73d6f291c7ae3a38b6a1b6b641eea285a7f840cc1a890'
                   'SKIP')

verify() {
  # https://ziglang.org/download/
  local ziglang_minisign="RWSGOq2NVecA2UPNdBUZykf1CCb147pkmdtYxgb3Ti+JO/wCYvhbAb/U"

  minisign -V \
    -P "${ziglang_minisign}" \
    -m "${_basename}-linux-${CARCH}-${pkgver}.tar.xz"
}

prepare() {
  cd "${srcdir}"
  sed -i "s/@@ZIG_VERSION@@/${_pkgver}/g" "${_basename}-install-prefix.sh"

  cd "${_basename}-linux-${CARCH}-${pkgver}"
  patchelf --remove-rpath "${_basename}"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_basename}-install-prefix.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_basename}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_basename}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  
  cd "${_basename}-linux-${CARCH}-${pkgver}"
  install -vDm755 "${_basename}" "${pkgdir}/usr/lib/${_pkgname}/${_basename}"
  # install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  # install -vDm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cp -a --no-preserve=ownership ./*.html -t "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -a --no-preserve=ownership "lib"    -t "${pkgdir}/usr/lib/${_pkgname}"
}

# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

declare -Ag _arch=(
  ['aarch64']='arm64'
  ['x86_64']='amd64'
)

_pkgbase="clipse"
_pkgname=(
  "${_pkgbase}-common"
  "${_pkgbase}-x11"
  "${_pkgbase}-wayland"
)
pkgbase="${_pkgbase}-bin"
pkgname=(
  "${_pkgname[@]/%/-bin}"
)
pkgver=1.2.1
pkgrel=1
pkgdesc="A configurable TUI clipboard manager for Unix"
arch=(
  "${!_arch[@]}"
)
url="https://github.com/savedra1/${_pkgbase}"
license=(
  'MIT'
)
_pkgsrc="${_pkgbase}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
for _carch in "${!_arch[@]}"; do
  eval "
source_${_carch}+=(
  '${url}/releases/download/v${pkgver}/${_pkgbase}_v${pkgver}_linux_x11_${_arch[${_carch}]}.tar.gz'
  '${url}/releases/download/v${pkgver}/${_pkgbase}_v${pkgver}_linux_wayland_${_arch[${_carch}]}.tar.gz'
)"
done
sha256sums=('4639cde7079d4d2c00bf215e47428c014e24f8f86d7e4a79d9d0532ff20998a8'
            '7a2e32b86e825be38f8d6582261c0d60617e1cc2b8171ff6e5fed1e03a788638')
sha256sums_aarch64=('57503488f61fe1505d0a8ef27470a3a3feb5cc7dc3336c4f898dfdf96644a998'
                    '976b4d255c92a8e9ba4e2e4448069e128a74e98a3cd89a6814cdc9e2381991cc')
sha256sums_x86_64=('b3c192c055fd847202c7806a9b3963b347b40b1f2dff0261ba63eb2601f8a847'
                   '0853240cbfa8efc1a73baebf4e202f70dc14c832bb5a8b74c650ab410e294003')

package_clipse-common-bin() {
  pkgdesc+=" (common files)"
  arch=(
    'any'
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgbase}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
}

package_clipse-x11-bin() {
  pkgdesc+=" (X11 backend)"
  depends=(
    "${_pkgbase}-common-bin>=${pkgver}-${pkgrel}"
    'glibc'
    'libx11'
    'libxfixes'
    'libxtst'
  )
  provides=(
    "${pkgname%%-*}=${pkgver}"
    "${pkgname%-*}=${pkgver}"
  )
  conflicts=(
    "${pkgname%%-*}"
  )

  cd "${srcdir}"
  install -vDm755 "${_pkgbase}-linux-x11-${_arch[${CARCH}]}" "${pkgdir}/usr/bin/${_pkgbase}"
}

package_clipse-wayland-bin() {
  pkgdesc+=" (Wayland backend)"
  depends=(
    "${_pkgbase}-common-bin>=${pkgver}-${pkgrel}"
    'wl-clipboard'
  )
  provides=(
    "${pkgname%%-*}=${pkgver}"
    "${pkgname%-*}=${pkgver}"
  )
  conflicts=(
    "${pkgname%%-*}"
  )

  cd "${srcdir}"
  install -vDm755 "${_pkgbase}-linux-wayland-${_arch[${CARCH}]}" "${pkgdir}/usr/bin/${_pkgbase}"
}

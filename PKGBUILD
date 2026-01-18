# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

declare -Ag _arch=(
  ['aarch64']='arm64'
  ['x86_64']='amd64'
)
declare -Ag _backends=(
  ['x11']='glibc libx11 libxfixes libxtst'
  ['wayland']='wl-clipboard'
)

_pkgbase="clipse"
_pkgname=(
  "${_pkgbase}-common"
)
pkgbase="${_pkgbase}-bin"
pkgname=(
  "${_pkgname[@]/%/-bin}"
)
pkgver=1.2.0
pkgrel=1
pkgdesc="A configurable TUI clipboard manager for Unix"
arch=(
  "${!_arch[@]}"
)
url="https://github.com/savedra1/${_pkgbase}"
license=(
  'MIT'
)
source=(
  "${_pkgbase}-${pkgver}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgbase}-${pkgver}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
for _carch in "${!_arch[@]}"; do
  for _backend in "${!_backends[@]}"; do
    eval "
source_${_carch}+=(
  '${url}/releases/download/v${pkgver}/${_pkgbase}_v${pkgver}_linux_${_backend}_${_arch[${_carch}]}.tar.gz'
)"
  done
done
sha256sums=('22598a6f62041ce88f00f889c20d04fb0cf269ad8b0d9758e8b9e509d8e71e3e'
            '7a2e32b86e825be38f8d6582261c0d60617e1cc2b8171ff6e5fed1e03a788638')
sha256sums_aarch64=('39908918c2f495e311f8791911710d04334d3cd17f5f8f91c6a52bf9a68f1070'
                    'be0df2115a7580d5e2c6722ca7a282421a74c28c0e01411a0801805f3b364105')
sha256sums_x86_64=('465411f22704d6cee852a12f5fe3903b9dba7279ecfd489dde658e6edb89569e'
                   '41260fe521cbbfe1e94e5d449ea7b3af8e0e279d247bc22d73d97fef6a04dde1')

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
  install -vDm644 "${_pkgbase}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgbase}/README.md"
  install -vDm644 "${_pkgbase}-${pkgver}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
}

for _backend in "${!_backends[@]}"; do
  pkgname+=(
    "${_pkgbase}-${_backend}-bin"
  )

  eval "
package_${_pkgbase}-${_backend}-bin() {
  pkgdesc+=' (${_backend} backend)'
  depends=(
    '${_pkgbase}-common>=${pkgver}'
    ${_backends[${_backend}]}
  )
  provides=(
    '${_pkgbase}-${_backend}=${pkgver}'
    '${_pkgbase}=${pkgver}'
  )
  conflicts=(
    '${_pkgbase}'
  )

  cd \"\${srcdir}\"
  install -vDm755 '${_pkgbase}-linux-${_backend}-${_arch[${CARCH}]}' \"\${pkgdir}/usr/bin/${_pkgbase}\"
}"
done

# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgbase="hishtory"
_pkgname=(
  "${_pkgbase}"
  "${_pkgbase}-server"
  "${_pkgbase}-common"
)
pkgbase="${_pkgbase}-bin"
pkgname=(
  "${_pkgname[@]/%/-bin}"
)
pkgver=0.335
pkgrel=1
pkgdesc="Your shell history: synced, queryable, and in context"
arch=(
  'aarch64'
  'armv7h'
  'x86_64'
)
url="https://hishtory.dev"
_url="https://github.com/ddworken/${_pkgbase}"
license=('MIT')
makedepends=(
  'slsa-verifier'
)
_pkgsrc="${_pkgbase}-${pkgver}"
source=("${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64::${_url}/releases/download/v${pkgver}/${_pkgbase}-linux-arm64"
                "${_pkgsrc}-aarch64.intoto.jsonl::${_url}/releases/download/v${pkgver}/${_pkgbase}-linux-arm64.intoto.jsonl"
                "${_pkgbase}-server-${pkgver}-aarch64::${_url}/releases/download/v${pkgver}/${_pkgbase}-server-linux-arm64")
source_armv7h=("${_pkgsrc}-armv7h::${_url}/releases/download/v${pkgver}/${_pkgbase}-linux-arm"
               "${_pkgsrc}-armv7h.intoto.jsonl::${_url}/releases/download/v${pkgver}/${_pkgbase}-linux-arm.intoto.jsonl"
               "${_pkgbase}-server-${pkgver}-armv7h::${_url}/releases/download/v${pkgver}/${_pkgbase}-server-linux-arm")
source_x86_64=("${_pkgsrc}-x86_64::${_url}/releases/download/v${pkgver}/${_pkgbase}-linux-amd64"
               "${_pkgsrc}-x86_64.intoto.jsonl::${_url}/releases/download/v${pkgver}/${_pkgbase}-linux-amd64.intoto.jsonl"
               "${_pkgbase}-server-${pkgver}-x86_64::${_url}/releases/download/v${pkgver}/${_pkgbase}-server-linux-amd64")
sha256sums=('59690a6e21c3373d44bf629b45ff5d595bface5dd23582e183bbbbe1ce45142c'
            '923a32f4636b55edc26225eed5dc355b76f88ac18b0cfca01d2e2e2666fc3de7')
sha256sums_aarch64=('ebd1c8287d9313c551ccb923839936916300a85fa9c5d7b3f77bef85531b08fa'
                    '11688b2bc5b05b4ae53ca50a64638fc232a86fd1305dbdafbd418ff40fb8e022'
                    'c179365e36a6732fed2b7237bcab9eefd7a95aaad7dac4bcb7d49c48908416c5')
sha256sums_armv7h=('e8df20ab8f2e8cfacf65c42eee104d28b87061127bf5e90d4355b72c239c7672'
                   'cfa9024d4ccfa3390ed5c932f553c74d4c05ee7abc09923c57e56ffec4ac463f'
                   'ca3230bcb5f3ef01c0f6c40740cff57542e8e36d9c359bba45500054d05aaa4c')
sha256sums_x86_64=('49a926eecd40f0c0bc5ef5670de191496cf882216b5c53f32e3ebc2e3be2d271'
                   '1d134cfbc74a04d7238b35ebd30831269948cabbcfb3b1660cfed8a818b6f32b'
                   'b7d9579281450c0a4ac6d49783009119b4ede8b1fe0fb5bac38f3cae250e00d0')

verify() {
  slsa-verifier verify-artifact "${_pkgsrc}-${CARCH}" \
    --provenance-path "${_pkgsrc}-${CARCH}.intoto.jsonl" \
    --source-uri "${_url#https://}" \
    --source-tag "v${pkgver}"
}

prepare() {
  cd "${srcdir}"
  mkdir -p "completions"
  chmod +x ./"${_pkgsrc}-${CARCH}"
}

build() {
  cd "${srcdir}"
  for _sh in bash fish powershell zsh; do
    ./"${_pkgsrc}-${CARCH}" completion "${_sh}" > "completions/${_pkgbase}.${_sh}"
  done
}

package_hishtory-bin() {
  depends=(
    "${_pkgbase}-common=${pkgver}"
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  cd "${srcdir}"
  install -vDm755 "${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"

  cd "completions"
  install -vDm644 "${pkgname%-bin}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
  install -vDm644 "${pkgname%-bin}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname%-bin}.fish"
  install -vDm644 "${pkgname%-bin}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname%-bin}"
  install -vDm644 "${pkgname%-bin}.powershell" "${pkgdir}/usr/share/powershell/Completions/${pkgname%-bin}.ps1"
}

package_hishtory-server-bin() {
  pkgdesc+=" (server)"
  depends=(
    "${_pkgbase}-common=${pkgver}"
    'glibc'
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  cd "${srcdir}"
  install -vDm755 "${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}

package_hishtory-common-bin() {
  pkgdesc+=" (common files)"
  arch=('any')
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

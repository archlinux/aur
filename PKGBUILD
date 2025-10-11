# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname=(
  "slsa-builder-docker"
  "slsa-builder-go"
  "slsa-generator-container"
  "slsa-generator-generic"
)
_pkgbase="slsa-github-generator"
_pkgname=(
  "${_pkgbase}"
  "${_pkgbase}-common"
  "${_binname[@]}"
)
pkgbase="${_pkgbase}-bin"
pkgname=(
  "${_pkgname[@]/%/-bin}"
)
pkgver=2.1.0
pkgrel=2
pkgdesc="Language-agnostic SLSA provenance generation for Github Actions"
arch=('x86_64')
url="https://github.com/slsa-framework/${_pkgbase}"
license=('Apache-2.0')
makedepends=(
  'slsa-verifier'
)
_pkgsrc="${_pkgbase}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
for _name in "${_binname[@]}"; do
  source_x86_64+=("${_name}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_name}-linux-amd64"
                  "${_name}-${pkgver}-x86_64.intoto.jsonl::${url}/releases/download/v${pkgver}/${_name}-linux-amd64.intoto.jsonl")
done
sha256sums=('e24773389a80b2416fce4448b12b0e47c900a79fa17f579acb3fffaf91521d37'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('31c5f5580e11db3c0119ec4c772cf2663eda944df12da5ac309a90de207fd4c1'
                   '17d918a7b327d427fac85b91dca4e64fcc85146f3c7a8c6a8efcce00a81e8987'
                   'e74e81e95030a9cb83b2842af62c91d122e022b614466894b754b7b548e9e36c'
                   '164904a4932dc2b07d7e139e68b681b2f72f84a344a3da256359caa882f112b3'
                   'cee1453de115735379dd98dc80f70c73a66fcfefb5674e062f8765a1021e4cc6'
                   '694bc3940f85774f43334fc560875a650b3ffe880350d3144e43771f41548e65'
                   'bd8a6e794c3207ee00aaa90751f369647532e51045553a54b3dc71bd258995ce'
                   'e1998f4d34faff29930256d4d1fc680ade09e206d5a57979c7745edc93178bf1')

verify() {
  for _name in "${_binname[@]}"; do
    slsa-verifier verify-artifact "${_name}-${pkgver}-${CARCH}" \
      --provenance-path "${_name}-${pkgver}-${CARCH}.intoto.jsonl" \
      --source-uri "${url#https://}" \
      --source-tag "v${pkgver}"
  done
}

prepare() {
  cd "${srcdir}"
  mkdir -p "completions"
  for _name in "${_binname[@]}"; do
    if [[ $_name != "slsa-builder-go" ]]; then
      chmod +x "./${_name}-${pkgver}-${CARCH}"
    fi
  done
}

build() {
  cd "${srcdir}"
  for _name in "${_binname[@]}"; do
    if [[ $_name != "slsa-builder-go" ]]; then
      for _sh in bash fish powershell zsh; do
      ./"${_name}-${pkgver}-${CARCH}" completion "${_sh}" > "completions/${_name}.${_sh}"
      done
    fi
  done
}

package_slsa-github-generator-bin() {
  pkgdesc+=" (meta)"
  arch=('any')
  depends=(
    "${_binname[@]/%/"-bin=${pkgver}-${pkgrel}"}"
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )
}

package_slsa-github-generator-common-bin() {
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

for _name in "${_binname[@]}"; do
  eval "
package_${_name}-bin() {
  pkgdesc+=' (${_name##*-} target)'
  url+='/tree/main/internal/builders/${_name##*-}'
  depends+=(
    '${_pkgbase}-common-bin=${pkgver}-${pkgrel}'
  )
  provides=(
    '${_name}=${pkgver}'
  )
  conflicts=(
    '${_name}'
  )
  
  cd \"\${srcdir}\"
  install -vDm755 '${_name}-${pkgver}-${CARCH}' \"\${pkgdir}/usr/bin/${_name}\"

  if [[ '${_name}' != 'slsa-builder-go' ]]; then
    cd 'completions'
    install -vDm644 '${_name}.bash'       \"\${pkgdir}/usr/share/bash-completion/completions/${_name}\"
    install -vDm644 '${_name}.fish'       \"\${pkgdir}/usr/share/fish/vendor_completions.d/${_name}.fish\"
    install -vDm644 '${_name}.powershell' \"\${pkgdir}/usr/share/powershell/Completions/${_name}.ps1\"
    install -vDm644 '${_name}.zsh'        \"\${pkgdir}/usr/share/zsh/site-functions/_${_name}\"
  fi
}"
done

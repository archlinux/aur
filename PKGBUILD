# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="certigo"
pkgname="${_pkgname}-bin"
pkgver=1.18.0
pkgrel=1
pkgdesc="A utility to examine and validate certificates in a variety of formats"
arch=(
  'x86_64'
)
url="https://github.com/square/${_pkgname}"
license=(
  'Apache-2.0'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_x86_64=(
  "${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64"
)
sha256sums=('12b4b5eb2a783de0c77402ab9dfb45a1230c940adce1887766bdc076bb0d441b'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('0f3878fef6f42740d6a5dc201d3e7c6456299216ed0a3ec7254a65f5451068ae')

prepare() {
  cd "${srcdir}"
  chmod +x ./"${_pkgsrc}-${CARCH}"
  mkdir -p "completions" "manpages"
}

build() {
  cd "${srcdir}"
  for _sh in bash zsh; do
    ./"${_pkgsrc}-${CARCH}" --completion-script-${_sh} > "completions/${_pkgname}.${_sh}"
  done
  ./"${_pkgsrc}-${CARCH}" --help-man > "manpages/${_pkgname}.1"
} 

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  find "manpages" -type f -name '*.1' -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/share/man/man1/{}" \;

  cd "completions"
  install -vDm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgname}.zsh"  "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}

# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="dstask"
pkgname="${_pkgname}-bin"
pkgver=0.27
pkgrel=2
pkgdesc="A terminal-based TODO manager with git-based sync + markdown notes per task"
arch=('x86_64' 'armv5h')
url="https://calbryant.uk/blog/dstask-a-taskwarrior-alternative"
_url="https://github.com/naggie/${_pkgname}"
license=('MIT')
depends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${_url}/raw/refs/tags/${pkgver}/README.md"
        "LICENSE-${pkgver}::${_url}/raw/refs/tags/${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${_url}/releases/download/${pkgver}/${_pkgname}-linux-amd64"
               "${_pkgname}-import-${pkgver}-x86_64::${_url}/releases/download/${pkgver}/${_pkgname}-import-linux-amd64")
source_armv5h=("${_pkgsrc}-armv5h::${_url}/releases/download/${pkgver}/${_pkgname}-linux-arm5"
               "${_pkgname}-import-${pkgver}-armv5h::${_url}/releases/download/${pkgver}/${_pkgname}-import-linux-arm5")
sha256sums=('67a4018bf8dff52def2ca841fb9dd8a9d6a1d5663cf60cb147b337b7d480d46c'
            'f1630544f9da6d125967a9224cee919b686a7b2b3ea37d7ecbfa8216b2837534')
sha256sums_x86_64=('9ec6f73f58fb20b9814a2fb5275534625a3212d7b04a839ad1a7bb6bbaeaffdf'
                   '432f6d50cc13dfcf66068b611ef206dd98b73263d47d094740c31ceeec22220d')
sha256sums_armv5h=('d92993584f1e62d3b479dd6385c7a3e303b040ced550b6affc92452dda797116'
                   'd7668a4a57df96d83eb1d7021341454cbdee5eb85e3e234cd2339b1979f39def')

prepare() {
  cd "${srcdir}"
  mkdir -p "completions"
}

build() {
  cd "${srcdir}"
  chmod +x "${_pkgsrc}-${CARCH}"
  for _sh in bash fish zsh; do
    ./"${_pkgsrc}-${CARCH}" "${_sh}-completion" > "completions/${_pkgname}.${_sh}"
  done
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm755 "${_pkgname}-import-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}-import"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "completions"
  install -vDm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "${_pkgname}.zsh"  "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}

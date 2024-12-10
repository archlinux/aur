# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="flow"
_pkgname="${_binname}-cli"
pkgname="${_pkgname}-bin"
pkgver=2.2.2
pkgrel=1
pkgdesc="A command-line interface that provides useful utilities for building Flow applications"
arch=('x86_64' 'aarch64')
url="https://docs.onflow.org/flow-cli"
_url="https://github.com/onflow/${_pkgname}"
license=('Apache-2.0')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.tar.gz")
b2sums_x86_64=('568cb58bbd9e51777ea72b39a1c5d08fe134219996cf2dc5ecd6a7b4ab3837cc3bf5a670f5ba53bc8357644905cb95b2fa45708af2518d3f5e9c147e3cca161c')
b2sums_aarch64=('af8c258b54f9192a704deda9a732cd72dbc94fb1718de6a16f29b54a29e911de179d5169ed0d6db24d7ba96a9f1350f9ab627f9e9b28ad8ae9c522a702716ade')

prepare() {
  cd "${srcdir}"
  mkdir -p "completions"
  mv -f "${_pkgname}" "${_binname}"
}

build() {
  cd "${srcdir}"
  for _sh in bash fish zsh powershell; do
    ./"${_binname}" completion "${_sh}" > "completions/${_binname}.${_sh}"
  done
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "completions"
  install -vDm644 "${_binname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -vDm644 "${_binname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_binname}.fish"
  install -vDm644 "${_binname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
  install -vDm644 "${_binname}.powershell" "${pkgdir}/usr/share/powershell/Modules/${_binname}/${_binname}.ps1"
}

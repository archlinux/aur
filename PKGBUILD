# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="flow"
_pkgname="${_binname}-cli"
pkgname="${_pkgname}-bin"
pkgver=2.2.1
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
b2sums_x86_64=('80f94a6e0b4e1001fdd3433cf62c7d5dbdbd131d84055caa1797eeac9e20b25170659f0e9aa85386141a31d948e7979833a383e055f24f4cd8c804e1e7817921')
b2sums_aarch64=('6e6865a6d642739ced7317b3d2b647c661d3524c91d08035595c52a1e6c9f5751d4079868098e3ed4d88fc679374cc5695a63180870985fb1bcdc595f4f68bc4')

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

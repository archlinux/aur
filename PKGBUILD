# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Alexander Eisele <alexander at eiselecloud dot de>
# Contributor: Asuka Minato

_pkgname="kubectl-dba"
pkgname="${_pkgname}-bin"
pkgver=0.53.0
pkgrel=1
pkgdesc="kubectl plugin for KubeDB"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://kubedb.com"
_url="https://github.com/kubedb/cli"
license=('custom:AppsCode-Community-1.0.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgname}-LICENSE.md::https://github.com/appscode/licenses/raw/1.0.0/AppsCode-Community-1.0.0.md")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-linux-arm.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.tar.gz")
sha512sums=('249ab166610634cdb55dd1ee2ad1bfe46905af77e37a6fcd662285cf1784bc71d0981bcea476c06b3679116ed018f42bf8c2d3e01b7c9fd8fe7965efb659b15b'
            '3ccf552f646ca9716b660cec0da9f1bcabe3c88c55e992ce18f963341701f7ddbe131fd08b657e861572168482a74dded6c617f8deb4131f3b70669eeae45d93')
sha512sums_aarch64=('a20f5ed15a734aa3da43479d7bf1a637eefc1d67a3b49af75cae2b22ad80d0cf7c2f46d08acf4285b19f240693e7ff66048c8351dd98d280dda63ac196d23787')
sha512sums_armv7h=('2b71547d85ba640171f8152db913f7d6ee1cf160b0797661c6a18404690ed1aa9feba0608c1b0d953b8896fa38ba7f159ddfeb22c33d3e55e1a77e72dde09f0c')
sha512sums_x86_64=('8748fcc92ec1c098b7e0dfd5f35052d2f88ec77e85e670a6a75cd119c7dd70b34d6cf7a7f6e03e258f88e20a080472260649d3155d7cad5b6d5f324609b872b0')

case "${CARCH}" in
  aarch64)
    _arch="arm64"
    ;;
  armv7h)
    _arch="arm"
    ;;
  x86_64)
    _arch="amd64"
    ;;
  *)
    echo "Unsupported architecture: ${CARCH}"
    ;;
esac

prepare() {
  cd "${srcdir}"
  mkdir -p "completions"
}

build() {
  cd "${srcdir}"
  for _sh in bash fish zsh powershell; do
    ./"${_pkgname}-linux-${_arch}" completion "${_sh}" > "completions/${_pkgname}.${_sh}"
  done
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}-linux-${_arch}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgname}-LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/${_pkgname}-LICENSE.md"

  cd "completions"
  install -vDm644 "${_pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "${_pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -vDm644 "${_pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_pkgname}.ps1"
}

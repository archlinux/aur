# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Alexander Eisele <alexander at eiselecloud dot de>
# Contributor: Asuka Minato

_binname="kubedb"
_pkgname="${_binname}-cli"
pkgname="${_pkgname}-bin"
pkgver=0.46.0
pkgrel=3
pkgdesc="kubectl plugin for KubeDB"
arch=('x86_64' 'aarch64' 'arm')
url="https://${_binname}.com"
_url="https://github.com/${_binname}/cli"
license=('custom:AppsCode-Community-1.0.0')
optdepends=('bash-completion: for shell auto-completion'
            'zsh-completions: for shell auto-completion')
provides=("${_pkgname}" "${_binname}")
conflicts=("${_pkgname}" "${_binname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${_url}/raw/v${pkgver}/README.md"
        "LICENSE.md::https://github.com/appscode/licenses/raw/1.0.0/AppsCode-Community-1.0.0.md")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/kubectl-dba-linux-amd64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/kubectl-dba-linux-arm64.tar.gz")
source_arm=("${_pkgsrc}-arm.tar.gz::${_url}/releases/download/v${pkgver}/kubectl-dba-linux-arm.tar.gz")
sha512sums=('249ab166610634cdb55dd1ee2ad1bfe46905af77e37a6fcd662285cf1784bc71d0981bcea476c06b3679116ed018f42bf8c2d3e01b7c9fd8fe7965efb659b15b'
            '3ccf552f646ca9716b660cec0da9f1bcabe3c88c55e992ce18f963341701f7ddbe131fd08b657e861572168482a74dded6c617f8deb4131f3b70669eeae45d93')
sha512sums_x86_64=('118a466cef51e9f10e0c00b90ace5f73d39add55603a717ea6a1af82dd21734cbaf009ccebc4c6bf6904656c576bbd4a241c56b74a99685885e6c4d51ca9d38b')
sha512sums_aarch64=('932b7c5c7ee1a45367e965d6750e6297dfa46754ea64946bff0e3f68974609243d9d1ced1acd3200b142ee37b8b74c8dffddbbc6cdcd7dda89800979fccefa9d')
sha512sums_arm=('40c55568419ac52cd1e9f86b7ddbab0bf5c44f4a9b79570745f57eec952b4d39b4b9b4ef251d82f184c503be5e167f5b69af46c8a682bf603b7169794124d5ca')

case "${CARCH}" in
  x86_64)
    _arch="amd64"
    ;;
  aarch64)
    _arch="arm64"
    ;;
  arm)
    _arch="arm"
    ;;
  *)
    echo "Unsupported architecture: ${CARCH}"
    exit 1
    ;;
esac

prepare() {
  cd "${srcdir}"
  mkdir -p "completions"
}

build() {
  cd "${srcdir}"

  for _sh in bash fish zsh powershell; do
    ./"kubectl-dba-linux-${_arch}" completion "${_sh}" > "completions/${_binname}.${_sh}"
  done
}

package() {
  cd "${srcdir}"
  install -Dm755 "kubectl-dba-linux-${_arch}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"

  cd "completions"
  install -Dm644 "${_binname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -Dm644 "${_binname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_binname}.fish"
  install -Dm644 "${_binname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
  install -Dm644 "${_binname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_binname}.ps1"
}

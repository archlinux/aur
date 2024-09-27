# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Alexander Eisele <alexander at eiselecloud dot de>
# Contributor: Asuka Minato

_binname="kubedb"
_pkgname="${_binname}-cli"
pkgname="${_pkgname}-bin"
pkgver=0.48.0
pkgrel=1
pkgdesc="kubectl plugin for KubeDB"
arch=('x86_64' 'aarch64' 'arm')
url="https://${_binname}.com"
_url="https://github.com/${_binname}/cli"
license=('custom:AppsCode-Community-1.0.0')
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
sha512sums_x86_64=('7cd4341e9f317acb3be8daa3b852aa7175dafaa83cf5b853342b7418e1fc6a67a890cf7d3ef9ea97146154679a35bc3a4fc94e2a2602e3c2fbe06b9985ef6868')
sha512sums_aarch64=('b117b851fd51f8753585c7deeb8f2ba75f251282a233ae0cb19dac8119dee2f1c5bb608c5a673356e41a8df883eb78bad292f17ef1be6a8e07a9c9e0f2c32832')
sha512sums_arm=('0e1427ea14a1d971cbde45540134ea1dae8f90ae0361d40f3a3256c69c22a8aedae93bbb2997aa26992a3580f82213513c8ec0f1e4a244150f70fb1223dffe79')

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

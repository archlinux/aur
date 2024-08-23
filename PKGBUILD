# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Alexander Eisele <alexander at eiselecloud dot de>
# Contributor: Asuka Minato

_binname="kubedb"
_pkgname="${_binname}-cli"
pkgname="${_pkgname}-bin"
pkgver=0.47.0
pkgrel=1
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
sha512sums_x86_64=('2a9d784d495d21555fce2e6ff9596182129e7ec4118d58d032a5afbe6ca592c66e4ebeeda7c3792fa78dc7c44dfd960f596e13b861188662cf28964aab885bff')
sha512sums_aarch64=('f8649bae6ac80ea6be76195e2c74b9a2ee45ae394387717b98b915bc0057f04d4ebd0b7ff896141b3a27925f31c79e02eb57d4e41b972beacdc2fa60d726f4e3')
sha512sums_arm=('3398aa2d9df871575f33ae683579d2e8c7758e0129830e9164b241947407c9893c17a34bd0f4725b1b145219bedb8d16923fd3ed2d88cc22a971416b8a7f01c5')

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

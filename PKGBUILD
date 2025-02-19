# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Alexander Eisele <alexander at eiselecloud dot de>
# Contributor: Asuka Minato

_pkgname="kubectl-dba"
pkgname="${_pkgname}-bin"
pkgver=0.52.0
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
sha512sums_aarch64=('a676a640edbfd35f46ff67bfd754b469e94cc93ea054b1275bab23e64f2287c5b43830bb6acbea5619c7ffed6b8cfd698b786851e0c8d7ccb3b6f09dce279bcc')
sha512sums_armv7h=('4a24e2185f8f2df797aa31ed9245169cba6bbb01f966bd375ec5d96edf96ae94c0e242b92f868f5d35213e74580bdfe7f89dbb4a0e85cca200705be7af03b3d2')
sha512sums_x86_64=('df1e556e17015b08fd7c0bd3b255cafabfbbf363a636eaf9bcc624044d9442facae23dc4b5b81cf5b97693d1728c42703ea94e1926df9aed851b5474a3b17212')

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

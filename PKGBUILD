# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Alexander Eisele <alexander at eiselecloud dot de>
# Contributor: Asuka Minato

_pkgname="kubectl-dba"
pkgname="${_pkgname}-bin"
pkgver=0.54.0
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
sha512sums_aarch64=('173915fd8ab725e9a45174e7a9202d96d46c3b00d8098a441b515bbcbef3ee17033dabe2929fcd2077a621c90bc820d0ba7af39b8d1262a78e3dbf18bb38af43')
sha512sums_armv7h=('9be7bf93b6832aaa37fe735ec44e7ea64ef42ad46d52d6d05ce9d5273a58aa4f896871edc1d6cf7ca1ddc0f4495c8e1ab83a0598019626d3caeb798f42128a16')
sha512sums_x86_64=('4689e54194c366f781244e8944e0a6b10517364a2255c25f892d2c59d6241b49137b6226ce082d964b74a39772df3379185031dd0358c4c58461f45c1c360d4e')

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
  chmod +x ./"${_pkgname}-linux-${_arch}"

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

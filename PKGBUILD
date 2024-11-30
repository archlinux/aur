# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="algolia"
pkgname="${_pkgname}-bin"
pkgver=1.6.11
pkgrel=3
pkgdesc="Interact with and configure Algolia applications"
arch=('x86_64' 'i686' 'aarch64' 'armv6h')
url="https://www.algolia.com/doc/tools/cli"
_url="https://github.com/algolia/cli"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${_url}/raw/v${pkgver}/README.md")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_armv6h=("${_pkgsrc}-armv6h.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_armv6.tar.gz")
sha256sums=('d74bc42be4cbafb48fd96d7cbd7759b14ecbfec843de1755b1ed1f0dd55d4c5a')
sha256sums_x86_64=('ef892f73cf0574501ab02f091843c77c09a41ab33e8a5278b21d5b74723e3a2b')
sha256sums_i686=('55138fa98d45decba19f0218ee13739b6fd01a24b5d54f828fd53a66bc88cac9')
sha256sums_aarch64=('a161e1f066cbdb5348228b6e5cad052c4c7da9217f390a1e73e60653d408599c')
sha256sums_armv6h=('4f6f133d284c2b442e9ea8e918eb0cbfdf5bd85e907cadc736ef0306311b3cd1')

case "${CARCH}" in
  x86_64)
    _arch="amd64"
    ;;
  i686)
    _arch="i386"
    ;;
  aarch64)
    _arch="arm64"
    ;;
  armv6h)
    _arch="armv6"
    ;;
  *)
    echo "Unsupported architecture: ${CARCH}"
    exit 1
    ;;
esac

build() {
  cd "${srcdir}/${_pkgsrc//-/_}_linux_${_arch}"
  ./"${_pkgname}" completion powershell > "completions/${_pkgname}.powershell"
}

package() {
  cd "${srcdir}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  cd "${_pkgsrc//-/_}_linux_${_arch}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "completions"
  install -vDm644 "${_pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "${_pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -vDm644 "${_pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_pkgname}.ps1"
}

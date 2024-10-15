# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Alexander Eisele <alexander at eiselecloud dot de>
# Contributor: Asuka Minato

_pkgname="kubectl-dba"
pkgname="${_pkgname}-bin"
pkgver=0.48.1
pkgrel=1
pkgdesc="kubectl plugin for KubeDB"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://kubedb.com"
_url="https://github.com/kubedb/cli"
license=('custom:AppsCode-Community-1.0.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${_url}/raw/v${pkgver}/README.md"
        "LICENSE.md::https://github.com/appscode/licenses/raw/1.0.0/AppsCode-Community-1.0.0.md")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-linux-arm.tar.gz")
sha512sums=('249ab166610634cdb55dd1ee2ad1bfe46905af77e37a6fcd662285cf1784bc71d0981bcea476c06b3679116ed018f42bf8c2d3e01b7c9fd8fe7965efb659b15b'
            '7e3c799dbd2388787c70975914f943fc54cbceb3061c7b70a547c3011a947bd960c976733b90d55eb624ccf440301bcee1f641ef7f9e0eaa29b954b322f3980c')
sha512sums_x86_64=('86a1c9fc6b6c7f373324cede62ef075bf11dff457e8aa5d91cddb52c35e1179a71f7d7aa458cf6722912857b3b2b197e668c42073585def124d5f40c41209bd1')
sha512sums_aarch64=('e3150ddd35a86ea19463c8f4455644711ee23119b2c802d99cc77859ed6cec2734fe5e95364a99a800cf310fdc4ba55db3b24b689097be8d4374807324df64d3')
sha512sums_armv7h=('aee0cf95a754bb44ecb1e6122b9b7192080f02028fe8cefdba4b76c0620fc520668f979190a9a353cc55b29842645546f6de851d5ff3d4bcb55e7fc255b642c9')

case "${CARCH}" in
  x86_64)
    _arch="amd64"
    ;;
  aarch64)
    _arch="arm64"
    ;;
  armv7h)
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
    ./"${_pkgname}-linux-${_arch}" completion "${_sh}" > "completions/${_pkgname}.${_sh}"
  done
}

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}-linux-${_arch}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"

  cd "completions"
  install -Dm644 "${_pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 "${_pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -Dm644 "${_pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm644 "${_pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_pkgname}.ps1"
}

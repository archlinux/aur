# Maintainer:  Berkay Tekin Oz <oss@berkay.tech>

_pkgname="clusterctl"
pkgname="${_pkgname}-bin"
pkgdesc="Cluster API Tool"
pkgver=1.11.3
pkgrel=1
arch=('aarch64' 'powerpc64le' 'x86_64')
url="https://cluster-api.sigs.k8s.io"
_url="https://github.com/kubernetes-sigs/cluster-api"
license=('Apache-2.0')
optdepends=('kubectl: to manage the cluster')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64::${_url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")
source_powerpc64le=("${_pkgsrc}-powerpc64le::${_url}/releases/download/v${pkgver}/${_pkgname}-linux-ppc64le")
source_x86_64=("${_pkgsrc}-x86_64::${_url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_aarch64=('4582079b90f52b3efff3db0b7a9f1202be189bd8b8271033e0956900b962f985')
sha256sums_powerpc64le=('12a26d13e797bd05d49783dedcace586c02aef3a78c248e1c2036251edb6c083')
sha256sums_x86_64=('d65ec7a42c36e863847103d48216c3dad248b82c447a27b3b2325a61e26ead9a')

prepare() {
  cd "${srcdir}"
  mkdir -p "completions"
  chmod +x "${_pkgsrc}-${CARCH}"
}

build() {
  cd "${srcdir}"
  for _sh in bash fish zsh; do
    ./"${_pkgsrc}-${CARCH}" completion "${_sh}" > "completions/${_pkgname}.${_sh}"
  done
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-LICENSE"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "completions"
  install -vDm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "${_pkgname}.zsh"  "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}

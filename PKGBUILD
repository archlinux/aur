# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="clusterctl"
pkgname="${_pkgname}-bin"
pkgdesc="Cluster API Tool"
pkgver=1.10.2
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
sha256sums_aarch64=('806c8bc68a606506734efc5e0d03cfcf9532844446ca5969905052667ee097a2')
sha256sums_powerpc64le=('5f84ffd5da295ef944bec2f273416d29a36b2af16674cea9d236b23cf6dd8ef6')
sha256sums_x86_64=('d169eaaec17f98fd22a1f5faa60644383fa50f8e88d96c2009ad66a5753c562c')

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

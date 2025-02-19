# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="clusterctl"
pkgname="${_pkgname}-bin"
pkgdesc="Cluster API Tool"
pkgver=1.9.5
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
sha256sums_aarch64=('e7d8de987372221891772d526846149bdf42e871700ebf7f8e6f65cfc24d027a')
sha256sums_powerpc64le=('ad383d88506ca19f254ae8aae3458e4234ab79fbaef7aa7a76eb2c556ccad275')
sha256sums_x86_64=('4643cf5570879cb3dc6d55f47651f785bcee9b6f34fefb987797509875c8bbe1')

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

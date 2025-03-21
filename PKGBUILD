# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=rancher-k3d
_pkgname=k3d
pkgver=5.8.3
pkgrel=1
pkgdesc="Little helper to run CNCF's k3s in Docker"
arch=('x86_64')
url='https://github.com/k3d-io/k3d'
license=('MIT')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/k3d-io/k3d/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2ef51e029f43e70dcda616de98980017ca7de18848265525bf7882d2bd66f9f2')
makedepends=('go')
provides=('k3d')
conflicts=('rancher-k3d-bin' 'rancher-k3d-beta-bin')

build() {
  cd $_pkgname-$pkgver
  export GIT_TAG_OVERRIDE=$pkgver
  make build
}

package() {
  install -Dm 755 "${srcdir}/$_pkgname-$pkgver/bin/k3d" "${pkgdir}/usr/bin/k3d"

  # Populate bash and zsh completions
  install -dm 755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm 755 "${pkgdir}/usr/share/zsh/site-functions"
  "${pkgdir}/usr/bin/k3d" completion bash > "${pkgdir}/usr/share/bash-completion/completions/k3d"
  "${pkgdir}/usr/bin/k3d" completion zsh >  "${pkgdir}/usr/share/zsh/site-functions/_k3d"
}

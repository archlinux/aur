# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=kops
pkgver=1.20.2
pkgrel=1
pkgdesc='Kubernetes Operations - Production Grade K8s Installation, Upgrades, and Management (build from src)'
arch=('x86_64')
url='https://github.com/kubernetes/kops'
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kubernetes/kops/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ac046373ff44269d2a5a0bdf4a0c646484e2ce8d451c9066a9155503e595bea8')
makedepends=('go1.15')

build() {
  cd $pkgname-$pkgver
  export VERSION=$pkgver
  sed -i 's/go build/go1.15 build/g' Makefile
  make kops
}

package() {
  install -Dm 755 "${srcdir}/$pkgname-$pkgver/.build/local/kops" "${pkgdir}/usr/bin/kops"

  # Populate bash and zsh completions
  install -dm 755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm 755 "${pkgdir}/usr/share/zsh/site-functions"
  "${pkgdir}/usr/bin/kops" completion bash > "${pkgdir}/usr/share/bash-completion/completions/kops"
  "${pkgdir}/usr/bin/kops" completion zsh >  "${pkgdir}/usr/share/zsh/site-functions/_kops"
}

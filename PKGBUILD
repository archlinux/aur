# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=kops
pkgver=1.17.0
pkgrel=1
pkgdesc='Command line tool for working with kops, build from source'
arch=('x86_64')
url='https://github.com/kubernetes/kops'
license=('Apache')
makedepends=('go')

build() {
  mkdir -p $pkgname-$pkgver
  cd $pkgname-$pkgver
  export GOPATH=`pwd`
  go get -d k8s.io/kops
  cd ${GOPATH}/src/k8s.io/kops/
  git checkout tags/v$pkgver
  export VERSION=$pkgver
  make
}

package() {
  install -Dm 755 "${srcdir}/$pkgname-$pkgver/bin/kops" "${pkgdir}/usr/bin/kops"

  # Populate bash and zsh completions
  install -dm 755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm 755 "${pkgdir}/usr/share/zsh/site-functions"
  "${pkgdir}/usr/bin/kops" completion bash > "${pkgdir}/usr/share/bash-completion/completions/kops"
  "${pkgdir}/usr/bin/kops" completion zsh >  "${pkgdir}/usr/share/zsh/site-functions/_kops"
}

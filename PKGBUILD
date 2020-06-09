# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=istio
pkgver=1.6.1
pkgrel=2
pkgdesc='Istio configuration command line utility for service operators to debug and diagnose their Istio mesh.'
arch=('x86_64')
url='https://github.com/istio/istio'
license=('Apache')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/istio/istio/archive/$pkgver.tar.gz")
sha256sums=('d6102e9362f0d29bb9af7dbf34e277550af4d8f04544166a0c51f2bc442a690e')

build() {
  cd $pkgname-$pkgver
  export VERSION=$pkgver
  export TAG=$pkgver
  export BUILD_WITH_CONTAINER=0
  make build
}

package() {
  install -Dm 755 "${srcdir}/$pkgname-$pkgver/out/linux_amd64/istioctl" "${pkgdir}/usr/bin/istioctl"

  # Populate bash and zsh completions
  install -dm 755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm 755 "${pkgdir}/usr/share/zsh/site-functions"
  "${pkgdir}/usr/bin/istioctl" collateral --bash
  mv istioctl.bash "${pkgdir}/usr/share/bash-completion/completions/istioctl"
  "${pkgdir}/usr/bin/istioctl" collateral --zsh
  mv _istioctl  "${pkgdir}/usr/share/zsh/site-functions/_istioctl"
}

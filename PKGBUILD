# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=istio
pkgver=1.7.3
pkgrel=0
pkgdesc='Istio configuration command line utility for service operators to debug and diagnose their Istio mesh.'
arch=('x86_64')
url='https://github.com/istio/istio'
license=('Apache')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/istio/istio/archive/$pkgver.tar.gz")
sha256sums=('f74a9ca5d0299190ea83715d8ddaf20588081c4f594be1c6057608d2dcaae13a')

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

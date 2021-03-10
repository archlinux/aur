# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=istio
pkgver=1.9.1
pkgrel=1
pkgdesc='Istio configuration command line utility for service operators to debug and diagnose their Istio mesh.'
arch=('x86_64')
url='https://github.com/istio/istio'
license=('Apache')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/istio/istio/archive/$pkgver.tar.gz")
sha256sums=('6753c4cbc67095c6ee141f3059d6fa51bafa7c51a12be22f8af893acff052fe7')

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

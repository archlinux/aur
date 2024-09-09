# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: pandada8 <pandada8@gmail.com>

pkgname=kubectl-no-mask
pkgver=1.31.0
pkgrel=1
pkgdesc="kubectl patched to skip secret mask and some minor diff fix"
arch=(x86_64)
url="https://kubernetes.io/"
license=(Apache)
makedepends=(
  git
  go
)
source=(
  https://github.com/kubernetes/kubernetes/archive/v$pkgver/kubernetes-$pkgver.tar.gz
  no_mask.patch
  kubernetes-1.24.0-static_cgo_enabled.patch
)
sha512sums=('7848802bbd6d6818e55dca4741f4cf32ebd83b2f2f7914323235e0d016ed142feeea16556f6d5ffc7c8a57d122067cfc04e2c1e85368c1a562085e4f479b26c2'
            'dd3c47a1871cc48fa6c6aa29955156d334ce38e9feb7beafc98cc8d71fb1a6a567fe5c8458698755b7bf14050f29473f571dbef85d0f7a8dcfe19b2273b4479b'
            'e98921d111fabf2c353df589dea0fab57b0b174079483b4092741cc50553a3b765cea4c784e42ad9ab90827581cac028af4fc7a2db5acde1877446882393ae78')

prepare() {
  # set static builds CGO_ENABLED=1 for full RELRO
  patch -Np1 -d kubernetes-$pkgver -i ../kubernetes-1.24.0-static_cgo_enabled.patch
  patch -Np1 -d kubernetes-$pkgver -i ../no_mask.patch
}

build() {
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  # NOTE: -mod=readonly in GOFLAGS breaks the build
  export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -ldflags=-compressdwarf=false -modcacherw"
  # NOTE: this also ensures the binaries have full RELRO
  export GOLDFLAGS="-linkmode=external -compressdwarf=false"

  export GOPATH="$srcdir"

  make kubectl DBG=1 KUBE_VERBOSE=5 -C kubernetes-$pkgver
}

package() {
  install -vDm 755 kubernetes-$pkgver/_output/local/bin/linux/*/kubectl  "$pkgdir/usr/bin/kubectl-no-mask"
}

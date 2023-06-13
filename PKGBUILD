# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: pandada8 <pandada8@gmail.com>

pkgname=kubectl-no-mask
pkgver=1.27.2
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
)
sha512sums=('c7a4f6f3e3e6ce66295e9c09b5214ed3b9fa3b674b0b7e200672da5873fbc75533d1e6a5d9e04edba09c81db35e3309dbe6ff6a4a9dffc6687c66a6e5e566b1d'
            'dd3c47a1871cc48fa6c6aa29955156d334ce38e9feb7beafc98cc8d71fb1a6a567fe5c8458698755b7bf14050f29473f571dbef85d0f7a8dcfe19b2273b4479b')

prepare() {
  # set static builds CGO_ENABLED=1 for full RELRO
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

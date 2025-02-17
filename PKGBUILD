# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: pandada8 <pandada8@gmail.com>

pkgname=kubectl-no-mask
pkgver=1.32.1
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
sha512sums=('060ebcd2b0b29391d9605cd059f2c5761f9f51c21e2bdd6d99f086e0e65f476c7d7dc3b4ad9b1507fe2c9d71e9ffbde2555ee67e2c2d7ba97d366af97f995322'
            '081ac65843ca78aa6f18cf133d87c2c47af247b0f4f6afe638ad1d8b6721903edb8763ef94cbbb13f402e54f89fac2041b366207dc3ba5e34a02c0be2a159393'
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

# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=cloudforest-git
pkgver=r430.d014dc3
pkgrel=1
pkgdesc="Fast, flexible, multi-threaded ensembles of decision trees for machine learning in pure Go"
arch=('x86_64')
url='https://github.com/ryanbressler/CloudForest'
license=('custom')
conflicts=('cloudforest' 'cloudforest-bin')
provides=('leafcount'
          'growforest'
          'applyforest'
          'nfold'
          'toafm')
depends=('glibc')
makedepends=('git' 'go')
source=("cloudforest::git+https://github.com/ryanbressler/CloudForest")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/cloudforest"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/cloudforest"
  mkdir -p build/
}

build() {
  cd "${srcdir}/cloudforest"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go get -d -v ./...
  go build -o build ./...
  go clean -modcache # Clean go cache
}

package() {
  cd "${srcdir}/cloudforest"
  install -Dm755 build/leafcount "${pkgdir}/usr/bin/leafcount"
  install -Dm755 build/growforest "${pkgdir}/usr/bin/growforest"
  install -Dm755 build/applyforest "${pkgdir}/usr/bin/applyforest"
  install -Dm755 build/nfold "${pkgdir}/usr/bin/nfold"
  install -Dm755 build/toafm "${pkgdir}/usr/bin/toafm"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p "${pkgdir}/usr/share/cloudforest/data"
  cp -a data/* "${pkgdir}/usr/share/cloudforest/data"
  chmod 644 "${pkgdir}/usr/share/cloudforest/data"/*
}
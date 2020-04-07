# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=cloudforest-git
pkgver=r430.d014dc3
pkgrel=1
pkgdesc="Fast, flexible, multi-threaded ensembles of decision trees for machine learning in pure Go"
arch=('x86_64')
url='https://github.com/ryanbressler/CloudForest'
license=('custom')
provides=('cloudforest'
          'leafcount'
          'growforest'
          'applyforest'
          'nfold'
          'toafm')
makedepends=('git' 'go')
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/CloudForest"
   ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 
}

prepare() {
  cd "${srcdir}/CloudForest"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go get -d -v ./...
}

build() {
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  cd "${srcdir}/CloudForest/leafcount"
  go build -v -o ${srcdir}/leafcount
  cd "${srcdir}/CloudForest/growforest"
  go build -v -o ${srcdir}/growforest
  cd "${srcdir}/CloudForest/applyforest"
  go build -v -o ${srcdir}/applyforest
  cd "${srcdir}/CloudForest/utils/nfold"
  go build -v -o ${srcdir}/nfold
  cd "${srcdir}/CloudForest/utils/toafm"
  go build -v -o ${srcdir}/toafm
}

package() {
  cd "${srcdir}/CloudForest"
  install -Dm755 ${srcdir}/leafcount "${pkgdir}/usr/bin/leafcount"
  install -Dm755 ${srcdir}/growforest "${pkgdir}/usr/bin/growforest"
  install -Dm755 ${srcdir}/applyforest "${pkgdir}/usr/bin/applyforest"
  install -Dm755 ${srcdir}/nfold "${pkgdir}/usr/bin/nfold"
  install -Dm755 ${srcdir}/toafm "${pkgdir}/usr/bin/toafm"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/cloudforest/LICENSE"
  mkdir -p "${pkgdir}/usr/share/cloudforest/data"
  cp -a data/* "${pkgdir}/usr/share/cloudforest/data"
  chmod 644 "${pkgdir}/usr/share/cloudforest/data"/*
  go clean -modcache #Remove go libraries
}
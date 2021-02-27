# Maintainer: Morten Linderud <foxboron@archlinux.org>

pkgname=dep
pkgver=0.5.4
pkgrel=5
pkgdesc="Go dependency management tool"
arch=('x86_64')
url='https://golang.github.io/dep/'
license=('BSD')
makedepends=('go' 'git')
optdepends=('git: fetch git sources')
checkdepends=('mercurial' 'bzr' 'subversion')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/golang/dep/archive/v${pkgver}.tar.gz")
sha256sums=('929c8f759838f98323211ba408a831ea80d93b75beda8584b6d950f393a3298a')

prepare(){
  mkdir -p src/github.com/golang
  ln -rTsf "${pkgname}-${pkgver}" src/github.com/golang/dep
}

build(){
  export GOPATH="${srcdir}"
  cd src/github.com/golang/dep
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go install ./cmd/...
}

# check(){
#   cd src/github.com/golang/dep
#   mkdir -p "${srcdir}/build-cache"
#   DEPCACHEDIR="${srcdir}/build-cache" go test ./...
# }

package(){
  install -Dm755 bin/dep "${pkgdir}/usr/bin/dep"

  cd "${pkgname}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

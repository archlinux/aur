# Maintainer: aksr <aksr at t-com dot me>

pkgname=go-scc-git
pkgver=3.1.0.r8.gfff7a11
pkgrel=1
pkgdesc="A very fast accurate code counter with complexity calculations and COCOMO estimates."
arch=('i686' 'x86_64')
url="https://github.com/boyter/scc"
license=('custom:MIT')
makedepends=('git' 'go')
checkdepends=('git' 'go')
depends=('glibc')
provides=('scc')
conflicts=('scc' 'scc-git')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd scc
  printf "%s" "$(git describe | cut -c2- | sed 's+-+.r+' | tr - .)" 
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  
  cd scc
  [[ -d build ]] || mkdir build 
  go build -o build ./...
}

package() {
  cd scc/
  install -D -m755 build/scc "$pkgdir/usr/bin/scc"
  install -D -m644 README.md "$pkgdir"/usr/share/doc/${pkgname}/README.md
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 UNLICENSE "$pkgdir"/usr/share/licenses/${pkgname}/UNLICENSE
}


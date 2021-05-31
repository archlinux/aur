# Maintainer: willemw <willemw12@gmail.com>

pkgname=appimage-cli-tool-git
pkgver=0.1.4.r0.gc3fcae5
pkgrel=1
pkgdesc="AppImage package manager CLI"
arch=('x86_64')
url="https://github.com/AppImageCrafters/appimage-cli-tool"
license=('MIT')
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip' '!emptydirs')
source=($pkgname::git+$url.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

#prepare(){
#  cd $pkgname
#  mkdir -p build/
#}

build() {
  cd $pkgname
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GOPATH="$srcdir/build"
  go get -v -t -d ./...
  #go build -o "$GOPATH" -v ./...
  go install -v ./...
}

package() {
  #install -Dm755 build/cmd "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm755 build/bin/cmd "$pkgdir/usr/bin/${pkgname%-git}"
}


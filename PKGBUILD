# Maintainer: willemw <willemw12@gmail.com>

pkgname=gdrive-git
pkgver=2.1.0.r35.gfb08fe2
pkgrel=1
pkgdesc="Google Drive CLI Client"
arch=('x86_64')
url="https://github.com/prasmussen/gdrive"
license=('MIT')
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip' '!emptydirs')
source=($pkgname::git+$url.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GOPATH="$srcdir/build"
  go get "${url##*https://}"
}

package() {
  cd build
  install -Dm755 bin/gdrive "$pkgdir/usr/bin/gdrive"
}


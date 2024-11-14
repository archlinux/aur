pkgname=baidupcs-go-git
pkgver=3.9.5.r6.g5612fc3
pkgrel=1
pkgdesc="The terminal utility for Baidu Network Disk (Golang Version)."
arch=('x86_64')
depends=('glibc')
makedepends=('git' 'go-pie')
provides=("baidupcs")
url="https://github.com/qjfoidnh/BaiduPCS-Go"
license=("Apache")
source=("${pkgname%-git}::git+https://github.com/qjfoidnh/BaiduPCS-Go.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  export GOPATH="$SRCDEST/go-modules"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"

  go build -ldflags "-compressdwarf=false -linkmode external -checklinkname=0" .
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 BaiduPCS-Go "${pkgdir}/usr/bin/baidupcs"
}

# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Chris Arndt <aur -at- chrisarndt -dot- de>

_pkgname=doggo
pkgname=$_pkgname-git
pkgver=1.1.5.r0.gc1e6f89
pkgrel=1
pkgdesc="Command-line DNS Client for Humans. Written in Golang" 
arch=(x86_64)
url="https://github.com/mr-karan/doggo"
license=(GPL-3.0-only)
depends=(glibc)
makedepends=(git go)
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git+https://github.com/mr-karan/doggo.git)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  export GOPATH="$srcdir"
  go mod download -modcacherw
}

build() {
  cd $_pkgname
  export GOPATH="$srcdir"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  BUILD_DATE=$(date '+%Y-%m-%d %H:%M:%S')

  go build -v \
    -o build/$_pkgname \
    -ldflags="-X 'main.buildVersion=$pkgver' -X 'main.buildDate=$BUILD_DATE'" \
    ./cmd/doggo/

  ./build/$_pkgname completions bash > $_pkgname.bash
  ./build/$_pkgname completions fish > $_pkgname.fish
  ./build/$_pkgname completions zsh > $_pkgname.zsh
}

package() {
  cd $_pkgname
  install -vdm 755  "$pkgdir"/usr/bin/
  install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/$_pkgname
  install -vDm755 build/$_pkgname -t "$pkgdir"/usr/bin/
  install -vDm644 README.md -t "$pkgdir"/usr/share/doc/$_pkgname
  install -vDm644 $_pkgname.bash "$pkgdir"/usr/share/bash-completion/completions/$_pkgname
  install -vDm644 $_pkgname.fish "$pkgdir"/usr/share/fish/vendor_completions.d/$_pkgname
  install -vDm644 $_pkgname.zsh "$pkgdir"/usr/share/zsh/site-functions/_$_pkgname
}


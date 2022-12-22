# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=golang-deepin-gir-git
pkgver=2.2.0.r4.g1a60448
pkgrel=1
pkgdesc='Generate static golang bindings for GObject'
arch=('any')
url="https://github.com/linuxdeepin/go-gir-generator"
license=('GPL3')
depends=('gtk3' 'libgudev')
makedepends=('git' 'go' 'gobject-introspection')
checkdepends=('golang-gopkg-check.v1')
provides=('golang-deepin-gir')
conflicts=('golang-deepin-gir')
groups=('deepin-git')
source=("$pkgname::git+https://github.com/linuxdeepin/go-gir-generator")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  if [[ ! -z ${sha} ]];then
    git checkout -b $sha
  fi

  mkdir -p "$srcdir"/build/src/github.com/linuxdeepin/

  # Should be fixed upstream
  mkdir -p out/src/github.com/linuxdeepin/go-gir/{glib-2.0,gobject-2.0,gio-2.0,gudev-1.0}

  # https://github.com/linuxdeepin/developer-center/issues/955
  sed -i "s/'Can'tFind'/“Can'tFind”/" lib.in/glib-2.0/keyfile_test.go
}

build() {
  export GOPATH="$srcdir/build:/usr/share/gocode"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GO111MODULE=off
  cd $pkgname
  rm -r gogtk-demo
  make

  mv out/src/github.com/linuxdeepin/go-gir "$srcdir"/build/src/github.com/linuxdeepin/
}

check() {
  # https://github.com/linuxdeepin/developer-center/issues/955
  export GOPATH="$srcdir/build:/usr/share/gocode"
  cd "$srcdir"/build/src/github.com/linuxdeepin/go-gir
  go test -v $(go list ./...)

  cd "$srcdir/$pkgname"
  go run test/memory.go
}

package() {
  mkdir -p "$pkgdir"/usr/share/gocode/src/github.com/linuxdeepin
  cp -a "$srcdir"/build/src/github.com/linuxdeepin/go-gir "$pkgdir"/usr/share/gocode/src/github.com/linuxdeepin
}

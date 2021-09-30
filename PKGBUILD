# Maintainer: Andy Bao <contact@andybao.me>
pkgname=yomichan-import-git
_pkgname=yomichan-import
pkgver=r251.35175a5
pkgrel=2
pkgdesc="External dictionary importer for Yomichan."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/FooSoft/yomichan-import"
license=('MIT')
depends=('gtk3')
makedepends=('go')
source=(
  'yomichan-import::git+https://github.com/FooSoft/yomichan-import#branch=master'
  'yomichan.png::https://raw.githubusercontent.com/FooSoft/yomichan/98975d59231eeedeaa2b17998b56a3c21e5d647e/ext/images/icon128.png'
  'yomichan-import.desktop'
)
sha256sums=("SKIP" "ee78a991f978cc2f53b31b23b04c833093f56443845cd752a6f537c5c2f7b679" "SKIP")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1
  GOFLAGS="-buildmode=pie -trimpath -modcacherw"

  cd "$srcdir/$_pkgname"
  pushd yomichan
  go build $GOFLAGS .
  popd
  pushd yomichan-gtk
  go build $GOFLAGS .
  popd
}

package() {
  install -Dm644 yomichan.png -Dt "${pkgdir}/usr/lib/$_pkgname"
  install -Dm644 yomichan-import.desktop -t "${pkgdir}/usr/share/applications"

  cd "$srcdir/$_pkgname"
  install -Dm755 yomichan/yomichan "${pkgdir}/usr/bin/yomichan"
  install -Dm755 yomichan-gtk/yomichan-gtk "${pkgdir}/usr/bin/yomichan-gtk"
}


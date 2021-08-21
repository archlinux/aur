# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=brpaste
pkgver=2.1.0
pkgrel=1
pkgdesc="A pastebin so fast, it burns rubber"
arch=('x86_64')
url="https://github.com/CosmicToast/brpaste"
license=('MIT') # switch to Unlicense for later versions
makedepends=('go' 'git' 'asciidoctor')
optdepends=(
  'redis: for local instance'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('b9f7ee0e7a9358782ba2a46b9f4bf7cfe5b74ea33e1785cddf038dcd26c6c0720b69a6924128800a81ad28e57b6496822437bd0286c664e1ef4e527f0a9f3b1e')

prepare() {
  cd "$pkgname-$pkgver"

  # create directory for build output
  mkdir build

  # download dependencies
  go mod vendor
}

build() {
  cd "$pkgname-$pkgver"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  # compile binary
  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=vendor \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS}" \
    -o build \
    .

  # generate man page
  asciidoctor -b manpage "doc/$pkgname.adoc"
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "build/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -vr server client "$pkgdir/usr/share/doc/$pkgname"
  install -vDm644 -t "$pkgdir/usr/share/man/man1" "doc/$pkgname.1"
}

# vim:set ts=2 sw=2 et:

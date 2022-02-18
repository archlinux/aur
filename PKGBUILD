# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Daniel Martí <mvdan@mvdan.cc>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: Rémy Oudompheng <remy@archlinux.org>
# Contributor: Andres Perera <andres87p gmail>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>
# Contributor: Christian Himpel <chressie@gmail.com>
# Contributor: Mike Rosset <mike.rosset@gmail.com>
# Contributor: Daniel YC Lin <dlin.tw@gmail.com>
# Contributor: John Luebs <jkluebs@gmail.com>

pkgname=go-beta
_pkgname=go
pkgver=1.18rc1
pkgrel=1
pkgdesc='Core compiler tools for the Go programming language (Unstable version)'
arch=(x86_64)
url='https://golang.org/'
license=(BSD)
makedepends=(go perl)
provides=('go=2:1.18rc1')
conflicts=(go)
options=(!strip staticlibs)
source=(https://storage.googleapis.com/golang/go$pkgver.src.tar.gz)
sha256sums=('5cec7a6653008fa85f8821b33665de37be289b7a02f17f36f705a88c43980bb8')

build() {
  export GOARCH=amd64
  export GOAMD64=v1 # make sure we're building for the right x86-64 version
  export GOROOT_FINAL=/usr/lib/go
  export GOROOT_BOOTSTRAP=/usr/lib/go

  cd "$_pkgname/src"
  ./make.bash -v
}

check() {
  export GO_TEST_TIMEOUT_SCALE=3

  cd $_pkgname/src
  ./run.bash --no-rebuild -v -v -v -k
}

package() {
  cd "$_pkgname"

  install -d "$pkgdir/usr/bin" "$pkgdir/usr/lib/go" "$pkgdir/usr/share/doc/go" \
    "$pkgdir/usr/lib/go/pkg/linux_amd64_"{dynlink,race}

  cp -a bin pkg src lib misc api test "$pkgdir/usr/lib/go"
  cp -r doc/* "$pkgdir/usr/share/doc/go"

  ln -sf /usr/lib/go/bin/go "$pkgdir/usr/bin/go"
  ln -sf /usr/lib/go/bin/gofmt "$pkgdir/usr/bin/gofmt"
  ln -sf /usr/share/doc/go "$pkgdir/usr/lib/go/doc"

  install -Dm644 VERSION "$pkgdir/usr/lib/go/VERSION"

  rm -rf "$pkgdir/usr/lib/go/pkg/bootstrap" "$pkgdir/usr/lib/go/pkg/tool/*/api"

  # TODO: Figure out if really needed
  rm -rf "$pkgdir"/usr/lib/go/pkg/obj/go-build/*

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim: ts=2 sw=2 et

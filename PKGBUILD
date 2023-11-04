# Maintainer: BGME <i@bgme.me>
# Contributor: Arturo Penen <apenen@gmail.com>
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

pkgname=go1.20
_pkgname=go
pkgver=1.20.10
pkgrel=1
pkgdesc='Core compiler tools for the Go programming language'
arch=(x86_64)
url='https://golang.org/'
license=(BSD)
makedepends=(git go)
provides=(go-pie)
options=(!strip staticlibs)
source=(https://go.dev/dl/go${pkgver}.src.tar.gz{,.asc})
validpgpkeys=('EB4C1BFD4F042F6DDDCCEC917721F63BD38B4796')
sha256sums=('72d2f51805c47150066c103754c75fddb2c19d48c9219fa33d1e46696c841dbb'
            'SKIP')

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

  install -d "$pkgdir/usr/bin" "$pkgdir/usr/lib/$pkgname" "$pkgdir/usr/share/doc/$pkgname" \
    "$pkgdir/usr/lib/$pkgname/pkg/linux_amd64_"{dynlink,race}

  cp -a bin pkg src lib misc api test "$pkgdir/usr/lib/$pkgname"
  # We can't strip all binaries and libraries,
  # as that also strips some testdata directories and breaks the tests.
  # Just strip the packaged binaries as a compromise.
  strip $STRIP_BINARIES "$pkgdir/usr/lib/$pkgname"{/bin/*,/pkg/tool/*/*}

  cp -r doc/* "$pkgdir/usr/share/doc/$pkgname"

  ln -sf /usr/lib/$pkgname/bin/go "$pkgdir/usr/bin/go1.20"
  ln -sf /usr/lib/$pkgname/bin/gofmt "$pkgdir/usr/bin/gofmt1.20"
  ln -sf /usr/share/doc/$pkgname "$pkgdir/usr/lib/$pkgname/doc"

  install -Dm644 VERSION "$pkgdir/usr/lib/$pkgname/VERSION"

  rm -rf "$pkgdir/usr/lib/$pkgname/pkg/bootstrap" "$pkgdir/usr/lib/$pkgname/pkg/tool/*/api"

  # TODO: Figure out if really needed
  rm -rf "$pkgdir"/usr/lib/$pkgname/pkg/obj/go-build

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et

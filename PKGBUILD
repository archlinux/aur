# Maintainer: Tommaso Sardelli <lacapannadelloziotom [AT] gmail [DOT] com>
pkgname=go-jsonnet
_basepkgname=jsonnet
pkgver=0.16.0
pkgrel=1
pkgdesc="An implementation of Jsonnet in pure Go"
arch=("x86_64")
url="https://jsonnet.org/"
license=("Apache")
makedepends=("go")
conflicts=('jsonnet' 'go-jsonnet-git')
provides=('jsonnet')
source=("${_basepkgname}_v${pkgver}.tar.gz::https://github.com/google/${_basepkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}_v${pkgver}.tar.gz::https://github.com/google/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('80e0403ec8008cbacff8d9e8fe0e2b5d3bfa306d92c2c11d472e5721015ce4c11be745df10d25715f22f8d8594df69fabf2fe617bdded462ffc5b21f8923606f'
            '741fc0ed5e59960c175afb463dfc38007935d4f9f15fe30088aecfe1cc7825ca637989f06716068e267b92c45fbab6e47a865f0c0e83df6d2bf2fc4f1cd39a9a')

prepare() {
    export GOPATH="${srcdir}"
    export PATH="$PATH:$GOPATH/bin"
    cd "${srcdir}/${pkgname}-${pkgver}"
    go mod download
}

build() {
  # Build jsonnet Go implementation
  cd "$srcdir/${pkgname}-${pkgver}"
  go build ./cmd/jsonnet

  # Build jsonnetfmt from the C++ implementation
  cd "$srcdir/$_basepkgname-$pkgver"
  CFLAGS="$CFLAGS -fPIC -Iinclude" CXXFLAGS="$CXXFLAGS -fPIC -Iinclude -Ithird_party/md5 -Ithird_party/json" make jsonnetfmt
}

check() {
  cd "$srcdir/$_basepkgname-$pkgver"
  CFLAGS="$CFLAGS -fPIC -Iinclude" make test
}

package() {
  # Install jsonnet
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 jsonnet "$pkgdir/usr/bin/jsonnet"

  # Install jsonnetfmt
  cd "$srcdir/$_basepkgname-$pkgver"
  install -m755 jsonnetfmt "$pkgdir/usr/bin/jsonnetfmt"
}

# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu
pkgver=4.3.0
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
makedepends=('go')
conflicts=("gdu" "gdu-bin")
arch=('x86_64')
url="https://github.com/Dundee/gdu"
source=("https://github.com/dundee/gdu/archive/v${pkgver}.tar.gz")
sha256sums=('8952f866948375ad1465f00e78b30a093799f1433a1ddf013f4143cd0883374a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"

  user=`id -u -n`
  time=`LC_ALL=en_US.UTF-8 date`
  goldflags="-s -w \
	  -X 'github.com/dundee/gdu/build.Version=${pkgver}' \
	  -X 'github.com/dundee/gdu/build.User=${user}' \
	  -X 'github.com/dundee/gdu/build.Time=${time}'"

  go build -ldflags="$goldflags" -o $pkgname .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
}


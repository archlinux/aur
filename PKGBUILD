# Maintainer: MF Akane <aur at sorairo dot pictures>
pkgname=mackerel-check-plugins-git
pkgver=0.33.0
pkgrel=2
pkgdesc="Check Plugins for monitoring written in golang"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/mackerelio/go-check-plugins"
license=('Apache')
depends=()
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname"::'git+https://github.com/mackerelio/go-check-plugins.git')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --abbrev=0 | sed 's/^v//' | sed 's/\+.*$$//'
}

build() {
  cd "$srcdir/$pkgname"

  for i in `cat "$srcdir/$pkgname/packaging/deb/debian/source/include-binaries"`; do
    filename=$(basename $i)
    cd "$srcdir/$pkgname/$filename"
    go build -ldflags "-s -w" -o "$srcdir/$pkgname/build/$filename"
  done
}

package() {
  for i in `cat "$srcdir/$pkgname/packaging/deb/debian/source/include-binaries"`; do
    filename=$(basename $i)
    install -Dm755 "$srcdir/$pkgname/build/$filename" "$pkgdir/usr/bin/$filename"
  done
}

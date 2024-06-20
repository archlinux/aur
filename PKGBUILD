# Maintainer: FLX (Paul Werther) <flx@evait.de>
pkgname=byp4xx
pkgver=v0.122.b337580
pkgrel=1
pkgdesc="A tool to bypass 4xx HTTP responses"
arch=('x86_64')
url="https://github.com/lobuhi/byp4xx"
license=('MIT')
depends=()
options=(!debug)
makedepends=('git' 'go')
source=("git+https://github.com/lobuhi/byp4xx.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "v0.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  go build -o byp4xx byp4xx.go
}

package() {
  cd "$srcdir/$pkgname"
  install -dm 755 "$pkgdir/usr/bin"
  install -dm 755 "$pkgdir/usr/share/$pkgname"
  install -dm 755 "$pkgdir/usr/share/$pkgname/templates"
  install -Dm 755 byp4xx "$pkgdir/usr/share/$pkgname/byp4xx"
  cp -r templates/* "$pkgdir/usr/share/$pkgname/templates/"
  cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
cd /usr/share/$pkgname
exec ./$pkgname "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/$pkgname"
}

# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=remarshal
pkgver=0.3.0
pkgrel=1
pkgdesc="Convert between TOML, YAML and JSON"
arch=('i686' 'x86_64')
makedepends=('git' 'go')
url="https://github.com/dbohdan/remarshal"
license=('MIT')
options=('!strip' '!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/dbohdan/$pkgname/tar.gz/v$pkgver)
sha256sums=('b011d955bac62253dbfdb79abfa37b0a1f175618f2707ebbd0337532672ce683')

prepare() {
  msg 'Fetching toml go bindings...'
  GOPATH="$srcdir" go get -d github.com/BurntSushi/toml

  msg 'Fetching yaml go bindings...'
  GOPATH="$srcdir" go get -d gopkg.in/yaml.v2
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Building...'
  GOPATH="$srcdir" go build remarshal.go
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  msg 'Installing...'
  install -Dm 755 remarshal "$pkgdir/usr/bin/remarshal"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}

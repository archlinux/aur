# Maintainer: Olivier Biesmans <o.archlinux@biesmans.fr>

_gopkgname=github.com/mozilla/tls-observatory/tlsobs
_pkgname=tlsobs
pkgname=$_pkgname-git
pkgver=20160712+9a8a92b
pkgrel=1
pkgdesc="An observatory for TLS configurations, X509 certificates, and more."
arch=('x86_64' 'i686')
url="https://github.com/mozilla/tls-observatory"
license=('MPL')
makedepends=('go')
depends=()
options=('!strip' '!emptydirs')
source=("tls-observatory::git+https://github.com/mozilla/tls-observatory")
sha256sums=('SKIP')

pkgver() {
  cd "tls-observatory"
  # mimic BUILDREV for Makefile
  printf "%s+%s" "$(date +%Y%m%d)" "$(git log --pretty=format:'%h' -n 1)"
}

prepare() {
  _gopkgpath="$srcdir/gopath/src/github.com/mozilla/tls-observatory"
  if [[ ! -L "$_gopkgpath" ]]; then
    mkdir -p $(dirname $_gopkgpath)
    ln -s "$srcdir/tls-observatory" "$_gopkgpath"
  fi
}

build() {
  #cd "$_pkgname"
  #make tlsobs
  GOPATH="$(pwd)/gopath" go build -o "$srcdir/build/$_pkgname" "$_gopkgname"
  #GOPATH="$srcdir/gopath" make tlsobs
}

package() {
  install -Dm755 "$srcdir/build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/tls-observatory/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

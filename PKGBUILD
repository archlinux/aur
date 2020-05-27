# Maintainer: Chris Snell <chris.snell@gmail.com>

pkgname=captive-browser-git
_pkgname=captive-browser
pkgver=r18.0845056
pkgrel=1
pkgdesc="A dedicated Chrome instance to log into captive portals without messing with DNS settings"
arch=('x86_64' 'i686' 'arm')
url="https://blog.filippo.io/captive-browser"
conflicts=('captive-browser')
provides=('captive-browser')
optdepends=('chromium: used to log into captive portal'
           'google-chrome: used to log into captive portal')
options=('!strip')
license=('MIT')
makedepends=('go' 'git')
source=('git+https://github.com/FiloSottile/captive-browser.git')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname"

  # Force our own git checkout
  export GOPATH="$srcdir"
  mkdir -p "$GOPATH/src/github.com/FiloSottile"
  ln -s `pwd` "$GOPATH/src/github.com/FiloSottile/captive-browser"

  go get -d -v github.com/BurntSushi/toml
  go get -d -v github.com/armon/go-socks5
  go get -d -v github.com/FiloSottile/captive-browser
  go build
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 captive-browser-ubuntu-chrome.toml "$pkgdir/usr/share/$_pkgname/example/captive-browser.toml"
}


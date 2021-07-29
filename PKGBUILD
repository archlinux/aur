# Maintainer: Chris Snell <chris.snell@gmail.com>

pkgname=captive-browser-git
_pkgname=captive-browser
pkgver=r19.0293a07
pkgrel=2
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
install=captive-browser-git.install


pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname"

  # Remove the vendored modules
  rm -rf vendor/

  # Use go mod to handle deps
  go mod init captive-browser
  go mod tidy

  go build
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 captive-browser-ubuntu-chrome.toml "$pkgdir/usr/share/$_pkgname/example/captive-browser.toml"
}


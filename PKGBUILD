# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=electrum-sync-server-git
pkgver=20150410
pkgrel=1
pkgdesc="Server component for the Bitcoin wallet Electrum's label synchronization feature"
arch=('i686' 'x86_64')
depends=('sqlite')
makedepends=('git' 'go')
url="https://github.com/maran/electrum-sync-server"
license=('Unknown')
options=('!strip' '!emptydirs')
source=(git+https://github.com/maran/electrum-sync-server)
sha256sums=('SKIP')
provides=('electrum-sync-server')
conflicts=('electrum-sync-server')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  GOPATH="$srcdir" go get -u github.com/maran/electrum-sync-server
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"

  msg2 'Installing binaries...'
  for _bin in `find "$srcdir/bin" -mindepth 1 -maxdepth 1 -type f -printf '%f\n'`; do
    install -Dm 755 "$srcdir/bin/$_bin" "$pkgdir/usr/bin/$_bin"
  done

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}

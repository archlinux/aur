# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgbase=sia
pkgname=('siad')
pkgver=20170103
pkgrel=1
pkgdesc="Blockchain-based marketplace for file storage"
arch=('i686' 'x86_64')
makedepends=('git' 'go' 'make')
url="https://sia.tech"
license=('MIT')
source=(git+https://github.com/NebulousLabs/Sia)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Sia"
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  msg2 'Building...'
  export GOPATH="$srcdir"
  go get -v -u github.com/NebulousLabs/Sia/...
  cd "$GOPATH/src/github.com/NebulousLabs/Sia"
  make release-std
}

package_siad() {
  cd "$srcdir/Sia"

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/siad"

  msg2 'Installing documentation...'
  install -dm 755 "$pkgdir/usr/share/doc/siad"
  cp -dpr --no-preserve=ownership README.md doc/* "$pkgdir/usr/share/doc/siad"

  msg2 'Installing...'
  for _bin in siac siad; do
    install -Dm 755 "$srcdir/bin/$_bin" -t "$pkgdir/usr/bin"
  done
}

# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vuvuzela-git
pkgver=20160420
pkgrel=1
pkgdesc="Scalable Private Messaging"
arch=('i686' 'x86_64')
depends=('ncurses')
makedepends=('git' 'go')
url="https://github.com/davidlazar/vuvuzela"
license=('AGPL3')
source=(git+https://github.com/davidlazar/vuvuzela)
sha256sums=('SKIP')
provides=('vuvuzela')
conflicts=('vuvuzela')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  GOPATH="$srcdir" TMPDIR=/tmp go get -u -v github.com/davidlazar/vuvuzela/...
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing documentation...'
  install -dm 755 "$pkgdir/usr/share/doc/${pkgname%-git}"
  for _doc in README.md confs screenshots; do
    cp -dpr --no-preserve=ownership $_doc \
      "$pkgdir/usr/share/doc/${pkgname%-git}"
  done

  msg2 'Installing executables...'
  find "$srcdir/bin" -mindepth 1 -maxdepth 1 -type f -exec \
    install -Dm 755 '{}' -t "$pkgdir/usr/bin" \;

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}

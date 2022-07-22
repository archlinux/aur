# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=alsa-scarlett-gui
pkgver=0.2
pkgrel=1
pkgdesc='GUI for the ALSA controls presented by the Focusrite Scarlett Gen 2/3 mixer driver'
arch=('x86_64')
url='https://github.com/geoffreybennett/alsa-scarlett-gui'
license=('GPL3' 'LGPL3')
depends=('gtk4' 'alsa-lib')
makedepends=('git')
_commit='d085fd49c1a8ef3dda348d06b1d7381adccaaf2f'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # remove incorrect keys in desktop file
  sed \
    -i src/vu.b4.alsa-scarlett-gui.desktop.template \
    -e '/^Value=.*/d' \
    -e '/^Encoding=.*/d'
}

build() {
  cd "$pkgname"

  make \
    -C src \
    PREFIX=/usr \
    VERSION="$pkgver"
}

package() {
  cd "$pkgname"

  make \
    -C src \
    PREFIX="$pkgdir/usr" \
    VERSION="$pkgver" \
    install

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname/img" img/*
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname/demo" demo/*
}

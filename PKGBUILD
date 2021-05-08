# Maintainer: Dylan <dylan@psilly.com>
# Forked from opentracker

_pkgbase=opentracker
pkgname=opentracker-ipv6
pkgver=2021.04.25
pkgrel=1
pkgdesc='A free and open torrent tracker, compiled as an IPv6-only tracker.'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://erdgeist.org/arts/software/opentracker/"
license=('Beerware')
backup=("etc/$pkgname/$pkgname.conf")
makedepends=('git')
makeconflicts=('dietlibc')
install="$pkgname.install"
source=('git://erdgeist.org/opentracker'
        'https://www.fefe.de/libowfat/libowfat-0.31.tar.xz'
        "$pkgname.service")
sha256sums=('SKIP'
            'd1e4ac1cfccbb7dc51d77d96398e6302d229ba7538158826c84cb4254c7e8a12'
            '9766a13f0d5e9dfb4425aee20e77dc7c47500edf50691e4029c96738a78d3767')

pkgver() {
  cd "$srcdir/$_pkgbase"
  git log -n 1 --pretty=format:"%cd" --date=short | sed "s/-/./g"
}

build() {
  ln -sf libowfat-0.31 libowfat
  cd libowfat
  make
  cd ..
  cd $_pkgbase
  sed -i '/^#FEATURES+=-DWANT_V6/s/^#//' Makefile
  make
}

package() {
  install -Dm0755 $srcdir/$_pkgbase/$_pkgbase $pkgdir/usr/bin/$pkgname
  install -Dm0644 $srcdir/$_pkgbase/$_pkgbase.conf.sample $pkgdir/etc/$pkgname/$pkgname.conf
  install -Dm0644 $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
}


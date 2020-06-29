# Maintainer: SanskritFritz (gmail)
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Georg Vogetseder <georg.vogetseder@gmail.com>

pkgname=hamster-time-tracker_legacy
_pkgname=hamster-time-tracker
pkgver=1.04
pkgrel=2
pkgdesc="Time tracking application that helps you to keep track on how much time you have spent during the day on activities you choose to track (Legacy 1.04 version)"
arch=('any')
url="https://github.com/projecthamster/hamster"
license=('GPL')
depends=('python2-dbus' 'python2-gconf' 'python2-notify' 'python2-wnck' 'python2-xdg' 'desktop-file-utils')
makedepends=('intltool')
conflicts=('hamster-time-tracker')
provides=('hamster-time-tracker')
source=(https://github.com/projecthamster/hamster/archive/$_pkgname-$pkgver.tar.gz)
md5sums=('148ffee0c26c5c4ddfa4ebc9a21fa860')

prepare() {
  cd hamster-$_pkgname-$pkgver

  # Python2 fix
  find . -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'

  # Fix version number
  sed -i '/VERSION/ s/1.03.3/1.04/' wscript
}

build() {
  cd hamster-$_pkgname-$pkgver
  python2 ./waf configure --prefix=/usr
  python2 ./waf build
}

package() {
  cd hamster-$_pkgname-$pkgver
  python2 ./waf install --destdir=$pkgdir

  # Move bash completion and GConf schema to its correct place
  install -dm755 "$pkgdir/usr/share/bash-completion/completions"
  mv "$pkgdir/etc/bash_completion.d/hamster.bash" "$pkgdir/usr/share/bash-completion/completions/hamster"
  mv "$pkgdir/etc/gconf" "$pkgdir/usr/share"
  rm -r "$pkgdir/etc"
}

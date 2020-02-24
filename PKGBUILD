# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>
# Maintainer: Vsevolod Ivanov <seva@binarytrails.net>
# Contributor: Daniel Wallace <daniel.wallace at gatech dot edu>

_pkgname_base=irssi-libnotify
pkgname=$_pkgname_base-git

pkgver=r59.7ada59a
pkgrel=2
pkgdesc="libnotify plugin for irssi"
arch=("any")
url="https://github.com/stickster/irssi-libnotify"
license=('GPL')
depends=('irssi' 'libnotify>=0.7' 'python2-gobject' 'perl-html-parser' 'python2-dbus')
makedepends=('git')

source=($pkgname::'git+https://github.com/stickster/irssi-libnotify'
        'irssi-libnotify-git.install')

install=irssi-libnotify-git.install

md5sums=('SKIP'
         'bf976922f1e60bfd6a6f2dbb682d8d79')

pkgver() {
  cd $srcdir/$pkgname

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$pkgname

  sed -i 's:python:&2:' notify-listener.py
  sed -i 's?~/bin/irssi-notifier.sh?/usr/bin/irssi-notifier?' notify.pl
}

package() {
  cd $srcdir/$pkgname

  install -Dm755 irssi-notifier.sh  $pkgdir/usr/bin/irssi-notifier
  install -Dm755 notify-listener.py $pkgdir/usr/bin/notify-listener.py
  install -Dm644 notify.pl          $pkgdir/usr/share/irssi/scripts/notify.pl
  install -Dm755 notify-listener.service $pkgdir/home/$USER/.config/systemd/user/notify-listener.service
}

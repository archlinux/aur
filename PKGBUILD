# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Kirill Malyshev <keryascorpio at gmail.com>
# Contributor: Robert Orzanna <orschiro@googlemail.com>

pkgname=oblogout-blurlock
pkgver=20190226
pkgrel=1
pkgdesc="Systemd/OpenRC-compatible logout script for Openbox, Fluxbox and others. Including blurlock and additional new button themes by UgoYak"
url="https://github.com/oberon-manjaro/oblogout-blurlock"

_repo=oblogout-blurlock
_snapshot=c1b8fd7c5884d60fa47afca7b3d656993fcf9d42
_forkname=oblogout-fork
_forkroot="git://github.com/Cloudef/oblogout-fork.git"

arch=('any')
license=('GPL2')
depends=('i3lock'
	'imagemagick'
	'pygtk'
	'python2-pillow'
	'python2-distutils-extra'
	'python2-dbus')
optdepends=('lightdm: for switch-user function')
makedepends=('git')
install=$pkgname.install 
conflicts=('fluxlogout'
	'oblogout'
	'openboxlogout-gnome'
	'oblogout-manjaro')
replaces=('fluxlogout')
backup=('etc/oblogout.conf')
source=("$_repo-$pkgver.tar.gz::$url/archive/$_snapshot.tar.gz")
md5sums=('c463cac76d3b767d2babf5f5f9555989')

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_forkname ] ; then
    cd $_forkname && git pull origin
    msg "The local files are updated."
  else
    git clone $_forkroot $_forkname --dept=1
  fi

  cd "$srcdir/$_forkname"

  patch -p1 < "$srcdir/$_repo-$_snapshot/switch-user.patch"
}
pkgver() {
	date +'%Y%m%d'
}
package() {
  cd "$srcdir/$_forkname"
  python2 setup.py install --root="$pkgdir/"

  cd $srcdir/$_repo-$_snapshot
  install -dm755 $pkgdir/usr/share/themes
  cp -r $srcdir/$_repo-$_snapshot/themes/* $pkgdir/usr/share/themes

  install -m755 blurlock $pkgdir/usr/bin/
  install -m755 fluxboxexit $pkgdir/usr/bin
  install -m755 ob_blurlock $pkgdir/usr/bin
  install -m755 oblogout_blur $pkgdir/usr/bin
  install -Dm644 oblogout.conf $pkgdir/etc/oblogout-manjaro.conf
}

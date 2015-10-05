# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Kirill Malyshev <keryascorpio at gmail.com>
# Contributor: Robert Orzanna <orschiro@googlemail.com>

pkgname=oblogout-blurlock
pkgver=20151005
pkgrel=1
pkgdesc="Systemd/OpenRC-compatible logout script for Openbox, Fluxbox and others. Including blurlock"
url="https://github.com/oberon2007/oblogout-blurlock"

_repo=oblogout-blurlock
_snapshot=18b3e56d0bac6ed8b555d2e743198a41f3c1a9e1
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
md5sums=('d60fd250cad6288cdef8d62adb8f40e6')

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

  cd "$srcdir/$_repo-$_snapshot/"
  install -m755 "fluxboxexit" "$pkgdir/usr/bin/"
  install -m755 "ob_blurlock" "$pkgdir/usr/bin/"
  install -m755 "oblogout_blur" "$pkgdir/usr/bin/"
  install -Dm644 "oblogout.conf" "$pkgdir/etc/oblogout-blurlock.conf"
  mkdir -p "$pkgdir/usr/share/themes/OutMok" \
	"$pkgdir/usr/share/themes/OutMok-small"
  cp -r "OutMok/oblogout" "$pkgdir/usr/share/themes/OutMok"
  cp -r "OutMok-small/oblogout" "$pkgdir/usr/share/themes/OutMok-small"
}

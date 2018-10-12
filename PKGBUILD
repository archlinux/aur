#Contributor: mathieu.clabaut <mathieu.clabaut@gmail.com>

pkgname=notifymuch-git
pkgver=r39.9d4aaf5
pkgrel=3
pkgdesc="Display desktop notifications for unread mail in notmuch database"
arch=('i686' 'x86_64')
url="https://github.com/kspi/notifymuch"
license=('GPL2')
provides=('notifymuch-git')
conflict=()
makedepends=( 'pygobject-devel')
depends=('python' 'notmuch' 'python-setuptools' 'hicolor-icon-theme' 'python-gobject' )
optdeps=()
source=('notifymuch::git://github.com/kspi/notifymuch' notifymuch.desktop
notifymuch.png)
md5sums=('SKIP'
         'cdcb64c98b5abf94525bf37f0764287c'
         '4f2822f4ea6ab4a5e935b03804fde698')


build() {
  cd $srcdir/notifymuch
  python setup.py build || return 1
}

package() {
  cd $srcdir/notifymuch
  python setup.py install --root=$pkgdir || return 1
  install -m755  -d $pkgdir/usr/share/icons/hicolor/512x512/apps/
  install -m644  $srcdir/notifymuch.png $pkgdir/usr/share/icons/hicolor/512x512/apps/
  install -m755 -d  $pkgdir/usr/share/applications/
  install -m644 $srcdir/notifymuch.desktop  $pkgdir/usr/share/applications/
}


pkgver() {
  cd "$srcdir/notifymuch"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

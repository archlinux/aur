# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=econnman-git
_pkgname=econnman
pkgver=1.20
pkgrel=1
pkgdesc="Enlightenment ConnMan user interface - Development version"
arch=('any')
url="http://www.enlightenment.org"
license=('LGPL3')
depends=('python2-efl-git' 'python2-e_dbus' 'connman')
makedepends=('git')
provides=('econnman')
conflicts=('econnman' 'econnman-svn')
source=("git://git.enlightenment.org/apps/$_pkgname.git"
        'bindings-update.patch'
        'configure.patch')
md5sums=('SKIP'
         'f07a35832209505768c7fcd375a2de59'
         '9006b3b8d28dbd9a944c497fec40d79f')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  echo $(awk -F , '/^AC_INIT/ {print $2}' configure.ac | tr -d '[ ]').$(git rev-list --count HEAD)
}

prepare() {
# Run with python2
  sed -i 's:/usr/bin/python:/usr/bin/python2:' "$srcdir/$_pkgname/econnman-bin.in"

# Patch for new bindings
  cd "$srcdir/$_pkgname"
  patch -Np1 < ../bindings-update.patch
  patch -Np0 < ../configure.patch
}

build() {
  cd "$srcdir/$_pkgname"

  PYTHON=python2 \
  ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install
}

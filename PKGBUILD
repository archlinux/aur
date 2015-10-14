# Contributor: Mark Pustjens <pustjens@dds.nl>
# Previous Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Previous Contributor: Giorgio Lando <patroclo7@gmail.com>
# Previous Contributor: Leslie P. Polzer <polzer@gnu.org>
pkgname=isync-git
pkgver=20120128
pkgrel=1
pkgdesc="IMAP mail synchronizer for offline/batch mail editing"
url="http://isync.sourceforge.net/"
arch=(i686 x86_64)
license=(GPL)
depends=(openssl)
source=('autogen-fix.patch')
conflicts=(isync)
replaces=(isync)

_gitname="isync"
_gitroot="git://git.code.sf.net/p/isync/isync"

build() {

  cd "$srcdir"
  msg "Connecting to GIT server...."
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"

  cd $srcdir/$_gitname
  patch -p1 -i $srcdir/autogen-fix.patch
  touch $srcdir/$_gitname/ChangeLog
  ./autogen.sh || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd $srcdir/$_gitname
  make DESTDIR="${pkgdir}" install
}
md5sums=('5bcc624e7765c38ac6d568aeb20d93dc')

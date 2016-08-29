# Maintainer: rafaelff <rafaelff@gnome.org>

pkgname=direvent-git
pkgver=5.1.90.r144.d744882
pkgrel=1
pkgdesc="Daemon that monitors events in the file system directories"
arch=('i686' 'x86_64')
url="http://www.gnu.org.ua/software/direvent/"
license=("GPL")
conflicts=('direvent')
provides=('direvent')
depends=('glibc')
makedepends=('git' 'rsync')
source=(git://git.gnu.org.ua/direvent.git
        git://git.gnu.org.ua/grecs.git)
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd direvent
    
  v=`grep AC_INIT configure.ac | cut -d[ -f3 | cut -d] -f1` # get version
  r=`git rev-list --count HEAD` # get git revision
  h=`git rev-parse --short HEAD` # get sha1's short output
  printf "$v.r$r.$h"
}

prepare() {
  cd direvent
  git submodule init
  git config submodule.grecs.url $srcdir/grecs
  git submodule update
}

build() {
  cd direvent
  ./bootstrap
  ./configure --prefix=/usr
  make
}

check() {
  cd direvent
  make check
}

package() {
  cd direvent
  make DESTDIR="$pkgdir/" install
}

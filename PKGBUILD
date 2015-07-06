# Contributor: Dmytro Kostiuchenko <edio@archlinux.us>
# Maintainer: Dmytro Kostiuchenko <edio@archlinux.us>

pkgname=rsibreak-git
pkgver=20120611
pkgrel=2
pkgdesc="RSIBreak takes care of your health and regularly breaks your work to avoid repetitive strain injury (RSI)"
arch=(i686 x86_64)
url="http://userbase.kde.org/RSIBreak"
license=('GPL')
depends=('libxss' 'kdelibs' 'oxygen-icons')
makedepends=('automoc4' 'git')
options=('libtool')
provides=('rsibreak')
conflicts=('rsibreak')

source=()
md5sums=()

_gitroot=git://anongit.kde.org/rsibreak.git
_gitname=rsibreak

build() {
  cd ${srcdir}

  msg "Conneckint to GIT server"

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"

  rm -rf "$srcdir/$_gitname-build"
  mkdir $srcdir/$_gitname-build
  cd "$srcdir/$_gitname" && ls -A | grep -v .git | xargs -d '\n' cp -r -t ../$_gitname-build 
  cd "$srcdir/$_gitname-build"
 
  cmake ../${_gitname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  cd ${srcdir}/$_gitname-build
  make DESTDIR=${pkgdir} install
}
# vim:syntax=sh


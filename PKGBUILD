# Maintainer: Hyacinthe Cartiaux
pkgname=qconf-git
pkgver=1.5_20150603
pkgrel=1
pkgdesc="Qt5 compatible qconf - Qt configuration tool"
arch=('i686' 'x86_64')
url="https://github.com/psi-plus/qconf"
license=('GPL2')
depends=('qt4')
makedepends=('git')
conflicts=(qconf)
provides=(qconf)
source=(git+https://github.com/psi-plus/qconf.git)
md5sums=('SKIP')

pkgver() {
  echo  1.5_$(date +"%Y%m%d")
}

_gitroot=https://github.com/psi-plus/
_gitname=qconf
build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build/"

  # BUILD HERE

  ./configure --prefix=/usr
  make

}

package() {
  cd $srcdir/qconf-build

  make INSTALL_ROOT="$pkgdir" install
}


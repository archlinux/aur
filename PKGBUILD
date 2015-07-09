# Maintainer: Myles English <myles at rockhead dot biz>
pkgname=viper-git
#_lpname=fenics-viper
pkgver=1
pkgrel=2
pkgdesc="A minimalistic scientific plotter and run-time visualization module with support for visualising meshes and solutions in DOLFIN."
arch=('i686' 'x86_64')
url="https://launchpad.net/fenics-viper"
license=('GNU LGPL v2.1')
groups=('fenics-git')
depends=('python2' 'vtk') # numpy
makedepends=('git')
conflicts=('viper')
provides=('viper')
options=(!emptydirs)

_gitroot="https://bitbucket.org/fenics-project/viper.git"
_gitname=viper

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

    find ./ -name "*" -type f -exec \
 	sed -i 's#\(/usr/bin/env \|/usr/bin/\)python[2-3]*#\1python2#' {} \;

    python2 setup.py install --prefix=/usr --root="$pkgdir"
}

package() {
  return 0
}

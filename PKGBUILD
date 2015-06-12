# Contributor: Jameson Pugh <imntreal@gmail.com>
# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=libappstore-bzr
pkgver=22
pkgrel=1
pkgdesc="Provides access to the Ubuntu app store through PackageKit"
arch=('i686' 'x86_64')
url=http://launchpad.net/libappstore
license=('GPL' 'LGPL')
depends=('packagekit' 'sqlheavy' 'libgee' 'gtk3')
makedeps=('cmake')
conflicts=('libappstore')
replaces=('libappstore')

_bzrtrunk=lp:libappstore
_bzrmod=libappstore

build() {
  cd "$srcdir"

  if [ -d ${_bzrmod} ]; then
      bzr up ${_bzrmod}
      msg "The local files are updated."
  else
      bzr co ${_bzrtrunk} ${_bzrmod}
  fi
  msg "Bazaar checkout done or server timeout"
  msg "Starting make..."
  if [[ -d ${srcdir}/build ]]; then
      msg "Cleaning the previous build directory..."
      rm -rf ${srcdir}/build 
  fi
  bzr clone ${srcdir}/${_bzrmod} ${srcdir}/build
  cd ${srcdir}/build

    [[ -d build ]] || mkdir build
    cd build

    cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
             -DCMAKE_BUILD_TYPE=Release

    make
}

package() {
  cd "$srcdir/build/build"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

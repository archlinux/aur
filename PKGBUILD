# Maintainer: Nick Lanham <nick@afternight.org>
pkgname=drmr-falktx-git
pkgver=20150509
pkgrel=1
pkgdesc="DrMr is an LV2 sampler plugin that can play Hydrogen drumkits. This version enables plugin state saving using strings."
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/falkTX/drmr"
groups=('drmr')
depends=('libsndfile' 'libsamplerate' 'expat' 'lv2')
makedepends=('git')
provides=('drmr')
conflicts=('drmr')

_gitroot="git://github.com/falkTX/drmr.git"
_gitname="drmr"

build() {
  cd "${srcdir}/"
  msg "Getting git sources"

  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "Git checkout finished"

  msg "Building package"

  msg "PKG: $pkgdir"

  cd ${srcdir}/${_gitname}
  git checkout lv2unstable

  [ -d build ] || mkdir build && cd build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}/build"
  make DESTDIR="$pkgdir/" install
}

# Maintainer: Michele Mocciola <mickele>

pkgname=salome-hexablock
pkgver=7.6.0
pkgrel=1
pkgdesc="Generic platform for Pre and Post-Processing for numerical simulation - HEXABLOCK Module"
url="http://www.salome-platform.org"
depends=('salome-geom>=7.6.0' 'salome-geom<7.7.0')
makedepends=('doxygen' 'python2-sphinx' 'swig2')
arch=('i686' 'x86_64')
license=('LGPL')
source=(${pkgname}.profile)

_source=hexablock
_installdir=/opt/salome/hexablock

prepare() {
  msg "Connecting to git server..."

  if [[ -d ${_source} ]] ; then
     rm -rf ${_source}
  fi

  git clone git://git.salome-platform.org/modules/${_source}.git
  cd ${_source}
  git checkout V${pkgver:0:1}_${pkgver:2:1}_${pkgver:4:1}

  msg "GIT checkout done or server timeout"

  # python -> python2
  for _FILE in `grep -Rl "/usr/bin/env python" * `
  do
	sed -e "s|/usr/bin/env python|/usr/bin/env python2|" -i ${_FILE}
  done
}

build() {
  source /etc/salome/profile.d/salome-kernel.sh
  source /etc/salome/profile.d/salome-gui.sh
  source /etc/salome/profile.d/salome-geom.sh

  rm -rf "$srcdir/$_source/build"
  mkdir -p "$srcdir/$_source/build"
  cd "$srcdir/$_source/build"

  cmake .. \
     -DCMAKE_INSTALL_PREFIX=$_installdir \
     -DPYTHON_EXECUTABLE=/usr/bin/python2 \
     -DSWIG_EXECUTABLE=/usr/bin/swig-2 \
     -DLIBXML2_ROOT_DIR=/usr \
     -DLibXml2_DIR=/usr/lib/cmake/libxml2 \
     -DLIBXML2_INCLUDE_DIR=/usr/include/libxml2 \
     -DSPHINX_EXECUTABLE=/usr/bin/sphinx-build2 \
     -DSPHINX_APIDOC_EXECUTABLE=/usr/bin/sphinx-apidoc2
     
  make
}

package() {
  cd "$srcdir/$_source/build"

  make DESTDIR="$pkgdir/" install

  install -D -m755 "$srcdir/$pkgname.profile" \
                   "$pkgdir/etc/salome/profile.d/$pkgname.sh"
}
md5sums=('decac3c084d3d9eba96ea046276bad6e')

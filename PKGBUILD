# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines

# Maintainer: Frederic Van Assche <frederic@fredericva.com>
pkgname=garfieldpp-svn
pkgver=r421
pkgrel=1
pkgdesc="Garfield++ is a toolkit for the detailed simulation of detectors which use gases or semi-conductors as sensitive medium"
arch=('i686' 'x86_64')
url="http://garfieldpp.web.cern.ch/garfieldpp/"
license=('unknown')
depends=('root>=5.0')
makedepends=('subversion')
provides=(garfieldpp)
conflicts=(garfieldpp)
source=('garfieldpp.sh'
        'garfieldpp.csh'
        'fix-build.patch')
sha256sums=('aa721f27406960e63a682afd8c599c71dd31d18ee6014cadee31293549bf1771'
            'b859ef8d6f29de9939b795bde520a3231686ac8932ef878a3b3a279b5ae023ef'
            'cd1814cbce8628db2134c97c0a44339fd52717eebe87dcbc35252fb71ab744ef')

_svntrunk=http://svn.cern.ch/guest/garfield/trunk
_svnmod=garfieldpp

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  patch -p1 -i "$srcdir/fix-build.patch"

  #
  # BUILD HERE
  #
  mkdir build && cd build
  cmake -Wno-dev -Wno-pedantic -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir/$_svnmod-build/build"
  make install

  install -dv "${pkgdir}/usr/share/cmake"
  mv "${pkgdir}/usr/cmake" "${pkgdir}/usr/share/cmake/Modules"

  install -dv "${pkgdir}/usr/include/garfieldpp"
  install -m644 ../Include/*.hh "${pkgdir}/usr/include/garfieldpp"

  install -dv "${pkgdir}/usr/share/garfieldpp"
  cp -R ../Heed/heed++/database "${pkgdir}/usr/share/garfieldpp/heed-database"

  install -dv "${pkgdir}/etc/profile.d"
  install -m755 "${srcdir}/garfieldpp.csh" "${pkgdir}/etc/profile.d"
  install -m755 "${srcdir}/garfieldpp.sh" "${pkgdir}/etc/profile.d"
}

# vim:set ts=2 sw=2 et:
sha256sums=('aa721f27406960e63a682afd8c599c71dd31d18ee6014cadee31293549bf1771'
            'b859ef8d6f29de9939b795bde520a3231686ac8932ef878a3b3a279b5ae023ef'
            '6afedcbaf7a98bee9a6d414dc0d8aecf76178644c6aa087565bd134ecdfeab46')
sha256sums=('aa721f27406960e63a682afd8c599c71dd31d18ee6014cadee31293549bf1771'
            'b859ef8d6f29de9939b795bde520a3231686ac8932ef878a3b3a279b5ae023ef'
            '19b56366f715f50b3f4f9d72d496a6ac03f8a5bd00e72531b71c5abffb3c8ca8')

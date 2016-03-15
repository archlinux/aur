# Maintainer: Carsten Feuls <archlinux at carstenfeuls dot de>
# Submitter: Mike WB2FKO <mph at sportscliche dot com>
# Contributor: minorsecond <minorsecond at gmail dot com>
pkgname=wspr-svn
pkgver=2460
pkgrel=5
pkgdesc="Weak Signal Propagation Reporter"
arch=('x86_64' 'i686' 'armv5h' 'armv6h' 'armv7h')
url="http://physics.princeton.edu/pulsar/K1JT/wspr.html"
license=('GPL')
depends=('python2' 'python2-pillow' 'python2-numpy' 'libsamplerate' 'portaudio' 'fftw' 'gcc-fortran')
makedepends=('subversion')
source=(padevsub.c.patch
	wspr.py.patch
        $pkgname.png
        $pkgname.desktop)
sha512sums=('6e774feb45b327a10da759e476960344314e894d1aa0e9c7d1b11fda092d82b4c629e04ef58b46a273f184c60a526c434160004f77fbe9f38304d1099f327451'
            '927622b5423d109812ae25ef3c43d1ce1ea5eea224f9a66f59acda1e559077276cf88181c53771d23f4dea4c5efbd5e3b6a43deef7dc5d007712335f07fb9718'
            '9fb794b5cd645e816ea72e9e12d5cbe8e95d3782ff290d92c40266a7ac17d212c9465e84b32f2bab23d3e45456d0f1456ff39ebf869eb544a4cc88c85cf64102'
            '71a813e21d5299a7efec3081cfc08dcb024dc72542eaba7a5ced52323ebbdfe1b09bbdfd2a270f85067d49c8d7091e8c0ff94c28a2f0f74ed8ec0a6b38f1b396')

_svntrunk="svn://svn.code.sf.net/p/wsjt/wsjt/branches/wspr"
_svnmod="wspr"

build() {
# Set the build environment to python2
  export PYTHON="/usr/bin/python2"
  export F2PY="/usr/bin/python2 f2py.py"
  unset LDFLAGS
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

# Make problems can sometimes be fixed by replacing g95 with gfortran
  ./configure --prefix=/usr --enable-gcc-fortran
  patch -p0 < ${srcdir}/padevsub.c.patch
  make

}

package() {
  cd "$srcdir/$_svnmod-build"
  rm -rf build/
  patch -p0 < ${srcdir}/wspr.py.patch
  python2 setup.py install --root=$pkgdir/ 
  sed -i 's:python -O wspr.py:python2 -O /usr/bin/wspr.py:' wspr
  install -Dm755 wspr $pkgdir/usr/bin/wspr

# Install a menu item with icon
  cd $srcdir
  mkdir -p $pkgdir/usr/share/pixmaps
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644  $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
  cp -ra $srcdir/$_svnmod-build/*.TXT $pkgdir/usr/share/doc/$pkgname/
  cd "${pkgdir}/usr/bin"
}


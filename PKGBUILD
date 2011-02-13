# Maintainer: Marti Raudsepp <marti@juffo.org>

pkgname=seekwatcher-hg
pkgver=104
pkgrel=1
pkgdesc="Generates graphs from blktrace runs to help visualize IO patterns and performance"
arch=(i686 x86_64)
url="http://oss.oracle.com/~mason/seekwatcher/"
license=('GPL')
makedepends=('mercurial' 'python2')
depends=('python2-matplotlib' 'python2-numpy')
optdepends=('blktrace: for tracing the local system'
            'pyqt3: enable interactive mode')
conflicts=('seekwatcher')
md5sums=()

_hgroot="http://oss.oracle.com/mercurial/mason/"
_hgrepo="seekwatcher"

build() {
  cd $srcdir

  if [ -d $_hgrepo/.hg ]; then
    (cd $_hgrepo && hg up -r $pkgver)
  else
    hg clone -r $pkgver $_hgroot/$_hgrepo $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"

  if [ -d $_hgrepo-build ]; then
    msg "Removing old build directory"
    rm -rf $_hgrepo-build
  fi

  msg "Copying repository to another build directory"
  cp -r $srcdir/$_hgrepo $srcdir/$_hgrepo-build

  msg "Starting build"
  cd $srcdir/$_hgrepo-build

  msg "Running setup.py"
  python2 setup.py build || return 1
  python2 setup.py install --root=$pkgdir || return 1

  msg "Installing documentation"
  install -dm 755 $pkgdir/usr/share/doc/$pkgname
  cp -r $srcdir/$_hgrepo-build/README.html $pkgdir/usr/share/doc/$pkgname
}


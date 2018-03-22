# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=makehuman
pkgver=1.1.1
pkgrel=2
pkgdesc="Parametrical modeling program for creating human bodies"
arch=('any')
url="http://www.makehuman.org/"
depends=('python2-numpy' 'python2-pyqt4' 'python2-opengl')
makedepends=('mercurial')
license=('AGPL3')
source=("hg+https://bitbucket.org/MakeHuman/makehuman#tag=$pkgver"
        "fix_1184.diff::https://bitbucket.org/MakeHuman/makehuman/commits/deca8874422de7487384393cd71e914910ca658e/raw"
        "makehuman.desktop" "makehuman.sh")
md5sums=('SKIP'
         '1ca34e5592761312eb6dec4eb1f9b589'
         'f54fdfbc6c783effc4624808d2547563'
         '534db191b7c6cd5cf976c9a7089b524c')

prepare() {
  cd "$srcdir/makehuman"

  # make sure that we are using python2
  find . -type f -name "*.py" -exec sed -i 's/^#!.*python$/&2/' '{}' ';'
  sed -i 's|python"|python2"|' buildscripts/build_prepare.py

  rm -rf "$srcdir/build"
}

build() {
  cd "$srcdir/makehuman/buildscripts"
  python2 build_prepare.py "$srcdir/makehuman" "$srcdir/build"

  cd "$srcdir/build"
  # make sure that we are using python2 once again, because the build_prepare.py may have donwloaded some new files
  find . -type f -name "*.py" -exec sed -i 's/^#!.*python$/&2/' '{}' ';'
  # fix upstream bug #1184 (Export not working with numpy 1.13), this must be done after build_prepare.py (see above)
  patch -Np1 < "$srcdir/fix_1184.diff"

  cd "$srcdir/build/makehuman"
  # compile all modules so that they can be tracked by pacman
  python2 -m compileall .
  # and also optimize them
  python2 -OO -m compileall .
}

package() {
  install -d -m755 "$pkgdir/opt/"
  cp -a "$srcdir/build/makehuman" "$pkgdir/opt/"

  install -D -m644 "$srcdir/build/makehuman/icons/makehuman.png" "$pkgdir/usr/share/pixmaps/makehuman.png"
  install -D -m755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -D -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

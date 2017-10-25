# Contributor: Sascha Biermmanns <saschakb at gmail dot com>
# Contributor: Jens Staal <staal1978@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=heirloom-pkgtools-cvs
pkgver=111210
pkgrel=5
arch=('i686' 'x86_64')
pkgdesc="The Heirloom Packaging Tools is a port of SVR4 application packaging utilities from OpenSolaris."
url="http://heirloom.sourceforge.net/pkgtools.html"
license=('custom:CALDERA' 'custom:OPENSOLARIS')
depends=('heirloom-sh-cvs' 'heirloom-devtools-cvs' 'heirloom-cvs')
makedepends=('cvs')
source=('000-config.diff')
md5sums=('7ab977ec2bafe3b55fa9c56fe541e0d5')
sha1sums=('2306f0f890c6cfcfba21a8ad0cc9d81872a1eb2d')
sha256sums=('c5dedd3c85b1d4cdee9d2c21a15b2bc042349da446e88c1a056881ce349674b7')

_hmake() {
  env PATH="/usr/heirloom/bin:$PATH" MAKEFLAGS="" make "$@"
}

prepare() {
  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom login
  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom co -P heirloom-pkgtools
  rm -rf $srcdir/build
  cp -r $srcdir/heirloom-pkgtools $srcdir/build
  cd $srcdir/build
  patch -p1 < ../000-config.diff
  sed -i '/^CFLAGS=/ s,$, -I/usr/include/openssl-1.0,' mk.config
  sed -i '/^LDFLAGS=/ s,$, -L/usr/lib/openssl-1.0,' mk.config
}

build() {
  cd "$srcdir/build"
  make
}

package() {
  cd $srcdir/build
  make install ROOT=$pkgdir
  cd "$srcdir/heirloom-pkgtools/LICENSE/"
  install -Dm0644 CALDERA.LICENSE $pkgdir/usr/share/licenses/${pkgname}/CALDERA.LICENSE
  install -m0644 OPENSOLARIS.LICENSE $pkgdir/usr/share/licenses/${pkgname}
}


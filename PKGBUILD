# $Id: PKGBUILD 169539 2016-04-05 15:49:19Z spupykin $
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sean Gillespie <Sean.D.Gillespie@gmail.com>

pkgname=classpath-notools
_pkgname=classpath
pkgver=0.99
pkgrel=2
pkgdesc="A free replacement for Sun's proprietary core Java class libraries."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/classpath/"
license=('GPL')
depends=('gtk2>=2.8' 'libxtst' 'libsm' 'freetype2' 'alsa-lib')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!emptydirs')
makedepends=('gtk2>=2.8' 'libxtst' 'gconf' 'java-environment' 'antlr2')
optdepends=('file' 'gconf')
source=(ftp://ftp.gnu.org/gnu/classpath/$_pkgname-$pkgver.tar.gz
	freetype2_include.patch)
md5sums=('0ae1571249172acd82488724a3b8acb4'
         '55dafc301c5f2e497696d01e9c1dab9c')

prepare() {
  cd $_pkgname-$pkgver

  patch -p0 Makefile.in <<EOF
298,299c298,299
< SUBDIRS = lib doc external include native resource scripts \$(TOOLSDIR) \$(EXAMPLESDIR)
< DIST_SUBDIRS = lib doc external include native resource scripts tools examples
---
> SUBDIRS = lib doc external include native resource scripts
> DIST_SUBDIRS = lib doc external include native resource scripts
EOF

  # fix freetype2 include path 
  patch -Np1 -i ../freetype2_include.patch
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --disable-Werror --disable-plugin \
    --with-antlr-jar=/usr/share/java/antlr2.jar
  make EXAMPLESDIR=
}

package() {
  cd $_pkgname-$pkgver
  make EXAMPLESDIR= DESTDIR="$pkgdir" install

  rm -fr "$pkgdir"/usr/bin/
  rm -f  "$pkgdir"/usr/lib/logging.properties
  rm -f  "$pkgdir"/usr/lib/security/classpath.security
  rm -fr "$pkgdir"/usr/share/man/
  rm -f  "$pkgdir"/usr/share/info/dir
}

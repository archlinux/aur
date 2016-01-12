# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=coot
pkgver=0.8.2
pkgrel=2
pkgdesc="Crystallographic Object-Oriented Toolkit for model building, completion and validation"
arch=('i686' 'x86_64')
url="http://lmb.bioch.ox.ac.uk/coot/"
license=('GPL')
depends=('guile1.8' 'guile1.8-lib' 'guile1.8-gtk' 'guile1.8-gui' 'gtkglext' 'libccp4' 'clipper' 'goocanvas1' 'gsl' 'libgnomecanvas' 'imlib' 'swig'
         'freeglut' 'libgl' 'gtk2' 'cairo' 'libssm>=1.4' 'zlib' 'curl' 'python2' 'pygtk' 'gtkglarea' 'which' 'bc' 'sqlite')
source=(http://www2.mrc-lmb.cam.ac.uk/personal/pemsley/coot/source/releases/$pkgname-$pkgver.tar.gz
        coot-0.8.2-desktop.patch
        coot-0.8.2-libguile.patch
        coot-0.8.2-libtool.patch
        coot-0.8.2-sandbox-icons.patch
        coot-0.8.2-python.patch
        coot-0.8.2-guile.patch)
#	coot-configure.in.patch
#	coot-user-manual.texi.patch
#	coot-makefile.patch
#        coot-guile.patch
#        coot-python.patch
#        coot-icons.patch
#        coot-lidia.patch)
sha256sums=('2f5961ded7f2cf06b887560afe964c239aba94f9c4bf8a2a80b3ca4fbc471eee'
            '6558c17da028f47bec3480afbf85d8457e4c34bb50a6285bf0522de922a6bc89'
            'aa1e18d4ef43fb61e85aba05d13797f9aa2beb1da220405f1eb6058ac36eb60b'
            'e4ba02ad24330e3df3f32772275db47caeb4f36d77d57de882f7a73d7e11e5bf'
            'b93756a9ab1244573ac24427954c53ac9f14a82e7ec1f115b178897abcab42a8'
            'f4747e1fc7a3387f42b6c40358f999404761a0282ee6be3c621091d9d5d88099'
            'c15e844536f512c2d5524391dbc046a889a0d5f8c23336b854508e453e226911')

build() {

  cd "$srcdir/$pkgname-$pkgver"
  
  patch -Np1 -i "$srcdir/coot-0.8.2-desktop.patch"
  patch -Np1 -i "$srcdir/coot-0.8.2-libguile.patch"
  patch -Np1 -i "$srcdir/coot-0.8.2-libtool.patch"
  patch -Np1 -i "$srcdir/coot-0.8.2-sandbox-icons.patch"
  patch -Np0 -i "$srcdir/coot-0.8.2-python.patch"
  patch -Np0 -i "$srcdir/coot-0.8.2-guile.patch"
  
  iconv -f iso8859-1 -t utf-8 README > README.conv && mv -f README.conv README
  
  aclocal -I macros
  libtoolize --automake --copy
  autoconf
  automake --copy --add-missing --gnu
  
  # Work around coot's code not beeing completely standart compliant
  CXXFLAGS="${CXXFLAGS} -fpermissive"
  
  ./configure --prefix=/usr \
              --without-guile \
              --with-python \
              --with-guile \
              --with-guile-gtk \
              --with-pygtk \
              --with-sqlite3 \
              --with-boost \
              --with-boost-python \
              --disable-static

  make

#  patch -Np0 -i "$srcdir/coot-configure.in.patch"

# patch -Np0 -i "$srcdir/coot-user-manual.texi.patch"
# patch -Np0 -i "$srcdir/coot-guile.patch"
# patch -Np0 -i "$srcdir/coot-python.patch"
# patch -Np0 -i "$srcdir/coot-icons.patch"
# patch -Np0 -i "$srcdir/coot-lidia.patch"

#  iconv -f iso8859-1 -t utf-8 README > README.conv && mv -f README.conv README
#  
#  aclocal -I macros
#  libtoolize --automake --copy
#  autoconf
#  automake --copy --add-missing --gnu
#  
#  CXXFLAGS="${CXXFLAGS} -fpermissive"
#  CFLAGS="${CFLAGS} -fpermissive"
#
#  ./configure --prefix=/usr \
#              --includedir=/usr/include/coot \
#              --with-guile \
#              --with-python \
#              --with-pygtk \
#              --disable-static
#  
#  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
} 

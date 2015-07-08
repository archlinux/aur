# $Id: PKGBUILD 82 2009-07-17 19:56:55Z aaron $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Kritoke <kritoke@nospam.gmail.com>
# Contributor: Kritoke <kritoke@nospam.gmail.com>
 
pkgname=audacious-imms-svn
pkgver=r301
pkgrel=1
pkgdesc="An intelligent playlist plug-in for XMMS that tracks your listening patterns and dynamically adapts to your taste."
arch=(i686 x86_64)
license=("GPL")
url="http://imms.luminal.org/"
depends=('audacious' 'pcre' 'sqlite3' 'taglib' 'glib2' 'sox' 'torch')
replaces=('imms')
conflicts=('audacious-imms')
source=(audacious-3.x.patch
        svn+http://imms.googlecode.com/svn/trunk/imms)
md5sums=('df045c1fb7ff96c5305ad35a3dfb28bd'
         SKIP)

_svnmod=imms

pkgver() {
   cd "$srcdir/$_svnmod"
   local ver="$(svnversion)"
   printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
   cd $srcdir/$_svnmod
   msg "Patching sources"
   patch -p1 < "${srcdir}/audacious-3.x.patch"
}

build() {
   cd $srcdir/$_svnmod

   autoheader
   aclocal
   autoconf
   ./configure --prefix=/usr --disable-immsremote

   make
}

package() {
   cd $srcdir/$_svnmod
   mkdir -p "$pkgdir/usr/bin"
   make prefix="$pkgdir/usr" DESTDIR="$pkgdir/usr/lib/xmms/General" \
        BMPDESTDIR="$pkgdir/usr/lib/bmp/General" \
        AUDACIOUSDESTDIR="$pkgdir/usr/lib/audacious/General" install
}

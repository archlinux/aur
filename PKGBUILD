# Maintainer: Jerome M. Berger <jeberger@free.fr>
 
pkgname=audacious-imms-git
pkgver=r249.4a395da
pkgrel=1
pkgdesc="An intelligent playlist plug-in for XMMS that tracks your listening patterns and dynamically adapts to your taste."
arch=(i686 x86_64)
license=("GPL")
url="https://sites.google.com/a/luminal.org/imms/"
depends=('audacious' 'pcre' 'sqlite3' 'taglib' 'glib2' 'sox' 'torch')
replaces=('imms')
conflicts=('audacious-imms')
source=(git+https://github.com/jlindgren90/imms.git)
md5sums=(SKIP)

pkgver() {
  cd "${srcdir}/imms"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
   cd $srcdir/imms/imms

   autoheader
   aclocal
   autoconf
   ./configure --prefix=/usr --disable-immsremote

   make
}

package() {
   cd $srcdir/imms/imms
   mkdir -p "$pkgdir/usr/bin"
   make prefix="$pkgdir/usr" DESTDIR="$pkgdir/usr/lib/xmms" \
        BMPDESTDIR="$pkgdir/usr/lib/bmp" \
        AUDACIOUSDESTDIR="$pkgdir/usr/lib/audacious" install
}

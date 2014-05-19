# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmfrog
pkgdesc="A WindowMaker dock app for weather reports."
pkgver=0.3.1
pkgrel=1
arch=(i686 x86_64)
url="http://sourceforge.net/projects/wmfrog"
license=('GPL')
depends=('libxpm')
source=("http://http.us.debian.org/debian/pool/main/w/wmfrog/wmfrog_0.3.1.orig.tar.gz"
	"http://http.us.debian.org/debian/pool/main/w/wmfrog/wmfrog_0.3.1-1.debian.tar.xz")
md5sums=('de4975f2c6a7931fdf5faa3c263aaf5f'
         '94123f2791d8fc144502540d4273b8cf')

prepare() {
  cd "${srcdir}"
  patch -Np1 -b -z .orig -i debian/patches/20-weather.pl.patch
  patch -Np1 -b -z .orig -i debian/patches/weather.pl-new-line-skip.patch
  patch -Np1 -b -z .orig -i debian/patches/renamed-wmfrog.c.patch
  patch -Np1 -b -z .orig -i debian/patches/new-station-lookup-url.patch
}

build() {
  cd "${srcdir}/Src"
  make CFLAGS="$CFLAGS $CPPFLAGS $LDFLAGS"
  pod2man --utf8 \
	  --center="User Commands" \
	  --date="`date '+%Y-%m-%d'`" \
	  --errors="none" \
	  --fixed="CW" \
	  --fixedbold="CB" \
	  --fixeditalic="CI" \
	  --fixedbolditalic="CX" \
	  --name="WMFROG" \
	  --nourls \
	  --release="$pkgname $pkgver" \
	  --section="1" \
	  ../debian/wmfrog.1.pod >wmfrog.1
}

package() {
  cd "${srcdir}/Src"
  make DESTDIR="${pkgdir}" install
  install -Dm0644 wmfrog.1 "${pkgdir}/usr/share/man/man1/wmfrog.1"
}

# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmfrog
pkgdesc="A WindowMaker dock app for weather reports."
pkgver=0.3.1
pkgrel=2
arch=(i686 x86_64)
url="http://sourceforge.net/projects/wmfrog"
license=('GPL')
depends=('libxpm')
source=("http://downloads.sourceforge.net/wmfrog/wmfrog-0.3.1.tgz"
	"debian-orig.patch"
	"20-weather.pl.patch"
	"weather.pl-new-line-skip.patch"
	"renamed-wmfrog.c.patch"
	"new-station-lookup-url.patch"
	"wmfrog.1.pod")
md5sums=('3469ae5043a7bec538dff31b4a2397ea'
         '7b2fece308e94c6ba2281fae83ece24b'
         '95cb86928984baa7dfe5b5a8870efa09'
         'f8872dc232a91aeaa465f9139068842c'
         '86e8eeb4b5508c30eab08e9f51964e53'
         '26315cb650d3f26fcd27dcac323f10b2'
         'f16d84c6bc8ea9f432c5055d6354a9f8')

prepare() {
  cd "${srcdir}"
  patch -Np1 -b -z .orig -i debian-orig.patch
  patch -Np1 -b -z .orig -i 20-weather.pl.patch
  patch -Np1 -b -z .orig -i weather.pl-new-line-skip.patch
  patch -Np1 -b -z .orig -i renamed-wmfrog.c.patch
  patch -Np1 -b -z .orig -i new-station-lookup-url.patch
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
	  ../wmfrog.1.pod >wmfrog.1
}

package() {
  cd "${srcdir}/Src"
  make DESTDIR="${pkgdir}" install
  install -Dm0644 wmfrog.1 "${pkgdir}/usr/share/man/man1/wmfrog.1"
}

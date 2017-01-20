# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=mpgedit
pkgver=0.75dev2
pkgrel=1
pkgdesc="MPEG1 layer 1/2/3 (mp3), MPEG 2 and MPEG 2.5 audio file editor able to split file without quality degradation"
arch=('i686' 'x86_64')
url="http://mpgedit.org/mpgedit/home.html"
license=('GPL')
depends=('libmad' 'alsa-lib')
source=(http://mpgedit.org/mpgedit/download/0_75/mpgedit_0-75dev2_src.tgz
        makefile.patch
	xmpgedit.desktop)
md5sums=('324f4f514931949226d80f484f223c2d'
         '447a8a99931d4ebe2f71b39c9ef8fd8d'
         '3757d10a89fdef32f8d4fcdd24b59df5')

prepare() {
  cd "$srcdir/mpgedit_${pkgver/./-}_src/mpgedit"
  patch -p2 <"${srcdir}/makefile.patch"
}

build() {
  cd "$srcdir/mpgedit_${pkgver/./-}_src/mpgedit"
  ./make_alsa.sh
  ./unix_make.sh
}

package ()
{
  cd "$srcdir/mpgedit_${pkgver/./-}_src/mpgedit"
  for lib in libdecoder_mpg123.so libdecoder_mad.so libdecoder_popen.so libmpglib_mpgedit.so
  do
	  install -Dm644 ${lib} ${pkgdir}/usr/lib/${lib}
  done

  for bin in mpgedit mpgedit_nocurses mp3decoder.sh gui/xmpgedit
  do
	  install -Dm755 ${bin} ${pkgdir}/usr/bin/`basename ${bin}`
  done

  pushd gui
  for pixmap in *.xpm
  do
	install -Dm644 $pixmap ${pkgdir}/usr/share/pixmaps/xmpgedit/${pixmap}
  done

  popd
  install -Dm644 mpgedit.1 ${pkgdir}/usr/share/man/man1/mpgedit.1
  install -Dm644 xmpgedit.1 ${pkgdir}/usr/share/man/man1/xmpgedit.1
  ln -s /usr/lib/libdecoder_mpg123.so ${pkgdir}/usr/lib/libmpgedit_decoder.so

  install -Dm644 $srcdir/xmpgedit.desktop $pkgdir/usr/share/applications/xmpgedit.desktop
}

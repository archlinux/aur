# $Id: PKGBUILD 272092 2017-12-04 08:14:08Z arojas $
# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Corrado 'bardo' Primier <corrado.primier@mail.polimi.it>
# Contributor: Tate "Tatey" Johnson <tatey86@tpg.com.au>

pkgname=rss-glx
pkgver=0.9.1
pkgrel=33
pkgdesc="The Really Slick Screensavers port to GLX"
arch=('x86_64')
url="http://rss-glx.sourceforge.net/"
license=('GPL')
depends=('freealut' 'glew' 'libmagick6' 'glu')
optdepends=('xscreensaver: xscreensaver integration')
install=rss-glx.install
source=(git://github.com/sirspudd/rss-glx.git
        rss-glx-desktops.tar.bz2)
md5sums=('SKIP'
         '4211215c9a4918b0dff30a7000647dd9')

build() {
  cd ${pkgname}

  [ "$CARCH" = "x86_64" ] && (sed -i -e 's|@LIBS@|@LIBS@ -fopenmp|g' src/Makefile.in)

  PKG_CONFIG_PATH="/usr/lib/imagemagick6/pkgconfig" \
  ./configure --prefix=/usr \
    --mandir=/usr/share/man \
    --program-transform-name='s/plasma/plasma_rss/' \
    --with-configdir=/usr/share/xscreensaver/config \
    --with-kdessconfigdir=/usr/share/applnk/System/ScreenSavers \
    --enable-shared=yes --enable-static=no
  make CFLAGS="$CFLAGS -I/usr/include/ImageMagick"
}

package() {
  cd ${pkgname}

  make DESTDIR="${pkgdir}" install

  # FS#18300
  install -d "${pkgdir}/usr/lib/xscreensaver/"
  list=$(ls "${pkgdir}/usr/bin" --ignore rss-glx_install.pl)
  for i in $list; do
    ln -s "/usr/bin/$i" "$pkgdir/usr/lib/xscreensaver/"
  done

  install -d "${pkgdir}/usr/share/applications/screensavers"
  install -m644 "${srcdir}"/${pkgname}-desktops/*.desktop "${pkgdir}/usr/share/applications/screensavers"
}

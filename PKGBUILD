# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: juergen <juergen@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

pkgname=xemacs
pkgver=21.5.34
pkgrel=1
pkgdesc="An highly customizable open source text editor and application development system forked from GNU Emacs"
arch=('i686' 'x86_64')
url="http://xemacs.sourceforge.net/"
license=('GPL')
depends=('libpng' 'libtiff' 'gpm' 'desktop-file-utils' 'libxaw' 'gdbm' 'giflib' 'libxft')
optdepends=('xorg-fonts-75dpi: X bitmap fonts needed for the interface'
            'xorg-fonts-100dpi: X bitmap fonts needed for the interface')
makedepends=('xbitmaps' 'patch')
source=(http://ftp.isr.tecnico.ulisboa.pt/pub/$pkgname/$pkgname/$pkgname-21.5/$pkgname-$pkgver.tar.gz{,.asc}
#   http://ftp.xemacs.org/pub/xemacs/beta/${pkgname}-${pkgver}.tar.gz   # https://en.wikipedia.org/wiki/XEmacs#XEmacs_and_GNU_Emacs
        xemacs.desktop
        xemacs-c11.patch)
validpgpkeys=('AF15C7D0FFBB93E5A68DF449E0DDF50FFE38BD43') # Stephen J. Turnbull
sha256sums=('33cc54a6a9a45224a64b6c57c8138b5a5f0f1be368951a6d9ec8c0aec5993ee5'
            'SKIP'
            '1ab2f24fa11b45512ccad2b2ce650dc27083e8ed3f3c9ed316f1c3452c91544d'
            'ea948edf003a2fb5a8f922fea20474e1ca79cd6168fc217d07b780e4a331fe85')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np0 -i ../xemacs-c11.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --build="${CHOST}" --prefix=/usr --with-dynamic \
      --without-postgresql --with-athena=xaw \
      --with-database=gdbm --without-ldap \
      --enable-menubars=lucid --enable-scrollbars=lucid \
      --enable-widgets=athena --enable-dialogs=athena \
      --enable-external-widget \
      --with-jpeg --with-png --with-tiff \
      --with-ncurses --with-pop --disable-sound \
      --infodir=/usr/share/info \
      --with-mule \
      --mandir=/usr/share/man/man1 \
      --with-xft=emacs,tabs,menubars,gauges
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -j1 prefix="${pkgdir}/usr" mandir="${pkgdir}/usr/share/man/man1" infodir="${pkgdir}/usr/share/info" install gzip-el

  rm "${pkgdir}"/usr/bin/{b2m,ctags,etags}
  rm "${pkgdir}"/usr/share/man/man1/{ctags.1,etags.1}

  # fix  FS#7927
  install -d -m755 "${pkgdir}/usr/share/pixmaps"
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  ln -sf /usr/share/xemacs-${pkgver%.*}-b${pkgver##*.}/etc/xemacs-icon.xpm "${pkgdir}/usr/share/pixmaps/xemacs-icon.xpm"

  # correct permissions
  chown -R root:root "${pkgdir}"

  rm "${pkgdir}"/usr/share/info/{info.info,texinfo.info-2,texinfo.info-3,cl.info,texinfo.info-1,texinfo.info,standards.info,widget.info}
}

# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Martin C. Doege <mdoege at compuserve dot com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Firmicus <firmicus@gmx.net>

pkgname=sunclock
pkgver=3.57
pkgrel=1
pkgdesc="An astronomical world map that shows day and night and the Sun and Moon positions"
arch=('i686' 'x86_64')
url="https://www.spinnaker.de/debian/sunclock.html"
license=('GPL')
depends=('libjpeg-turbo' 'libpng' 'libxpm')
makedepends=('imake' 'tar' 'gendesk')
source=("https://www.spinnaker.de/debian/sunclock_${pkgver}.orig.tar.gz"
        "disable_zlib.patch")
md5sums=('827a41c3f87e9ac65adeaa1ebd0f2c33'
         'SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Apply a Debian patch to disable zlib
  patch -N ${srcdir}/${pkgname}-${pkgver}/Imakefile ${srcdir}/disable_zlib.patch
  # Fix path to 'emx' binary
  sed -i "s_/share/sunclock/bin_/bin_" Imakefile
  xmkmf
  make
  gendesk -f -n --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" \
   --exec="${pkgname}" --categories=Education\;Science\;Astronomy --icon "${pkgname}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Install program files
  make DESTDIR="${pkgdir}" \
       BINDIR=/usr/bin \
       EMXBINDIR=/usr/bin \
       SHAREDIR=/usr/share/${pkgname} \
       MANDIR=/usr/share/man/man1 install
  # Install data files
  install -Dm644 README "$pkgdir/usr/share/doc/sunclock/README"
  # Install a desktop entry
  install -Dm644 wm_icons/sunclock2.xpm "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=glimpse-editor
pkgver=0.2.0
pkgrel=1
pkgdesc="Fork of the GNU Image Manipulation Program"
arch=(i686 x86_64)
url="https://glimpse-editor.org/"
license=(GPL3 LGPL)
depends=(gegl libmypaint gtk2 openexr
         poppler-glib poppler-data mypaint-brushes1
         )
makedepends=(intltool libxslt gtk-doc libxslt
             ghostscript libxpm libheif libwebp libmng libwmf iso-codes aalib
             appstream-glib xdg-utils xorg-server-xvfb
             )
optdepends=('gutenprint: for sophisticated printing only as glimpse has built-in cups print support'
            'alsa-lib: for MIDI event controller module'
            'ghostscript: for postscript support'
            'libxpm: XPM support'
            'libheif: HEIF support'
            'libwebp: WebP support'
            'libmng: MNG support'
            'iso-codes: Language support'
            'xdg-utils: email plugin'
            'aalib: ASCII art support'
            )
provides=(glimpse-editor gimp)
conflicts=(glimpse-editor gimp)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/glimpse-editor/Glimpse/archive/v${pkgver}.tar.gz")
sha512sums=('0511a42cf315dbd60a01de8f2101755179020f9b1ecc4812c85c890f60515685e08d02d97ffb48ccdc5908998f1c015f76af9f214293abeeea75bf8e8aa7570d')

prepare() {
  cd "Glimpse-${pkgver}"

  _mypaintver=$(echo /usr/lib/libmypaint-*.so | grep -o -E '\-[0-9]+(\.[0-9]+)*' | head -1)
  sed -i "s|\\(libmypaint\\)\\( >= libmypaint_required_version\\)|\\1${_mypaintver}\\2|g" configure.ac

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "Glimpse-${pkgver}"

  ./configure \
  	--prefix=/usr \
  	--sysconfdir=/etc \
  	--libexecdir=/usr/bin \
  	--enable-mp \
  	--enable-gimp-console \
    --disable-check-update \
  	--enable-gtk-doc \
    --disable-python \
	--without-webkit \
	--with-xmc \
    --with-bug-report-url=https://aur.archlinux.org/packages/glimpse-editor-git/ \
  	--with-openexr

  make
}

package() {
  cd "Glimpse-${pkgver}"

  make DESTDIR="${pkgdir}" install
  ln -s gimptool-2.0 "${pkgdir}"/usr/bin/gimptool

  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}"/COPYING
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}


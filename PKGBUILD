# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=glimpse-editor-git
pkgver=0.1.0.r0.gb6b4dd0194
pkgrel=1
pkgdesc="Fork of the GNU Image Manipulation Program"
arch=(i686 x86_64)
url="https://glimpse-editor.org/"
license=(GPL3 LGPL)
depends=(gegl libmypaint gtk2 pygtk openexr
         poppler-glib poppler-data mypaint-brushes1
         )
makedepends=(git intltool libxslt gtk-doc libxslt
             ghostscript libxpm libheif libwebp libmng libwmf iso-codes aalib
             appstream-glib xdg-utils
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
source=("git+https://github.com/glimpse-editor/Glimpse#branch=glimpse-0-1")
sha512sums=('SKIP')

pkgver() {
  cd Glimpse
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd Glimpse

  _mypaintver=$(echo /usr/lib/libmypaint-*.so | grep -o -E '\-[0-9]+(\.[0-9]+)*' | head -1)
  sed -i "s|\\(libmypaint\\)\\( >= libmypaint_required_version\\)|\\1${_mypaintver}\\2|g" configure.ac

  ./autogen.sh
}

build() {
  cd Glimpse

  ./configure \
  	--prefix=/usr \
  	--sysconfdir=/etc \
  	--libexecdir=/usr/bin \
  	--enable-mp \
  	--enable-gimp-console \
  	--enable-python \
  	--enable-gtk-doc \
    --with-bug-report-url=https://aur.archlinux.org/packages/glimpse-editor-git/ \
  	--with-openexr

  make
}

package() {
  cd Glimpse

  make DESTDIR="$pkgdir" install
  ln -s gimptool-2.0 "$pkgdir"/usr/bin/gimptool

  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}"/COPYING
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}


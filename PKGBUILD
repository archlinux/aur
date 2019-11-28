# Maintainer: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
# Thanks: Jared Casper <jaredcasper@gmail.com>
# Thanks: Kyle Keen <keenerd@gmail.com>
# Thanks: Markus Koch <CClassicVideos@aol.com>
# Thanks: Thomas Dziedzic < gostrc at gmail >

pkgname=gtkwave-gtk3-tcl
pkgver=3.3.103
pkgrel=1
pkgdesc='A wave viewer which reads LXT, LXT2, VZT, GHW, FST and VCD/EVCD files (GTK+ 3 version, with Tcl/Tk support)'
arch=('x86_64')
url='http://gtkwave.sourceforge.net'
license=('GPL' 'custom:MIT' 'custom')
depends=(
  'bzip2'
  'dconf' # gsettings
  'desktop-file-utils'
  # 'gcc' # -lgnu-intl
  # 'gconf'
  # 'gcr' # -lgck
  # 'gimp'
  'glib2' # -lgobject -lgthread gsettings
  'gnutls' # 
  'gtk3'
  'judy' # --enable-judy
  'libjpeg-turbo' # -ljpeg
  'libpng' # -lpng
  'libtiff' # -ltiff
  'tcl'
  'tk'
  'xz' # liblzma
)
makedepends=('gperf')
provides=('gtkwave')
conflicts=('gtkwave')
install='gtkwave.install'
source=("http://gtkwave.sourceforge.net/${pkgname%-tcl}-${pkgver}.tar.gz"
        "http://gtkwave.sourceforge.net/${pkgname%%-*}.pdf"
        "gtkwave.install")

md5sums=('6134d39af77077c15f43c97e55b6f94e'
         'SKIP'
         'ccbede6bf65569f5688f5254389eec53')

build() {
  cd "$srcdir/${pkgname%-tcl}-${pkgver}"

  ./configure \
    --prefix=/usr \
    \
    --disable-mime-update \
    --enable-struct-pack \
    --enable-manymarkers \
    --disable-dependency-tracking \
    --enable-xz \
    --enable-fasttree \
    --enable-judy \
    --enable-schemas-compile \
    --enable-largefile \
    --enable-tcl \
    --enable-tk \
    --enable-gtk3 \
    \
    --with-gsettings \
    --with-tcl=/usr/lib \
    --with-tk=/usr/lib \

    # --with-tcl=/usr/lib/tclConfig.sh  \
    # --with-tk=/usr/lib/tkConfig.sh \

    # --with-gconf \
    # --with-tcl=/usr/lib/tcl8.6  \
    # --with-tk=/usr/lib/tk8.6 \
    # --with-xdgdatadir=path \

  make CFLAGS="-D_LARGEFILE64_SOURCE -O"
}

package() {
  cd "$srcdir/${pkgname%-tcl}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install-strip
  
  mkdir -p "$pkgdir/usr/share/licenses/gtkwave"
  install -D -m644 LICENSE.TXT \
    "$pkgdir/usr/share/licenses/gtkwave/LICENSE.TXT"

  mkdir -p "$pkgdir/usr/share/doc/gtkwave"
  install -D -m644 "$srcdir/gtkwave.pdf" \
    "$pkgdir/usr/share/doc/gtkwave/gtkwave.pdf"
}

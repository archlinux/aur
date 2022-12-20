# Maintainer: Darren Ng <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
# Thanks: Jared Casper <jaredcasper@gmail.com>
# Thanks: Kyle Keen <keenerd@gmail.com>
# Thanks: Markus Koch <CClassicVideos@aol.com>
# Thanks: Thomas Dziedzic < gostrc at gmail >

_pkgname=gtkwave
pkgname=gtkwave-tcl
pkgver=3.3.113
pkgrel=1
pkgdesc='A wave viewer which reads LXT, LXT2, VZT, GHW, FST and VCD/EVCD files (with Tcl/Tk support)'
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
  'gtk2'
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
source=("https://sourceforge.net/projects/gtkwave/files/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        "http://gtkwave.sourceforge.net/${_pkgname}.pdf"
        "gtkwave.install")

md5sums=('8feee94fe1862a8c26dbdceb28d9c4b7'
         '540323e46d4fd065dd20ced75760f6ec'
         '5c404e6a86f1c209344a5d7d2fa07753')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    \
    --disable-mime-update \
    --enable-struct-pack \
    --enable-fatlines \
    --enable-manymarkers \
    --disable-dependency-tracking \
    --disable-local-libz \
    --disable-local-libbz2 \
    --enable-xz \
    --enable-fasttree \
    --enable-judy \
    --enable-schemas-compile \
    --enable-largefile \
    --enable-tcl \
    --enable-tk \
    \
    --with-gsettings \
    --with-tcl=/usr/lib \
    --with-tk=/usr/lib \

    # --with-gconf \
    # --with-tcl=/usr/lib/tcl8.6  \
    # --with-tk=/usr/lib/tk8.6 \
    # --with-xdgdatadir=path \

  make CFLAGS="-D_LARGEFILE64_SOURCE -O"
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install-strip
  
  mkdir -p "$pkgdir/usr/share/licenses/gtkwave"
  install -D -m644 LICENSE.TXT \
    "$pkgdir/usr/share/licenses/gtkwave/LICENSE.TXT"

  mkdir -p "$pkgdir/usr/share/doc/gtkwave"
  install -D -m644 "$srcdir/gtkwave.pdf" \
    "$pkgdir/usr/share/doc/gtkwave/gtkwave.pdf"
}

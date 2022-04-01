# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=libvisual-plugins
pkgver=0.4.0
pkgrel=11
pkgdesc="plugins for libvisual"
arch=("x86_64")
license=('GPL')
url="https://sourceforge.net/projects/libvisual/"
depends=('libvisual' 'glu' 'alsa-lib' 'jack' 'gdk-pixbuf2')
makedepends=('mesa' 'gtk2')
source=(https://downloads.sourceforge.net/sourceforge/libvisual/libvisual-plugins-${pkgver}.tar.bz2
        02_64-bit_JESS_fix.patch
        03_build_against_gl_fixes.patch
        04_lv_analyzer_build_fix.patch
        05_fix_po.patch
        050_all_automagic.patch
        60_no-const-vispluginfo-in-nastyfft.patch)
sha256sums=('518eef40a8a41946a0c2c0d59ede40d53ba7c142873af71aa4d2d8f297396601'
            '49efe3991dd90c712916af06e4c1104bfc016f3004f77daaaba2be4a92eee251'
            'c9e673b36c125fda5015fcb6462a69e5ab3ff55828342c8b8483e76f84853ef8'
            '083d3e16aacaf7853de713d604a1b2a06bc5f739d9c94a7bfe5099bf27da8670'
            'be20595c8092dee1c07184a2fa4eb924decf9de752ee973d997688d192e0e346'
            'b85bc97614d75f76f8f7fa9a0f6a1292813727229e615556f426b3386af625b5'
            '4906fd72097cb33fc4b88b89384cbb00685fee3de29d321178f92e8fb9610856')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/02_64-bit_JESS_fix.patch"
  patch -Np1 -i "${srcdir}/03_build_against_gl_fixes.patch"
  patch -Np1 -i "${srcdir}/04_lv_analyzer_build_fix.patch"
  patch -Np0 -i "${srcdir}/050_all_automagic.patch"
  patch -Np1 -i "${srcdir}/60_no-const-vispluginfo-in-nastyfft.patch"

  autoreconf -fi
  # Apply later as autoreconf overwrites po/Makefile.in.in
  patch -Np1 -i "${srcdir}/05_fix_po.patch"

  ./configure --prefix=/usr \
      --disable-gstreamer-plugin \
      --disable-gforce \
      --disable-esd
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

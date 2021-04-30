# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Artem A Klevtsov <unikum.pm [at the] gmail [dot] com>

pkgbase='scangearmp'
pkgname=('scangearmp-mpseries-common'
         'scangearmp-mp250series'
         'scangearmp-mp270series'
         'scangearmp-mp490series'
         'scangearmp-mp550series'
         'scangearmp-mp560series'
         'scangearmp-mp640series')
_pkgname=scangearmp

pkgver=1.40
pkgrel=11
_pkgreview=1

pkgdesc="Canon IJ Scanner Driver for MP250, MP270, MP490, MP550, MP560, and MP640 series"
url="http://www.canon-europe.com/support/pixma_software/"

arch=('i686' 'x86_64')
license=('custom')

conflicts=('lib32-cnijfilter320')

makedepends_x86_64=('gcc-multilib' 'libtool-multilib' 'lib32-gimp' 'lib32-libusb-compat' 'libusb-compat' 'lib32-gtk2')
makedepends_i686=('gcc' 'libtool' 'gimp' 'libusb-compat' 'gtk2')

makedepends=('autoconf>=2.59' 'automake>=1.10' 'tar' 'make' 'sane')

# File size: 2178560 bytes
source=("http://files.canon-europe.com/files/soft37281/Software/Linux_Scangear_Source_Files.tar"
        "mychanges.patch")
sha512sums=('257f6ffece2e43c5db7b4d73ac962ddce9256b652e980b64dead2d38fe15d1b101a4f91c87b7fce1e0154fcb7fd6fc59962d4ca9abd4a20f765845aa938d8b8a'
            '2f065e5558aa7fc831e5e0bff7b6b140a134d61e9efcaf3ca7fe4596cdd5dc2bea860ccf043fa8045b8a5462763275575af6dce3799cd4b2bd15ec4bdf23ae3e')

prepare() {
  cd "${srcdir}"
  tar xzf "${_pkgname}-source-${pkgver}-${_pkgreview}.tar.gz"
  cd "${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}"

  patch -p1 -i ../mychanges.patch

  for libname in "libgimp-2.0.so" "libgimpmath-2.0.so" "libgimpconfig-2.0.so" "libgimpcolor-2.0.so" "libgimpbase-2.0.so"; do
    ln -fs /usr/lib32/${libname} com/libs_bin/${libname}
  done
}

build() {
  cd "${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}/scangearmp"

  export CC="gcc -m32"
  # Required for the glib2
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  ./autogen.sh --prefix=/usr --libdir=/usr/lib32
  if [ -x /usr/bin/libtool ]; then
    rm libtool
    ln -s /usr/bin/libtool
  else
    exit 1;
  fi
  make
}

package_scangearmp-mpseries-common() {
  pkgdesc="Canon IJ Scanner Driver (Common Package)"
  install=scangearmp-common.install

  conflicts=('scangearmp-common')
  provides=('scangearmp-common=1.40')

  depends_x86_64=('lib32-libusb-compat' 'libusb-compat' 'lib32-gimp')
  depends_i686=('libusb-compat' 'gimp')
  depends=('sane')

  cd ${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}/scangearmp
  
  make DESTDIR=${pkgdir} install
  mv ${pkgdir}/usr/lib ${pkgdir}/usr/lib32

  install -D -m 644 etc/80-canon_mfp.rules ${pkgdir}/etc/udev/rules.d/80-canon_mfp.rules
  
  cd ${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}
  install -m 666 com/ini/canon_mfp_net.ini ${pkgdir}/usr/lib32/bjlib
  
  for libname in "libcncpnet.so.1.1.0" "libcncpmsui.so.1.4.0" "libcncpcmcm.so.6.50.1" "libcncpmsimg.so.1.0.1" "libcncpmslld.so.1.0.0"; do
    install -s -m 755 com/libs_bin/${libname} ${pkgdir}/usr/lib32
  done
  chmod 644 ${pkgdir}/usr/lib32/libsane-canon_mfp.a

  install -d ${pkgdir}/usr/lib/bjlib
  ln -rs ${pkgdir}/usr/lib32/bjlib/* ${pkgdir}/usr/lib/bjlib/

  install -D LICENSE-scangearmp-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-scangearmp-${pkgver}EN.txt
}

scangearmp-mpverseries-packager() {
  local mpid="$1"

  cd "${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}"

  install -d ${pkgdir}/usr/lib32/bjlib
  install -d ${pkgdir}/usr/lib/bjlib
  for libname in ${mpid}/libs_bin/*.so.*; do
    install -s -m 755 ${libname} ${pkgdir}/usr/lib32
  done
  for auxname in ${mpid}/*.{tbl,DAT}; do
    install -m 644 ${auxname} ${pkgdir}/usr/lib32/bjlib
  done
  ln -rs ${pkgdir}/usr/lib32/bjlib/* ${pkgdir}/usr/lib/bjlib/

  install -D LICENSE-scangearmp-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-scangearmp-${pkgver}EN.txt
}

package_scangearmp-mp250series() {
  pkgdesc="Canon IJ Scanner Driver (For MP250 series)"
  install="scangearmp-mp250.install"
  conflicts=("scangearmp-mp250")
  provides=("scangearmp-mp250")

  depends_x86_64=('lib32-gtk2>=2.6')
  depends_i686=('gtk2>=2.6')
  depends=("${_pkgname}-common=${pkgver}")

  scangearmp-mpverseries-packager "356"
}

package_scangearmp-mp270series() {
  pkgdesc="Canon IJ Scanner Driver (For MP270 series)"
  install="scangearmp-mp270.install"
  conflicts=("scangearmp-mp270")
  provides=("scangearmp-mp270")

  depends_x86_64=('lib32-gtk2>=2.6')
  depends_i686=('gtk2>=2.6')
  depends=("${_pkgname}-common=${pkgver}")

  scangearmp-mpverseries-packager "357"
}

package_scangearmp-mp490series() {
  pkgdesc="Canon IJ Scanner Driver (For MP490 series)"
  install="scangearmp-mp490.install"
  conflicts=("scangearmp-mp490")
  provides=("scangearmp-mp490")

  depends_x86_64=('lib32-gtk2>=2.6')
  depends_i686=('gtk2>=2.6')
  depends=("${_pkgname}-common=${pkgver}")

  scangearmp-mpverseries-packager "358"
}

package_scangearmp-mp550series() {
  pkgdesc="Canon IJ Scanner Driver (For MP550 series)"
  install="scangearmp-mp550.install"
  conflicts=("scangearmp-mp550")
  provides=("scangearmp-mp550")

  depends_x86_64=('lib32-gtk2>=2.6')
  depends_i686=('gtk2>=2.6')
  depends=("${_pkgname}-common=${pkgver}")

  scangearmp-mpverseries-packager "359"
}

package_scangearmp-mp560series() {
  pkgdesc="Canon IJ Scanner Driver (For MP560 series)"
  install="scangearmp-mp560.install"
  conflicts=("scangearmp-mp560")
  provides=("scangearmp-mp560")

  depends_x86_64=('lib32-gtk2>=2.6')
  depends_i686=('gtk2>=2.6')
  depends=("${_pkgname}-common=${pkgver}")

  scangearmp-mpverseries-packager "360"
}

package_scangearmp-mp640series() {
  pkgdesc="Canon IJ Scanner Driver (For MP640 series)"
  install="scangearmp-mp640.install"
  conflicts=("scangearmp-mp640")
  provides=("scangearmp-mp640")

  depends_x86_64=('lib32-gtk2>=2.6')
  depends_i686=('gtk2>=2.6')
  depends=("${_pkgname}-common=${pkgver}")

  scangearmp-mpverseries-packager "362"
}


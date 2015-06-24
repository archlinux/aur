# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Artem A Klevtsov <unikum.pm [at the] gmail [dot] com>

pkgbase='scangearmp-mp550'
pkgname=('scangearmp-common' 'scangearmp-mp550')
_pkgname=scangearmp

pkgver=1.40
pkgrel=5
_pkgreview=1

pkgdesc="Canon Scanner Driver (For Multifunction MP550 series)"
url="http://www.canon-europe.com/Support/Consumer_Products/products/Fax__Multifunctionals/InkJet/PIXMA_MP_series/PIXMA_MP550.aspx"

arch=('i686' 'x86_64')
license=('custom')

conflicts=('lib32-cnijfilter320')

makedepends_x86_64=('gcc-multilib' 'libtool-multilib' 'lib32-gimp' 'lib32-libusb-compat')
makedepends_i686=('gcc' 'libtool' 'gimp' 'libusb-compat')

makedepends=('autoconf>=2.59' 'automake>=1.10' 'tar' 'make' 'sane')

# File size: 2178560 bytes
source=("http://files.canon-europe.com/files/soft37281/Software/Linux_Scangear_Source_Files.tar"
        "mychanges.patch")
sha512sums=('257f6ffece2e43c5db7b4d73ac962ddce9256b652e980b64dead2d38fe15d1b101a4f91c87b7fce1e0154fcb7fd6fc59962d4ca9abd4a20f765845aa938d8b8a'
            'dd5bc73edff4f8a3452058e6f635815e6697a996cf0f3bf8a6515594af22ad730333f80a4f1b8113d36549ce8a627b92eb5e36778fc72def6852d01ef5e0930b')

build() {
  cd ${srcdir}
  tar xzf ${_pkgname}-source-${pkgver}-${_pkgreview}.tar.gz
  cd ${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}

  export CC="gcc -m32"
  
  patch -p1 -i ../mychanges.patch

  for libname in "libgimp-2.0.so" "libgimpmath-2.0.so" "libgimpconfig-2.0.so" "libgimpcolor-2.0.so" "libgimpbase-2.0.so"; do
    ln -s /usr/lib32/${libname} com/libs_bin/${libname}
  done

  cd scangearmp
  ./autogen.sh --prefix=/usr --libdir=/usr/lib32
  if [ -x /usr/bin/libtool ]; then
    rm libtool
    ln -s /usr/bin/libtool
  else
    exit 1;
  fi
  make
}

package_scangearmp-common() {
  pkgdesc="Canon IJ Scanner Driver (Common Package)"
  install=scangearmp-common.install

  depends_x86_64=('lib32-libusb-compat' 'lib32-gimp')
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

  install -D LICENSE-scangearmp-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-scangearmp-${pkgver}EN.txt
}

package_scangearmp-mp550() {
  install=scangearmp-mp550.install

  depends_x86_64=('lib32-gtk2>=2.6')
  depends_i686=('gtk2>=2.6')
  depends=("${_pkgname}-common=${pkgver}")

  cd ${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}

  install -d ${pkgdir}/usr/lib32/bjlib
  for libname in "libcncpmsimg359.so.1.4.0" "libcncpmslld359c.so.1.04.1" "libcncpmslld359.so.1.4.0"; do
    install -s -m 755 359/libs_bin/${libname} ${pkgdir}/usr/lib32
  done
  for auxname in "cnc173dd.tbl" "cnc_3590.tbl" "CNC550.DAT" "CNC550P.DAT"; do
    install -m 644 359/${auxname} ${pkgdir}/usr/lib32/bjlib
  done

  install -D LICENSE-scangearmp-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-scangearmp-${pkgver}EN.txt
}


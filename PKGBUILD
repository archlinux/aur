# Maintainer: Sergey Kolesov <cucullus at mail dot ru>
# Contributor: Chris Severance <aur.severach aATt spamgourmet dott com>
# Contributor: Joan Figueras <ffigue at gmail dot com>
# Contributor: megadriver <megadriver at gmx dot com>
# Based on hplip from [extra]

pkgname='hplip-minimal'
pkgver=3.20.6
pkgrel=1
pkgdesc='HPLIP lite build (print and scan drivers only)'
arch=('x86_64')
url='https://developers.hp.com/hp-linux-imaging-and-printing/'
license=('GPL2' 'custom')
depends=('foomatic-db-engine' 'libusb' 'ghostscript' 'libjpeg-turbo')
conflicts=('hplip')
provides=('hplip')
backup=('etc/hp/hplip.conf' 'etc/sane.d/dll.d/hpaio')
options=('!docs')
source=("https://downloads.sourceforge.net/hplip/hplip-${pkgver}.tar.gz"
        0025-Remove-all-ImageProcessor-functionality-which-is-clo.patch
        hplip-revert-plugins.patch)
md5sums=('89a596bac1a3e7df88be67b16a601a98'
         'a9c230a3a6ca8f336d5a12b099ae834f'
         'c199d694f544ac16088b4f8fd663b333')
sha256sums=('c64b2d334348010a9911f4feb075b2aa669047e7adb86c72d4a6ee7d392a7c20'
            '5b7c19487f6e4def978b58aa8686249f234d4f64e1fb2444c602ea16716477dd'
            '327180688a945fde59d1e0b399877c92657f4e674cc6c21a2e5fd5b6460e922a')
validpgpkeys=('4ABA2F66DBD5A95894910E0673D770CDA59047B9') # HPLIP (HP Linux Imaging and Printing) <hplip@hp.com>

# Build instructions: https://developers.hp.com/hp-linux-imaging-and-printing/install/manual/distros/other
build() {
  cd "hplip-${pkgver}"

 # remove binary blob libImageProcessor and all linking - FS#59681
  patch -Np1 -i "${srcdir}"/0025-Remove-all-ImageProcessor-functionality-which-is-clo.patch

  # why do they disable the plugins for almost all printers??? - FS#67119
  patch -Np1 -i ../hplip-revert-plugins.patch

 # Configure options:
 #   https://developers.hp.com/hp-linux-imaging-and-printing/install/manual/configure
 #   ./configure -h
 ./configure --prefix=/usr \
             --enable-lite-build \
             --disable-doc-build \
             --disable-fax-build
             #--disable-scan-build \
             #--disable-gui-build

 make
}

package() {
 cd "hplip-${pkgver}"
 make DESTDIR="${pkgdir}/" install

 # remove config provided by sane and autostart of hp-daemon
 rm -rf "$pkgdir"/etc/{sane.d,xdg}
 install -dm755 "${pkgdir}"/etc/sane.d/dll.d
 echo hpaio > "${pkgdir}"/etc/sane.d/dll.d/hpaio

 # remove HAL .fdi file because HAL is no longer used
 rm -vrf "${pkgdir}"/usr/share/hal

 # add mixed license file
 install -Dt "${pkgdir}"/usr/share/licenses/${pkgname} -m644 COPYING
}

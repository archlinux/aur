# Maintainer: onemorelag@gmail.com

_pkgname=hplip
pkgname=hplip318
_pkgver=3.18.12
pkgver=12
pkgrel=1
conflicts=("hplip")
pkgdesc="Drivers for HP DeskJet, OfficeJet, Photosmart, Business Inkjet and some LaserJet"
arch=('x86_64')
url="http://hplipopensource.com"
license=('GPL2' 'custom')
depends=('python-dbus' 'ghostscript' 'net-snmp' 'foomatic-db-engine')
makedepends=('python-pyqt5' 'python-gobject' 'sane' 'rpcbind' 'cups' 'libusb')
optdepends=('cups: for printing support'
            'sane: for scanner support'
            'xsane: sane scanner frontend'
            'python-pillow: for commandline scanning support'
            'python-reportlab: for pdf output in hp-scan'
            'rpcbind: for network support'
            'python-pyqt5: for running GUI and hp-toolbox'
            'python-gobject: for running hp-toolbox'
            'libusb: for advanced usb support'
            'wget: for network support')
# 'hplip-plugin: binary blobs for specific devices (AUR) or run hp-setup to download the plugin'
backup=('etc/hp/hplip.conf' 'etc/sane.d/dll.d/hpaio')
source=(https://downloads.sourceforge.net/${_pkgname}/$_pkgname-$_pkgver.tar.gz
        disable_upgrade.patch
        0022-Add-include-cups-ppd.h-in-various-places-as-CUPS-2.2.patch
        0023-Fix-handling-of-unicode-filenames-in-sixext.py.patch
        0025-Remove-all-ImageProcessor-functionality-which-is-clo.patch
        python.patch)
sha512sums=('SKIP'
            'ee0bd240568a7dbb4dc6ef64dba28ea84c4bedf7d688d054960c686666f8f0bc4562961c40845107ef0c936e60d3e676bffb2a1ba708039690bb0520cda3a525'
            '22aeb5b851f78bc6bc62e0bc3da99fecaf42d7604af41e2f3343f8d3666541f7b06b7d1a7d0ddf24f1731ac7b12dfe582375a98e3b94dfa323d6ce954549ca67'
            '763949a0bc460dcc9faefc86f2a91cf342781bfce696ed0c3826758572dd03ac266bbeb7b6a4f9376ac298d7d3c9c4def42d94921a8e1d1695e39396e36d95ff'
            '8710e039626878270b8b7bc1569566274d935c84652d758e25ce8fe01c0f44d911148620bb494489e1238201c01f3ba255c19f7dc5c2ff0d45a5f2a79190286b'
            'ebcc40cac00b9fb63d378d42ac258eeaf6e0967f34fd1e204c690f34457a0a2b634ef65f1deb79a0740d8c6047f718c10fa205ee2f239b667f7e06c065590528')

prepare() {
 cd $_pkgname-$_pkgver
 
 # disable insecure update - https://bugs.archlinux.org/task/38083
 patch -Np0 -i ${srcdir}/disable_upgrade.patch
 
 # add missing 'include <cups/ppd.h>' at various places
 patch -Np1 -i ${srcdir}/0022-Add-include-cups-ppd.h-in-various-places-as-CUPS-2.2.patch
 # fix some handling unicode file names FS#58412
 patch -Np1 -i ${srcdir}/0023-Fix-handling-of-unicode-filenames-in-sixext.py.patch
 # remove binary blob libImageProcessor and all linking - FS#59681
 patch -Np1 -i ${srcdir}/0025-Remove-all-ImageProcessor-functionality-which-is-clo.patch
 # fix python issue - FS#59548
 patch -Np1 -i ${srcdir}/python.patch

 export AUTOMAKE='automake --foreign'
 autoreconf --force --install
}

build() {
 cd $_pkgname-$_pkgver
 ./configure --prefix=/usr \
             --enable-qt5 \
             --disable-qt4 \
             --enable-hpcups-install \
             --enable-cups-drv-install \
             --enable-pp-build #--help
 make
}

package() {
 cd $_pkgname-$_pkgver
 make -j1 rulesdir=/usr/lib/udev/rules.d DESTDIR="$pkgdir/" install
 
 # remove config provided by sane and autostart of hp-daemon
 rm -rf "$pkgdir"/etc/{sane.d,xdg}
 install -dm755 ${pkgdir}/etc/sane.d/dll.d
 echo hpaio > ${pkgdir}/etc/sane.d/dll.d/hpaio
 
 # remove HAL .fdi file because HAL is no longer used
 rm -vrf "$pkgdir"/usr/share/hal
 
 # remove rc script
 rm -vrf "$pkgdir"/etc/init.d

 # add mixed license file
 install -Dt "${pkgdir}"/usr/share/licenses/${_pkgname} -m644 COPYING
}

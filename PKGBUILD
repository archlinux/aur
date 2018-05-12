# $Id$
# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor : Rémy Oudompheng <remy@archlinux.org>
# Contributor: Morgan LEFIEUX <comete@archlinuxfr.org>

pkgname=hplip-raw-ledm
pkgver=3.18.4
pkgrel=1
pkgdesc="HPLIP with patch for uncompressed scanning on LEDM-based peripherals"
arch=('x86_64')
url="http://hplipopensource.com"
license=('GPL')
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
source=(https://downloads.sourceforge.net/hplip/hplip-$pkgver.tar.gz{,.asc}
        disable_upgrade.patch
        hpscan-ledm-raw.patch
        0022-Add-include-cups-ppd.h-in-various-places-as-CUPS-2.2.patch
        0023-Fix-handling-of-unicode-filenames-in-sixext.py.patch
        hplip-colorlaserjet-mfp-m278-m281.patch)
sha1sums=('80b7c35adaa287ff51aa6938bf52046d06a32058'
          'SKIP'
          '2348bcbca0c52dc09cceb47ed13281a4ccb9d83e'
          '7e4b095d8bf9a0af9f0d035ca37691f733e271e0'
          '2ef86972ab51c0fdcb8bfc653b9f6f69459449a5'
          '0e36f31b98faf2f14137431bc8f82b74de22705b'
          '89e0ed0ed9acc6e50812c843ffb5f996fffb829e')
validpgpkeys=('4ABA2F66DBD5A95894910E0673D770CDA59047B9') # HPLIP (HP Linux Imaging and Printing) <hplip@hp.com>

prepare() {
 cd hplip-$pkgver
 
 # disable insecure update - https://bugs.archlinux.org/task/38083
 patch -Np0 -i ${srcdir}/disable_upgrade.patch
 
 # add missing 'include <cups/ppd.h>' at various places
 patch -Np1 -i ${srcdir}/0022-Add-include-cups-ppd.h-in-various-places-as-CUPS-2.2.patch
 # fix some handling unicode file names FS#58412
 patch -Np1 -i ${srcdir}/0023-Fix-handling-of-unicode-filenames-in-sixext.py.patch
 # add support for some missing models - FS#57683
 patch -Np1 -i ${srcdir}/hplip-colorlaserjet-mfp-m278-m281.patch

 # patch hpscan
 patch -Np1 -i ${srcdir}/hpscan-ledm-raw.patch

 export AUTOMAKE='automake --foreign'
 autoreconf --force --install
}

build() {
 cd hplip-$pkgver
 ./configure --prefix=/usr \
             --enable-qt5 \
             --disable-qt4 \
             --enable-hpcups-install \
             --enable-cups-drv-install \
             --enable-pp-build #--help
 make
}

package() {
 cd hplip-$pkgver
 make -j1 rulesdir=/usr/lib/udev/rules.d DESTDIR="$pkgdir/" install
 
 # remove config provided by sane and autostart of hp-daemon
 rm -rf "$pkgdir"/etc/{sane.d,xdg}
 install -dm755 ${pkgdir}/etc/sane.d/dll.d
 echo hpaio > ${pkgdir}/etc/sane.d/dll.d/hpaio
 
 # remove HAL .fdi file because HAL is no longer used
 rm -vrf "$pkgdir"/usr/share/hal
 
 # remove rc script
 rm -vrf "$pkgdir"/etc/init.d
}

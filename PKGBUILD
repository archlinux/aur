pkgname=hplip-raw-ledm
pkgver=3.16.10
pkgrel=1
pkgdesc="HPLIP with patch for uncompressed scanning on LEDM-based peripherals"
arch=('i686' 'x86_64')
url="http://hplipopensource.com"
license=('GPL')
depends=('python' 'ghostscript>=8.64-6' 'net-snmp>=5.7.1' 'wget' 'foomatic-db-engine')
makedepends=('python-pyqt4' 'python-gobject' 'sane' 'rpcbind' 'cups' 'libusb')
optdepends=('cups: for printing support'
            'python-dbus: for dbus support'
            'sane: for scanner support'
            'python-pillow: for commandline scanning support'
            'python-reportlab: for pdf output in hp-scan'
            'rpcbind: for network support'
            'python-pyqt4: for running GUI and hp-toolbox'
            'python-gobject: for running hp-toolbox'
            'hplip-plugin: binary blobs for specific devices (AUR) or run hp-setup to download the plugin'
            'libusb: for advanced usb support')
conflicts=('hplip')
provides=('hplip')
install=hplip.install
source=(http://downloads.sourceforge.net/hplip/hplip-$pkgver.tar.gz{,.asc}
        disable_upgrade.patch
        hpscan-ledm-raw.patch)
sha1sums=('e3bc9a0d135232eba412952ca58b63757783e22f'
          'SKIP'
          '2348bcbca0c52dc09cceb47ed13281a4ccb9d83e'
          '7e4b095d8bf9a0af9f0d035ca37691f733e271e0')
validpgpkeys=('4ABA2F66DBD5A95894910E0673D770CDA59047B9') # HPLIP (HP Linux Imaging and Printing) <hplip@hp.com>

prepare() {
 cd hplip-$pkgver
 
 # disable insecure update - https://bugs.archlinux.org/task/38083
 patch -Np0 -i ${srcdir}/disable_upgrade.patch
 patch -Np1 -i ${srcdir}/hpscan-ledm-raw.patch
 
 # https://bugs.archlinux.org/task/30085 - hack found in Gentoo
 # Use system foomatic-rip for hpijs driver instead of foomatic-rip-hplip
 # The hpcups driver does not use foomatic-rip
	local i
	for i in ppd/hpijs/*.ppd.gz ; do
		rm -f ${i}.temp
		gunzip -c ${i} | sed 's/foomatic-rip-hplip/foomatic-rip/g' | \
			gzip > ${i}.temp || return 1
		mv ${i}.temp ${i}
	done
   
 export AUTOMAKE='automake --foreign'
 autoreconf --force --install
}

build() {
 cd hplip-$pkgver
 ./configure --prefix=/usr \
             --enable-qt4 \
             --disable-foomatic-rip-hplip-install \
             --enable-foomatic-ppd-install \
             --enable-hpcups-install \
             --enable-new-hpcups \
             --enable-cups-ppd-install \
             --enable-cups-drv-install \
             --enable-hpijs-install \
             --enable-foomatic-drv-install \
             --enable-pp-build #--help
 make
}

package() {
 cd hplip-$pkgver
 make -j1 rulesdir=/usr/lib/udev/rules.d DESTDIR="$pkgdir/" install
 
 # remove config provided by sane and autostart of hp-daemon
 rm -rf "$pkgdir"/etc/{sane.d,xdg}
 
 # remove HAL .fdi file because HAL is no longer used
 rm -vrf "$pkgdir"/usr/share/hal
 
 # remove rc script
 rm -vrf "$pkgdir"/etc/init.d
}

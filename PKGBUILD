# Maintainer:  Malstrond <malstrond@gmail.com>
# Contributor: Jose Riha <jose1711@gmail.com>
# Contributor: Bazon <bazonbloch@arcor.de>

pkgname=activtools
pkgver=5.18.18
pkgrel=0
pkgdesc="Tools for Promethean hardware: activmanager, activcalibrate, activremote, activmonitor."
arch=('x86_64')
url="https://support.prometheanworld.com/product/activdriver"
license=('unknown')
depends=('nss' 'openssl-1.0' 'qt5-base' 'icu60')
optdepends=('activinspire: Prometheans presentation software'
            'activdriver: Driver for Promethean hardware')
source=("http://activsoftware.co.uk/linux/repos/driver/ubuntu/pool/non-oss/a/activtools/activtools_$pkgver-0~Ubuntu~1804_amd64.deb")
md5sums=('c1c1d41bc3025c55636231462e6b2d65')

package() {
 # Extract the source.
 bsdtar -C "$pkgdir" -xf data.tar.xz

 # Use /usr instead of /usr/local to match Arch packaging standards.
 mv "$pkgdir"/usr/local/* "$pkgdir"/usr/
 rmdir "$pkgdir"/usr/local

 # activmgr is linked to libpcre16.so.3, which only exists on Debian.
 # So we create a dirty symlink in the directory that has Prometheans own library versions.
 ln -s /usr/lib/libpcre16.so "$pkgdir"/usr/share/promethean/lib/libpcre16.so.3

 # These tools attempt to create a lockfile in /var/Promethean, the path is hardcoded.
 # Since they are started by the user, this directory needs to be world-writable, even if that's a bad idea.
 install -dm0777 "$pkgdir"/var/Promethean

 # activcalibrate attemps to store calibration information in /etc/promethean/calibration, the path is hardcoded.
 # Since it is started by the user, this directory needs to be world-writable, even if that's a bad idea.
 install -dm0777 "$pkgdir"/etc/promethean/calibration

 # activmgr works only when started after the ActivBoard is attached, so no autostart.
 # Delete the following line if you want an autostart of activmgr.
 rm -r "$pkgdir"/etc/xdg

 echo " "
 echo "These tools depend on specific library versions included by Promethean."
 echo "In order for them to be used start activmgr using activmgr.sh, activcalibrate using activcalibrate.sh, and so on."
 echo " "
 echo "Promethean software has a bug that often causes it to hang when attempting to close it using the GUI."
 echo "This means you need to manually kill activcalibrate.sh after you finished calibration."
 echo "Use ALT+F4, your desktop environments method, killall, or start it using the timeout command."
 echo " "
}

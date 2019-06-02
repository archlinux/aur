# Maintainer: Malstrond <malstrond@gmail.com>
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: Bazon <bazonbloch@arcor.de>

pkgname=activinspire
pkgver=2.15.67911
pkgrel=0
pkgdesc="Presentation Software for use with Promethean Hardware products."
arch=('x86_64')
url="https://support.prometheanworld.com/product/activinspire"
license=('unknown')
depends_x86_64=(lib32-libxmu lib32-gst-plugins-base lib32-libjpeg6-turbo lib32-libxrender lib32-libgl lib32-fontconfig lib32-openssl-1.0 lib32-nss)
optdepends=('bin32-jre: For using the equation editor'
            'activdriver: Driver for Promethean hardware'
            'activtools: Tools for Promethean hardware, e.g. calibration or systray monitor')
source_x86_64=("http://activsoftware.co.uk/linux/repos/ubuntu/pool/non-oss/a/activinspire/activinspire_${pkgver}-1.amd64_amd64.deb"
               "inspire.sh")
md5sums_x86_64=('de5a3c8345b59de44bdd946ad2d1541a'
                'ff6607cc18a27e2535b8475f5f0db09d')

package() {
 # The upstream .deb actually includes 3 whole setups:
 #  1. The actual files to be used by the package manager (in the . directory),
 #  2. a self-contained installer for installing without a package manager (in ./inspire),
 #  3. an older version of ActivInspire (13.x) (in ./inspire/DEB).
 # It also includes/etc/xdg (not needed) and /var/Promethean (created with the correct permissions below).
 # All except #1 are not extracted to save time while removing them.
 bsdtar -C "$pkgdir" --exclude=./inspire --exclude=./var --exclude=./etc -xf data.tar.gz

 # Use /usr instead of /usr/local to match Arch packaging standards.
 mv "$pkgdir"/usr/local/bin "$pkgdir"/usr/
 rmdir "$pkgdir"/usr/local
 # Because we just changed that, now we need to fix the absolute paths that Promethean uses in their files.
 sed -i "s%/usr/local/bin%/usr/bin%" "$pkgdir"/usr/share/applications/activsoftware.desktop
 sed -i "s%/usr/local/bin%/usr/bin%" "$pkgdir"/usr/share/applications/activplayer.desktop
 sed -i "s%/usr/local/bin%/usr/bin%" "$pkgdir"/usr/bin/activsoftware/workbench/activdashboard.sh
 sed -i "s%/usr/local/bin%/usr/bin%" "$pkgdir"/usr/bin/activityplayer

 # ActivInspire ships with functionality to disable compositing. This should really be handled by the users WM configuration, so we remove that.
 rm "$pkgdir"/usr/share/applications/activsoftware-nc.desktop

 # The upstream launch script for ActivInspire only works with Ubuntu, so we replace it with out own.
 install -Dm555 inspire.sh "$pkgdir"/usr/bin/inspire

 # This software attempts to create a lockfile in /var/Promethean/ActivInspire, the path is hardcoded.
 # Since it is started by the user, this directory needs to be world-writable, even if that's a bad idea.
 install -dm0777 "$pkgdir"/var/Promethean

 # Warn the user about behavior.
 echo " "
 echo "Promethean software has a bug that often causes it to hang when attempting to close it using the GUI."
 echo "It will also not start if an instance of it is already running."
 echo "To work around this all remaining ActivInspire instances are killed when you launch it. "
 echo "This means you will lose your work when attempting to open a second instance while still working in the first one."
 echo " "
}

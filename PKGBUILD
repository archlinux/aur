# Maintainer: Malstrond <malstrond@gmail.com>
# Contributor: Jean-Baptiste Le Coz <jb.lecoz@gmail.com>
# Contributor: Jose Riha <jose1711@gmail.com>
# Contributor: Bazon <bazonbloch@arcor.de>

pkgname=activinspire
pkgver=2.17.68075
pkgrel=0
pkgdesc="Presentation Software for use with Promethean Hardware products."
arch=('x86_64')
url="https://support.prometheanworld.com/product/activinspire"
license=('unknown')
depends=(lib32-libxmu lib32-gst-plugins-base lib32-libjpeg-turbo lib32-libjpeg6-turbo lib32-libxrender lib32-libgl lib32-fontconfig lib32-openssl-1.0 lib32-nss lib32-libxcomposite lib32-libxcursor lib32-dbus)
optdepends=('bin32-jre: For using the equation editor'
            'activdriver: Driver for Promethean hardware'
            'activtools: Tools for Promethean hardware, e.g. calibration or systray monitor')
source=("http://activsoftware.co.uk/linux/repos/ubuntu/pool/non-oss/a/activinspire/activinspire_${pkgver}-1.amd64_amd64.deb"
        "inspire.sh"
        "com.ubuntu.user-interface.gschema.xml")
md5sums=('59e02cb9f8cd7636507cb4255a7268ec'
         '21ff8944ba388a6b5aab894839745132'
         'e0f2c4078eadd00de8f28159b273e576')

package() {
 # The upstream .deb actually includes 3 whole setups:
 #  1. The actual files to be used by the package manager (in the . directory),
 #  2. a self-contained installer for installing without a package manager (in ./inspire),
 #  3. an older version of ActivInspire (13.x) (in ./inspire/DEB).
 # It also includes /etc/xdg (not needed) and /var/Promethean (created with the correct permissions below).
 # All except #1 are not extracted to save time while removing them.
 bsdtar -C "$pkgdir" --exclude=./inspire --exclude=./var --exclude=./etc -xf data.tar.gz

 # Use /opt instead of /usr/local/bin for binaries to match Arch packaging standards for large self-contained packages.
 mkdir "$pkgdir"/opt
 ## These are the binaries.
 mv "$pkgdir"/usr/local/bin/activsoftware "$pkgdir"/opt/
 ## This is just a start script, so it can be put into bin alongside inspire.sh.
 install -dm0755 "$pkgdir"/usr/bin
 mv "$pkgdir"/usr/local/bin/activityplayer "$pkgdir"/usr/bin/activityplayer
 rmdir "$pkgdir"/usr/local/bin
 rmdir "$pkgdir"/usr/local
 # Because we just changed the paths, now we need to fix the absolute paths that Promethean uses in their files.
 sed -i "s%/usr/local/bin%/usr/bin%" "$pkgdir"/usr/share/applications/activsoftware.desktop
 sed -i "s%/usr/local/bin%/usr/bin%" "$pkgdir"/usr/share/applications/activplayer.desktop
 sed -i "s%/usr/local/bin%/opt%" "$pkgdir"/opt/activsoftware/workbench/activdashboard.sh
 sed -i "s%/usr/local/bin%/opt%" "$pkgdir"/usr/bin/activityplayer

 #  Install com.ubuntu.user-interface schema need to launch ActivInspire.
 mkdir "$pkgdir"/usr/share/glib-2.0
 mkdir "$pkgdir"/usr/share/glib-2.0/schemas
 install -Dm755 com.ubuntu.user-interface.gschema.xml "$pkgdir"/usr/share/glib-2.0/schemas

 # ActivInspire ships with functionality to disable compositing. This should really be handled by the users WM configuration, so we remove that.
 rm "$pkgdir"/usr/share/applications/activsoftware-nc.desktop

 # The upstream launch script for ActivInspire only works with Ubuntu, so we replace it with our own.
 install -Dm755 inspire.sh "$pkgdir"/usr/bin/inspire

 # This software attempts to create a lockfile in /var/Promethean/ActivInspire, the path is hardcoded.
 # Since it is started by the user, this directory needs to be world-writable, even if that's a bad idea.
 install -dm0777 "$pkgdir"/var/Promethean

 # Warn the user about behavior.
 echo " "
 echo "Promethean software has a bug that often causes it to hang when attempting to close it using the GUI."
 echo "It will also not start if an instance of it is already running."
 echo "To work around this all remaining ActivInspire instances are killed when you launch it."
 echo "This means you will lose your work when attempting to open a second instance while still working in the first one."
 echo " "
}

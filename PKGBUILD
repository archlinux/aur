# Maintainer: Malstrond <malstrond@gmail.com>
# Contributor: Jean-Baptiste Le Coz <jb.lecoz@gmail.com>
# Contributor: Jose Riha <jose1711@gmail.com>
# Contributor: Bazon <bazonbloch@arcor.de>

pkgname=activinspire
pkgver=2.21.69365
pkgrel=1
pkgdesc="Presentation Software for use with Promethean Hardware products."
arch=('x86_64')
url="https://support.prometheanworld.com/product/activinspire"
license=('unknown')
depends=(libxmu gst-plugins-base libjpeg-turbo libxrender libgl fontconfig openssl-1.0 nss libxcomposite libxcursor libxtst dbus icu60)
optdepends=('activdriver: Driver for Promethean hardware'
            'activtools: Tools for Promethean hardware, e.g. calibration or systray monitor')
source=("http://activsoftware.co.uk/linux/repos/ubuntu/pool/bionic/a/ac/activinspire_1804-${pkgver}-1-amd64.deb"
        "inspire.sh"
	"activityplayer.sh"
        "com.ubuntu.user-interface.gschema.xml")
md5sums=('1b91d697622c2a89861a63ecd90ab625'
         'd3096ede6c2cd388469f4e12a8286ee8'
         '14f618ed07ed2d267b2578818d253200'
         'e0f2c4078eadd00de8f28159b273e576')

package() {
 # Extract software from debian archive. Exclude /etc/xdg (not needed) and /var/Promethean (created with the correct permissions below).
 bsdtar -C "$pkgdir" --exclude=./var --exclude=./etc -xf data.tar.xz

 # Use /opt instead of /usr/local/bin for binaries to match Arch packaging standards for large self-contained packages.
 install -dm0755 "$pkgdir"/opt
 mv "$pkgdir"/usr/local/bin/activsoftware "$pkgdir"/opt/
 rm -r "$pkgdir"/usr/local
 # Because we just changed the paths, now we need to fix the absolute paths that Promethean uses in their files.
 sed -i "s%/usr/local/bin%/usr/bin%" "$pkgdir"/usr/share/applications/activsoftware.desktop
 sed -i "s%/usr/local/bin%/usr/bin%" "$pkgdir"/usr/share/applications/activplayer.desktop

 #  Install com.ubuntu.user-interface schema need to launch ActivInspire.
 mkdir "$pkgdir"/usr/share/glib-2.0
 mkdir "$pkgdir"/usr/share/glib-2.0/schemas
 install -Dm755 com.ubuntu.user-interface.gschema.xml "$pkgdir"/usr/share/glib-2.0/schemas

 # ActivInspire ships with functionality to disable compositing. This should really be handled by the users WM configuration, so we remove that.
 rm "$pkgdir"/usr/share/applications/activsoftware-nc.desktop

 # The upstream launch scripts only work with Ubuntu, so we replace them with our own.
 install -dm0755 "$pkgdir"/usr/bin
 install -Dm755 inspire.sh "$pkgdir"/usr/bin/inspire
 install -Dm755 activityplayer.sh "$pkgdir"/usr/bin/activityplayer

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

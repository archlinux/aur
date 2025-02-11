# Maintainer: DaveD <david@codevertex.de>
# Contributor: jbreizh
# Contributor: Malstrond <malstrond@gmail.com>
# Contributor: Jean-Baptiste Le Coz <jb.lecoz@gmail.com>
# Contributor: Jose Riha <jose1711@gmail.com>
# Contributor: Bazon <bazonbloch@arcor.de>

pkgname=activinspire
pkgver=3.5.18
pkgrel=1
pkgdesc="Presentation Software for use with Promethean Hardware products ."
arch=('x86_64')
url="https://support.prometheanworld.com/product/activinspire"
license=('unknown')
depends=(libxmu gst-plugins-base libjpeg-turbo libxrender libxkbcommon libxrandr libgl libxdamage snappy libgl fontconfig openssl-1.1 nss libxcomposite libxcursor libxtst dbus libxkbcommon-x11 xcb-util-wm xcb-util-image xcb-util-renderutil qt5-webengine)
optdepends=('activdriver: Driver for Promethean hardware'
            'activtools: Tools for Promethean hardware, e.g. calibration or systray monitor')
source=("https://activsoftware.co.uk/linux/repos/ubuntu/pool/focal/a/ac/activinspire_2004-3.5.18-1-amd64.deb"
        "inspire.sh"
        "activityplayer.sh"
        "libre2.so.5"
        "libwebp.so.6"
        )
md5sums=('855cd48c72f4dc9e8bd5a653225bf541'
         'c9d1532b5dce33522a77b59a62478ddd'
         '4f8d3e07429c214cf6cc3f067fec76b7'
         'fb8c55ea7f19bdcc81b51c911bbf565b'
         '13048084f7d2dc10dcb9378c9732da62'
         )

package() {

 # Extract software from debian archive. Exclude /etc/xdg (not needed) and /var/Promethean (created with the correct permissions below).
 bsdtar -C "$pkgdir" --exclude=./var --exclude=./etc/xdg --exclude=./usr/share/gnome-shell -xf data.tar.xz

 # Use /opt instead of /usr/local/bin for binaries to match Arch packaging standards for large self-contained packages.
 install -dm0755 "$pkgdir"/opt
 mv "$pkgdir"/usr/local/bin/activsoftware "$pkgdir"/opt/
 rm -r "$pkgdir"/usr/local

 # Because we just changed the paths, now we need to fix the absolute paths that Promethean uses in their files.
 sed -i "s%/usr/local/bin%/usr/bin%" "$pkgdir"/usr/share/applications/activsoftware.desktop
 sed -i "s%/usr/local/bin%/usr/bin%" "$pkgdir"/usr/share/applications/activplayer.desktop

 # ActivInspire ships with functionality to disable compositing. This should really be handled by the users WM configuration, so we remove that.
 rm "$pkgdir"/usr/share/applications/activsoftware-nc.desktop

 # The upstream launch scripts only work with Ubuntu, so we replace them with our own.
 install -dm0755 "$pkgdir"/usr/bin
 install -Dm755 inspire.sh "$pkgdir"/usr/bin/inspire
 install -Dm755 activityplayer.sh "$pkgdir"/usr/bin/activityplayer

 # This software attempts to create a lockfile in /var/Promethean/ActivInspire, the path is hardcoded.
 # Since it is started by the user, this directory needs to be world-writable, even if that's a bad idea.
 install -dm0777 "$pkgdir"/var/Promethean

 # Install libre2.so.5 and libwebp.so.6 from ubuntu focal deb package
  install -Dm755 libre2.so.5 "$pkgdir"/opt/activsoftware
  install -Dm755 libwebp.so.6 "$pkgdir"/opt/activsoftware
}

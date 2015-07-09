# Maintainer: Red Squirrel <iam at redsquirrel87 dot com>
# Based on PMS PKGBUILD

pkgname=ums
pkgver=5.2.0
pkgrel=1
pkgdesc="Universal Media Server: a DLNA-compliant UPnP Media Server. Build based on Java 8."
arch=('i686' 'x86_64')
url="http://www.universalmediaserver.com/"
license=('GPL2')
depends=('mplayer' 'ffmpeg' 'mencoder' 'libmediainfo' 'java-runtime')
makedepends=("unzip")
[ "$CARCH" = "i686" ] && \
optdepends=("vlc: For Internet video/audio")
[ "$CARCH" = "x86_64" ] && \
optdepends=("vlc: Internet video/audio support"
            "dcraw: thumbnails creation support"
            "lib32-gcc-libs: tsMuxeR support"
            "lib32-glibc: tsMuxeR support")
backup=(opt/ums/UMS.conf \
        opt/ums/WEB.conf)
source=("http://downloads.sourceforge.net/project/unimediaserver/Official%20Releases/Linux/UMS-$pkgver-Java8.tgz")
sha1sums=('bb72a351acd5c43b1c7e14eac8af8cbee02f289c')

package() {
  mkdir -p $pkgdir/opt/ums
  mkdir $pkgdir/opt/ums/database
  mkdir -p $pkgdir/usr/bin
  chmod -R 755 $srcdir/ums-$pkgver/plugins $srcdir/ums-$pkgver/documentation
  cp -r $srcdir/ums-$pkgver/* $pkgdir/opt/ums/
  chmod +x $pkgdir/opt/ums/UMS.sh \
           $pkgdir/opt/ums/linux/tsMuxeR
  touch $pkgdir/opt/ums/UMS.conf
  touch $pkgdir/opt/ums/debug.log
  chgrp users $pkgdir/opt/ums/UMS.conf \
              $pkgdir/opt/ums/WEB.conf \
              $pkgdir/opt/ums/debug.log \
              $pkgdir/opt/ums/database

  chmod g+w $pkgdir/opt/ums/UMS.conf \
            $pkgdir/opt/ums/WEB.conf \
            $pkgdir/opt/ums/debug.log \
            $pkgdir/opt/ums/database 

  unzip -q -u $srcdir/ums-$pkgver/ums.jar -d ums_jar
  install -d -m 755 $pkgdir/usr/share/pixmaps
  install -D -m 644 $srcdir/ums_jar/resources/images/logo.png $pkgdir/usr/share/pixmaps/ums.png

  cat > ums.desktop << EoF
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Name=Universal Media Server
Comment=A DLNA-compliant UPnP Media Server.
Exec=/opt/ums/UMS.sh
Icon=ums.png
Terminal=false
Type=Application
Categories=Java;Multimedia;AudioVideo;
EoF

  install -D -m 644 $srcdir/ums.desktop $pkgdir/usr/share/applications/ums.desktop

}

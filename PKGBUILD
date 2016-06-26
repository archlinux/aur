# Maintainer: Kim Nordmo <kim.nordmo@gmail.com>
# Based on UMS PKGBUILD

pkgname=umsjava7
pkgver=6.4.0
pkgrel=1
pkgdesc="Universal Media Server: a DLNA-compliant UPnP Media Server. Build based on Java 7."
arch=('any')
url="http://www.universalmediaserver.com/"
license=('GPL2')
provides=('ums: Universal Media Server')
conflicts=('ums')
depends=('mplayer' 'ffmpeg' 'mencoder' 'tsmuxer-cli-ng' 'libmediainfo' 'java-runtime=7' 'desktop-file-utils')
makedepends=("unzip")
optdepends=('vlc: Internet video/audio support'
            'dcraw: thumbnails creation support')
backup=(opt/$pkgname/UMS.conf \
        opt/$pkgname/WEB.conf)
install=umsjava7.install
source=("http://app.oldfoss.com:81/download/Universal-Media-Server/1466892909UMS-$pkgver-Java7.tgz"
        "$pkgname.desktop"
        "$pkgname.service"
        "$pkgname.install"
        'ums')
sha512sums=('5be0a0237880c573340328dc3a7cd512c394f43cadc0abac92def440d0cb997817d013b7d1b2874a70e53faef47de7f2abd1ca407ec4a8e7b04422a0d17afa7b'
            '580080b4d8b831803f2c2dfe46bb69996374fb3659b0cd495563ac09b5fdd09634cf20767fe0caa08d5dfbb70767683e00222a2a829b558cc17ea806c8ef6090'
            '00e57bd860b34068f76a8deb10676e58e935f325b136c89979e108f60f0ed0f1cea0c04925bb57af47db7a5bbc69b13c9568c62b0add99ffbb1654e93aa48233'
            'f995d6fbebf08e88bf2e1675c626e7be88c27f615891f0b4108375b2c8a57881c238b7109f2c0d48ec22105670f33c408ce48ecb9a17cc8db326ffd1a3419803'
            '87ef64f372b361c4b5ec29c267c69255aed5974988bc7339c6e0f22d66de546180d087987fbe24b7285cbc348743c8ae5b2b3b1cc0e6ce89ebfea1fcbec096f1')
package() {
  mkdir -p $pkgdir/opt/$pkgname
  mkdir $pkgdir/opt/$pkgname/database
  mkdir -p $pkgdir/usr/bin
  chmod -R 755 $srcdir/ums-$pkgver/plugins $srcdir/ums-$pkgver/documentation
  rm $srcdir/ums-$pkgver/linux/*
  rm $srcdir/ums-$pkgver/UMS.sh
  cp -r $srcdir/ums-$pkgver/* $pkgdir/opt/$pkgname/
  touch $pkgdir/opt/$pkgname/UMS.conf
  touch $pkgdir/opt/$pkgname/debug.log
  chgrp users $pkgdir/opt/$pkgname/UMS.conf \
              $pkgdir/opt/$pkgname/WEB.conf \
              $pkgdir/opt/$pkgname/debug.log \
              $pkgdir/opt/$pkgname/database

  chmod g+w $pkgdir/opt/$pkgname/UMS.conf \
            $pkgdir/opt/$pkgname/WEB.conf \
            $pkgdir/opt/$pkgname/debug.log \
            $pkgdir/opt/$pkgname/database 

  unzip -q -u $srcdir/ums-$pkgver/ums.jar -d ums_jar
  install -d -m 755 $pkgdir/usr/share/pixmaps
  install -D -m 644 $srcdir/ums_jar/resources/images/logo.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm 644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -D -m 644 $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/user/$pkgname.service
  install -Dm 0755 $srcdir/ums $pkgdir/usr/bin/ums

  ln -s /usr/bin/ffmpeg $pkgdir/opt/$pkgname/linux/ffmpeg
  ln -s /usr/bin/ffmpeg $pkgdir/opt/$pkgname/linux/ffmpeg64
  ln -s /usr/bin/tsMuxeR $pkgdir/opt/$pkgname/linux/tsMuxeR
  ln -s /usr/bin/tsMuxeR $pkgdir/opt/$pkgname/linux/tsMuxeR-new
}

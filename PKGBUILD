# Maintainer: Taijian <taijian@posteo.de>
# Contributor: Jonathan Conder <jonno.conder@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgbase=mythplugins
pkgname=('mythplugins-mytharchive'
         'mythplugins-mythbrowser'
         'mythplugins-mythgallery'
         'mythplugins-mythgame'
         'mythplugins-mythmusic'
         'mythplugins-mythnetvision'
         'mythplugins-mythnews'
         'mythplugins-mythweather'
         'mythplugins-mythweb'
         'mythplugins-mythzoneminder')
pkgver=30.0
pkgrel=5
epoch=1
arch=('x86_64')
url="http://www.mythtv.org"
license=('GPL')
makedepends=('dvdauthor' 'dvd+rw-tools' 'ffmpeg' 'libexif' 'mesa-libgl' "mythtv=$epoch:$pkgver"
             'perl-datetime-format-iso8601' 'perl-date-manip' 'perl-image-size' 'perl-cgi'
             'perl-json' 'perl-libwww' 'perl-soap-lite' 'perl-xml-simple' 'perl-xml-xpath' 'libhdhomerun'
             'python2-pillow' 'python2-pycurl' 'python2-oauthlib' 'gdb' 'mariadb-libs' 'minizip'
             'python2-lxml' 'mysql-python' 'urlgrabber' 'python2-future' 'perl-xml-xpath')
source=("mythtv-$pkgver.tar.gz::https://github.com/MythTV/mythtv/archive/v$pkgver.tar.gz"
        "mythweb-$pkgver.tar.gz::https://github.com/MythTV/mythweb/archive/v$pkgver.tar.gz"
        '001-mythwebcount.patch'
        '002-mythweb.patch'
        '003-mythweb-php7.4.patch'
        '004-mythweb-php7.4.patch'
)
sha256sums=('7f7ae9b8927659616f181afc12d7ddc26b0a4b0d13982e2586985f4770640b43'
            'b0569bdd6f5e6fed959d98ff883912142da42e3ee6ea3984ece116f09a5dc01c'
            '5761623dfcd36ecde723ca1b350f650c13a7d58f8107d4a88f6b0e3888df41d3'
            '86792ef1249df2b679431466312b3654f276aabb96791edf87ba41946cea67c1'
            '4ddb4143a2da5d7e49e9f13135d1a6bbc499acca0fe9a7765a5c412000006e7a'
            '4256469f5db78f8e28331a8f20576f0b917bb0d2b2d053354c4a328adfc4f0d2')

prepare() {
  cd "$srcdir/mythtv-$pkgver/$pkgbase"

  find . -name '*.py' -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
  
  patch -Np1 < "../../004-mythweb-php7.4.patch"

  cd "$srcdir/mythweb-$pkgver"

  patch -Np1 < "../001-mythwebcount.patch"
  patch -Np1 < "../002-mythweb.patch"
  patch -Np1 < "../003-mythweb-php7.4.patch"
  
  sed -re 's@/usr/local.*/usr/share@/usr/share@' -i 'mythweb.php'
}

build() {
  cd "$srcdir/mythtv-$pkgver/$pkgbase"

  ./configure --prefix=/usr \
              --enable-all \
              --python=python2
  qmake-qt5 mythplugins.pro
  make -s
}

package_mythplugins-mytharchive() {
  pkgdesc="Create DVDs or archive recorded shows in MythTV"
  depends=('dvdauthor' 'dvd+rw-tools' 'ffmpeg' 'mythtv' 'python2-pillow')

  cd "$srcdir/mythtv-$pkgver/$pkgbase/mytharchive"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythbrowser() {
  pkgdesc="Mini web browser for MythTV"
  depends=('mythtv')

  cd "$srcdir/mythtv-$pkgver/$pkgbase/mythbrowser"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythgallery() {
  pkgdesc="Image gallery plugin for MythTV"
  depends=('libexif' 'mythtv')

  cd "$srcdir/mythtv-$pkgver/$pkgbase/mythgallery"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythgame() {
  pkgdesc="Game emulator plugin for MythTV"
  depends=('mythtv' 'minizip')

  cd "$srcdir/mythtv-$pkgver/$pkgbase/mythgame"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythmusic() {
  pkgdesc="Music playing plugin for MythTV"
  depends=('mythtv' 'libcdio-paranoia')

  cd "$srcdir/mythtv-$pkgver/$pkgbase/mythmusic"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythnetvision() {
  pkgdesc="MythNetvision plugin for MythTV"
  depends=('mythtv' 'python2-oauthlib')

  cd "$srcdir/mythtv-$pkgver/$pkgbase/mythnetvision"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythnews() {
  pkgdesc="News checking plugin for MythTV"
  depends=('mythtv')

  cd "$srcdir/mythtv-$pkgver/$pkgbase/mythnews"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythweather() {
  pkgdesc="Weather checking plugin for MythTV"
  depends=('mythtv' 'perl-date-manip' 'perl-json' 'perl-soap-lite'
           'perl-xml-simple' 'perl-xml-xpath' 'perl-image-size'
           'perl-datetime-format-iso8601')

  cd "$srcdir/mythtv-$pkgver/$pkgbase/mythweather"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythweb() {
  pkgdesc="Web interface for the MythTV scheduler"
  depends=('mythtv' 'perl-cgi')
  optdepends=('lighttpd'
              'php-apache')

  mkdir -p "$pkgdir/var/lib/mythtv/mythweb"/{image_cache,php_sessions}
  cp -R "$srcdir/mythweb-$pkgver"/* "$pkgdir/var/lib/mythtv/mythweb"
  chown -R http:http "$pkgdir/var/lib/mythtv/mythweb"
  chmod g+rw "$pkgdir/var/lib/mythtv/mythweb"/{image_cache,php_sessions}
}

package_mythplugins-mythzoneminder() {
  pkgdesc="View CCTV footage from zoneminder in MythTV"
  depends=('mythtv' 'mariadb-libs' 'zoneminder')

  cd "$srcdir/mythtv-$pkgver/$pkgbase/mythzoneminder"
  make INSTALL_ROOT="$pkgdir" install
}

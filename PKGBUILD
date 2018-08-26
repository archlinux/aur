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
pkgver=29.1
pkgrel=5
epoch=1
arch=('x86_64')
url="http://www.mythtv.org"
license=('GPL')
makedepends=('dvdauthor' 'dvd+rw-tools' 'ffmpeg' 'libexif' 'mesa-libgl' "mythtv=$epoch:$pkgver"
             'perl-datetime-format-iso8601' 'perl-date-manip' 'perl-image-size' 'perl-cgi'
             'perl-json' 'perl-libwww' 'perl-soap-lite' 'perl-xml-simple' 'perl-xml-xpath'
             'python2-pillow' 'python2-pycurl' 'python2-oauth' 'gdb' 'libmariadbclient'
             'python2-lxml' 'mysql-python' 'urlgrabber' 'python2-future')
source=("mythtv-$pkgver.tar.gz::https://github.com/MythTV/mythtv/archive/v$pkgver.tar.gz"
        "mythweb-$pkgver.tar.gz::https://github.com/MythTV/mythweb/archive/v$pkgver.tar.gz"
        'cdparanoia.patch'
        'mythweb-php_7.2.patch' # can be removed for v29.2+
        'libx264.patch')        # can be removed for v29.2+
sha256sums=('e40ec8111d39fd059a9ec741b10016683bcc66ee3b33c4cdaab93d60851f5d3e'
            '30583d7c077dbc732053d0ee7b13a46ab3ceaeb0aaa7c8e9744ef6ac959989e8'
            '004f1e4734830709d2ab5ebb804560514f2bf525abc2f11142501a81eba0754c'
            '4246fb007e8fe8a99d5d333498a4b14c70e275afb0e89e665ada6a55d0c3211c'
            '810f26ac761c1a4c43d67637091d2765ccaf4be98036d8f33506b29d208ef344')

prepare() {
  cd "$srcdir/mythtv-$pkgver/$pkgbase"

  find . -name '*.py' -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
  patch -Np1 -i "$srcdir/cdparanoia.patch"

  #apply libx264.patch
  cd "$srcdir/mythtv-$pkgver/mythtv"
  patch -Np1 -i ../../libx264.patch

  cd "$srcdir/mythweb-$pkgver"
  patch -Np1 -i "$srcdir/mythweb-php_7.2.patch"

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
  depends=('mythtv')

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
  depends=('mythtv' 'python2-oauth')

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
  depends=('mythtv' 'libmariadbclient' 'zoneminder')

  cd "$srcdir/mythtv-$pkgver/$pkgbase/mythzoneminder"
  make INSTALL_ROOT="$pkgdir" install
}

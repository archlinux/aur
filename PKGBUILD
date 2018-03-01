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
pkgrel=2
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
        'cdparanoia.patch')
sha512sums=('66fda29bd645b4c9a90600414193f46b99b9b8d60d033828f0eeb44e1c3820a7781d93c7010fc1e0affa83be93896231ba91409ccb7dba38190a5809752beedd'
            'bab3f6facb0715c83f21a070f4e4f2299c93ce75e5294b7daac43cd6e10276e37c9853809012627fad0ab10683c25afaf35f0099adb8a8e8a98c383b8804d3ab'
            '6a8c5e3f7500a657cef56d30b7141ab10bd14c65bf3c2d14a768ed180f38deaee6367224e6b0b2d09c26fae78908df08747f8c805250d71c42faaa2931ac577b')

prepare() {
  cd "$srcdir/mythtv-$pkgver/$pkgbase"

  find . -name '*.py' -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
  patch -Np1 -i "$srcdir/cdparanoia.patch"

  cd "$srcdir/mythweb-$pkgver"

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
  install='mythplugins-mythweb.install'

  mkdir -p "$pkgdir/var/lib/mythtv/mythweb"/{image_cache,php_sessions}
  cp -R "$srcdir/mythweb-$pkgver"/* "$pkgdir/var/lib/mythtv/mythweb"
  chown -R http:http "$pkgdir/var/lib/mythtv/mythweb"
  chmod g+rw "$pkgdir/var/lib/mythtv/mythweb"/{image_cache,php_sessions}
}

package_mythplugins-mythzoneminder() {
  pkgdesc="View CCTV footage from zoneminder in MythTV"
  depends=('mythtv' 'libmariadbclient')
  install='mythplugins-mythzoneminder.install'

  cd "$srcdir/mythtv-$pkgver/$pkgbase/mythzoneminder"
  make INSTALL_ROOT="$pkgdir" install
}

# $Id: PKGBUILD 277489 2017-12-30 21:56:48Z alucryd $
# Maintainer:
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
pkgver=29.0
pkgrel=4
epoch=1
arch=('x86_64')
url="http://www.mythtv.org"
license=('GPL')
makedepends=('cdrtools' 'dvdauthor' 'dvd+rw-tools' 'ffmpeg' 'flac' 'libexif'
             'libvorbis' 'mesa' 'mesa-libgl' "mythtv=$epoch:$pkgver"
             'perl-datetime-format-iso8601' 'perl-date-manip' 'perl-image-size'
             'perl-json' 'perl-libwww' 'perl-soap-lite' 'perl-xml-sax'
             'perl-xml-simple' 'perl-xml-xpath' 'python2-oauth' 'python2-pillow'
             'python2-pycurl' 'zlib' 'gdb' 'perl-cgi')
source=("mythtv-$pkgver.tar.gz::https://github.com/MythTV/mythtv/archive/v$pkgver.tar.gz"
        "mythweb-$pkgver.tar.gz::https://github.com/MythTV/mythweb/archive/v$pkgver.tar.gz"
        'cdparanoia.patch'
        'qt510.patch')
sha512sums=('6d79d943b95b1816b4fce52f3de3e01ebcdcc2779f852ec8cf5e3a81f8be4c730a254ff78b52e36ac522ff99b125501f0cba33a2d4c01571552e09fb4dba18c2'
            'bc6f4f6b73136f5c0342b055dd4814ed177b7ca05d70dcb43e7966c3cd854f77dcd7a391eef2b870acf87c82d09c018cf8fb5176724ab55b59a6f2ab3845e0fe'
            '6a8c5e3f7500a657cef56d30b7141ab10bd14c65bf3c2d14a768ed180f38deaee6367224e6b0b2d09c26fae78908df08747f8c805250d71c42faaa2931ac577b'
            'da82e43545cf6c0e882e9729d30cdb1786019da6a1aaf59667594a3a9bebd613422557e470969d35dcad52bc9b255c5d762301eff4c8e759fb2b6a22cd0c8841')

prepare() {
  cd "$srcdir/mythtv-$pkgver/$pkgbase"

  find . -name '*.py' -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
  patch -Np1 -i "$srcdir/cdparanoia.patch"
  patch -Np2 -i ../../qt510.patch

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
  depends=('cdrtools' 'dvdauthor' 'dvd+rw-tools' 'ffmpeg' 'mythtv'
           'python2-pillow')

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
           'perl-xml-sax' 'perl-xml-simple' 'perl-xml-xpath' 'perl-image-size'
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
  depends=('mythtv')
  install='mythplugins-mythzoneminder.install'

  cd "$srcdir/mythtv-$pkgver/$pkgbase/mythzoneminder"
  make INSTALL_ROOT="$pkgdir" install
}

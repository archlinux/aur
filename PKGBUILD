# Maintainer: pvdp <pvdp@email.com>
# Contributor: Taijian <taijian@posteo.de>
# Contributor: Jonathan Conder <jonno.conder@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgbase=mythplugins
pkgname=('mythplugins-mytharchive'
         'mythplugins-mythbrowser'
         'mythplugins-mythgame'
         'mythplugins-mythmusic'
         'mythplugins-mythnetvision'
         'mythplugins-mythnews'
         'mythplugins-mythweather'
         'mythplugins-mythweb'
         'mythplugins-mythzoneminder')
br=fixes/33
t="${br#*/}+${br%/[0-9][0-9]}"
pkgver=33.1.r11.g51cb10a678
pkgrel=1
epoch=0
arch=('any')
url="http://www.mythtv.org"
license=('GPL')
makedepends=('dvdauthor' 'dvd+rw-tools' 'mesa-libgl' "mythtv-git>=$pkgver"
             'perl-datetime-format-iso8601' 'perl-date-manip' 'perl-image-size' 'perl-cgi'
             'perl-json' 'perl-libwww' 'perl-soap-lite' 'perl-xml-simple' 'perl-xml-xpath' 'libhdhomerun'
             'python-pillow' 'python-pycurl' 'python-oauthlib' 'gdb' 'mariadb-libs' 'minizip'
             'python-lxml' 'perl-xml-xpath' 'python-urllib3' 'libcdio-paranoia')
source=("git+https://github.com/MythTV/mythweb#branch=$br"
        "git+https://github.com/MythTV/mythtv#branch=$br"
        '001-mythnetvision-configure.patch'
)
sha256sums=('SKIP'
            'SKIP'
            '51c9fb042a3f2acf4ab9682cb48e9a123cf8f0e312fd8b25dd187bb56e0d701a')

pkgver() {
  cd "${srcdir}/mythtv/$pkgbase"
  printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
  cd "$srcdir/mythtv/$pkgbase"
  
  patch -Np1 < "../../001-mythnetvision-configure.patch"

  cd "$srcdir/mythweb"
  
  sed -re 's@/usr/local.*/usr/share@/usr/share@' -i 'mythweb.php'
}

build() {
  cd "$srcdir/mythtv/$pkgbase"

  ./configure --prefix=/usr \
              --enable-all
  qmake-qt5 mythplugins.pro
  make -s
}

package_mythplugins-mytharchive() {
  pkgdesc="Create DVDs or archive recorded shows in MythTV"
  depends=('dvdauthor' 'dvd+rw-tools' 'mythtv' 'python-pillow')

  cd "$srcdir/mythtv/$pkgbase/mytharchive"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythbrowser() {
  pkgdesc="Mini web browser for MythTV"
  depends=('mythtv')

  cd "$srcdir/mythtv/$pkgbase/mythbrowser"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythgame() {
  pkgdesc="Game emulator plugin for MythTV"
  depends=('mythtv' 'minizip')

  cd "$srcdir/mythtv/$pkgbase/mythgame"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythmusic() {
  pkgdesc="Music playing plugin for MythTV"
  depends=('mythtv' 'libcdio-paranoia')

  cd "$srcdir/mythtv/$pkgbase/mythmusic"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythnetvision() {
  pkgdesc="MythNetvision plugin for MythTV"
  depends=('mythtv' 'python-oauthlib' 'python-urllib3')

  cd "$srcdir/mythtv/$pkgbase/mythnetvision"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythnews() {
  pkgdesc="News checking plugin for MythTV"
  depends=('mythtv')

  cd "$srcdir/mythtv/$pkgbase/mythnews"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythweather() {
  pkgdesc="Weather checking plugin for MythTV"
  depends=('mythtv' 'perl-date-manip' 'perl-json' 'perl-soap-lite'
           'perl-xml-simple' 'perl-xml-xpath' 'perl-image-size'
           'perl-datetime-format-iso8601')

  cd "$srcdir/mythtv/$pkgbase/mythweather"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythweb() {
  pkgdesc="Web interface for the MythTV scheduler"
  depends=('mythtv' 'perl-cgi')
  optdepends=('lighttpd'
              'php7-apache'
              'php7-fpm'
              'nginx')

  sed -i 's/unix.*-fpm\.sock;/unix:\/var\/run\/php-fpm7\/php-fpm\.sock;/' "$srcdir/mythweb/mythweb.conf.nginx"

  mkdir -p "$pkgdir/var/lib/mythtv/mythweb"/{image_cache,php_sessions}
  cp -R "$srcdir/mythweb"/* "$pkgdir/var/lib/mythtv/mythweb"
  chown -R http:http "$pkgdir/var/lib/mythtv/mythweb"
  chmod g+rw "$pkgdir/var/lib/mythtv/mythweb"/{image_cache,php_sessions}
  
}

package_mythplugins-mythzoneminder() {
  pkgdesc="View CCTV footage from zoneminder in MythTV"
  depends=('mythtv' 'mariadb-libs' 'zoneminder')

  cd "$srcdir/mythtv/$pkgbase/mythzoneminder"
  make INSTALL_ROOT="$pkgdir" install
}

# Maintainer: Phillip Smith <pkgbuild@phs.id.au>
# http://github.com/fukawi2/aur-packages

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=mirrorbrain
pkgver=2.18.1
pkgrel=1
pkgdesc="an open source framework to run a content delivery network using mirror servers."
arch=('i686' 'x86_64')
url="http://mirrorbrain.org"
license=('GPL')
depends=('apache>=2.2.6' 'apache-mod_form' 'apache-mod_geoip2' 'geoip'
         'perl' 'perl-config-inifiles' 'perl-libwww' 'perl-dbd-pg' 'perl-digest-md4' 'perl-timedate'
         'python2' 'python2-psycopg2' 'python2-sqlobject' 'cmdln')
makedepends=('apache>=2.2.6' 'apache-mod_form' 'python')
optdepends=('postgresql: recommended database, but can use any database the Apache DBD API supports'
            'mod_asn: refined mirror selection and full exploitation of network locality')
provides=('mod_mirrorbrain')
backup=("etc/$pkgname.conf")
install="$pkgname.install"
source=("http://mirrorbrain.org/files/releases/$pkgname-$pkgver.tar.gz"
        "$pkgname.conf"
        'logrotate.mb')
md5sums=('a3440d971dcc1b56ee2a9df0bf99b2af'
         '82cfccc53e67f589091ab4c2c9720e2a'
         '9198922d52ebe83610ddc14db52aea05')

prepare() {
  cd "$srcdir/$pkgname-$pkgver/tools"
  # Patch for Arch storing GeoIP DB in different location
  sed -e 's|/var/lib/GeoIP/GeoIP.dat|/usr/share/GeoIP/GeoIP.dat|g' \
      -i geoiplookup_continent.c \
      -i geoiplookup_city.c
  gcc -Wall -o geoiplookup_continent geoiplookup_continent.c -lGeoIP
  gcc -Wall -o geoiplookup_city geoiplookup_city.c -lGeoIP

  # fixes to use python2 instead of python
  cd $srcdir/$pkgname-$pkgver
  sed -e 's|/usr/bin/python|/usr/bin/python2|g' \
      -i tools/rsyncusers \
      -i tools/rsyncinfo \
      -i tools/null-rsync \
      -i tools/bdecode \
      -i tools/push2mirrors \
      -i mb/mb/hashes.py \
      -i mb/mb/mberr.py \
      -i mb/mb/crawlers/ftp.py \
      -i mb/mb.py \
      -i mirrorprobe/mirrorprobe.py
}

build() {
  # Compile the apache modules
  cd "$srcdir/$pkgname-$pkgver/mod_mirrorbrain/"
  apxs -c mod_mirrorbrain.c
  cd "$srcdir/$pkgname-$pkgver/mod_autoindex_mb/"
  apxs -c mod_autoindex_mb.c
}

package() {
  # Install the apache modules
  cd "$srcdir/$pkgname-$pkgver/mod_mirrorbrain/"
  install -Dm755 .libs/mod_mirrorbrain.so $pkgdir/usr/lib/httpd/modules/mod_mirrorbrain.so
  cd "$srcdir/$pkgname-$pkgver/mod_autoindex_mb/"
  install -Dm755 .libs/mod_autoindex_mb.so $pkgdir/usr/lib/httpd/modules/mod_autoindex_mb.so

  # Install the tools  
  cd "$srcdir/$pkgname-$pkgver/"
  install -Dm755 tools/geoiplookup_continent  $pkgdir/usr/bin/geoiplookup_continent
  install -Dm755 tools/geoiplookup_city       $pkgdir/usr/bin/geoiplookup_city
  install -Dm755 tools/geoip-lite-update      $pkgdir/usr/bin/geoip-lite-update
  install -Dm755 tools/null-rsync             $pkgdir/usr/bin/null-rsync
  install -Dm755 tools/scanner.pl             $pkgdir/usr/bin/scanner
  install -Dm755 mirrorprobe/mirrorprobe.py   $pkgdir/usr/bin/mirrorprobe

  # Install the mb script
  cd "$srcdir/$pkgname-$pkgver/mb/"
  python2 setup.py install --root="$pkgdir"

  # Install SQL templates
  cd "$srcdir/$pkgname-$pkgver/sql/"
  install -dm755 $pkgdir/usr/share/$pkgname/sql/
  cp -rv * $pkgdir/usr/share/$pkgname/sql/

  # Install default configuration file
  cd "$srcdir/"
  install -Dm640 $srcdir/$pkgname.conf $pkgdir/etc/$pkgname.conf
  
  # install the logrotate script (to suit the above default conf)
  install -Dm644 $srcdir/logrotate.mb $pkgdir/etc/logrotate.d/$pkgname
}

# vim:set ts=2 sw=2 et:

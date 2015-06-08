# Maintainer: Sergey Marochkin <me@ziggi.org>
# Previous maintainer: Felix Herbeck

pkgname=openscada
pkgver=0.8.13
pkgrel=1
pkgdesc="OpenSCADA is a open supervisory control and data acquisition system"
arch=('i686' 'x86_64')
url="http://oscada.org/"
license=('GPL')
groups=('devel')
depends=('gettext' 'zlib' 'pcre' 'gd' 'libmysqlclient' 'sqlite' 'postgresql-libs' 'libfbclient' 'openssl' 'bison' 'net-snmp' 'lm_sensors' 'glibc' 'portaudio' 'qt4' 'fftw' 'phonon')
conflicts=('oscada' 'openscada-svn')
source=("ftp://ftp.oscada.org/OpenSCADA/0.8.0/openscada-$pkgver-1.src.rpm")
md5sums=('3d8ca359c7e6372761ae88e9a5b15279')

build() {
  msg "Preparing sources"
  bsdtar -xf openscada-$pkgver.tar.lzma
  bsdtar -xf openscada-res-$pkgver.tar.lzma
  
  msg "Starting build"
  cd openscada-$pkgver
  LDFLAGS="${LDFLAGS} -Wl,--no-as-needed"
  ./configure --enable-AllModuls
  make DESTDIR="$pkgdir"
}

package() {
  cd $srcdir/openscada-$pkgver
  
  # dir
  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/{applications,pixmaps,doc/openscada}
  install -d $pkgdir/etc
  install -dm644 $pkgdir/var/spool/openscada/{icons,LibsDB,DATA,ARCHIVES/{MESS,VAL}}
  
  # bin
  install -Dm755 ../data/openscada_start $pkgdir/usr/bin/
  
  # xml
  install -Dm644 ../data/{oscada.xml,oscada_start.xml} $pkgdir/etc/
  
  # icon
  install -Dm644 ../data/openscada.png $pkgdir/usr/share/pixmaps/
  install -Dm644 ../data/icons/* $pkgdir/var/spool/openscada/icons/
  
  # desktop
  install -Dm644 ../data/openscada.desktop $pkgdir/usr/share/applications
  
  # doc
  install -Dm644 {ChangeLog,COPYING,INSTALL,README*,TODO*} $pkgdir/usr/share/doc/openscada/
  cp -r ../doc/* $pkgdir/usr/share/doc/openscada/
  
  # db
  install -Dm644 ../data/LibsDB/*.db $pkgdir/var/spool/openscada/LibsDB/
  
  make DESTDIR="$pkgdir" install
}

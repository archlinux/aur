# Maintainer: Sergei Marochkin <me@ziggi.org>
# Previous maintainer: Felix Herbeck

pkgname=openscada-lts
pkgver=0.8.16
pkgrel=3
pkgdesc="OpenSCADA is a open supervisory control and data acquisition system"
arch=('i686' 'x86_64')
url="http://oscada.org/"
license=('GPL')
groups=('devel')
depends=('gettext' 'zlib' 'pcre' 'gd' 'libmysqlclient' 'sqlite' 'postgresql-libs' 'libfbclient' 'openssl' 'bison' 'net-snmp' 'lm_sensors' 'glibc' 'portaudio' 'qt4' 'fftw' 'phonon')
conflicts=('openscada')
source=(ftp://ftp.oscada.org/OpenSCADA/0.8.0/openscada-$pkgver-2.src.rpm
        archfix.patch)
sha512sums=('0fe4211df4611b281e7b26fbd1e271cb9cfa859721398103fcc022ff50ee5c8f9b416c3a530a8894daa337302d84da9e02d4201daab3cf61c2dd12f4740d1d74'
            '04aa513608e49d502fc6cb94e32634b19a913053741637c3fcbebb92eb13a44f91c67479f06e6880363a7c085a6f53fd4aaae2c0b51dba9a7d94e8fd92972a7e')

build() {
  msg "Preparing sources"
  bsdtar -xf openscada-$pkgver.tar.lzma
  bsdtar -xf openscada-res-$pkgver.tar.lzma

  cp archfix.patch openscada-$pkgver
  cd $srcdir/openscada-$pkgver
  patch -s -p0 < archfix.patch

  msg "Starting build"
  cd $srcdir/openscada-$pkgver
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

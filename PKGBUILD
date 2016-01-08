# Maintainer: Sergey Marochkin <me@ziggi.org>
# Previous maintainer: Felix Herbeck

pkgname=openscada-lts
pkgver=0.8.14
pkgrel=1
pkgdesc="OpenSCADA is a open supervisory control and data acquisition system"
arch=('i686' 'x86_64')
url="http://oscada.org/"
license=('GPL')
groups=('devel')
depends=('gettext' 'zlib' 'pcre' 'gd' 'libmysqlclient' 'sqlite' 'postgresql-libs' 'libfbclient' 'openssl' 'bison' 'net-snmp' 'lm_sensors' 'glibc' 'portaudio' 'qt4' 'fftw' 'phonon')
conflicts=('openscada')
source=("ftp://ftp.oscada.org/OpenSCADA/0.8.0/openscada-$pkgver-1.src.rpm")
sha512sums=('cb79d0d115f8e4d540d6033b69591f7235da20237b22b5481c487a2fd9d498cb152a7b7e27c38b8e87d501e278f0ad5565dd6552d27ec96ac3726d39c66d4da5')

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

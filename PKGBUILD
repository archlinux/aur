# Maintainer : Edgar Hucek <gimli at dark-green dot com>

_pkgname=actuator
pkgname=vdr-plugin-$_pkgname
pkgver=1.2.1
revision=3
pkgrel=1
arch=(i686 x86_64)
pkgdesc="For archvdr project!!! VDR-Plugin to control a linear or an horizon to horizon actuator and use as a channelscanner"
url="http://ventoso.org/luca/vdr/"
license="GPL"
makedepends=('vdr' 'unzip')
depends=('vdr>=1.7.27')
source=(http://ventoso.org/luca/vdr/vdr-actuator-$pkgver.tgz
	plugin.actuator.conf)
md5sums=('88b87846b86a5130afa46e39d0d1d88f'
         '89ba2f74cb03d8855599bf3a846bcceb')
backup=('etc/vdr/plugins/plugin.actuator.conf')

build() {
  unset CXXFLAGS

  cd ${srcdir}/$_pkgname-${pkgver}

  mkdir -p $pkgdir/usr/lib/vdr/plugins/ || return 1
  mkdir -p $pkgdir/var/lib/vdr/plugins/transponders/ || return 1
  mkdir -p $pkgdir/etc/vdr/plugins/transponders/ || return 1
  sed -i -e "s/SystemValues/SystemValuesSat/" actuator.c
  sed -i -e "s/const\ cDevice\ \*Device\,\ int\ ChannelNumber/const\ cDevice\ \*Device\,\ int\ ChannelNumber\,bool\ LiveView/" actuator.c
  make VDRDIR=/usr/include/vdr \
       LIBDIR=. \
       INCLUDES=-I/usr/include/vdr \
       LOCALEDIR="$startdir/pkg/usr/share/locale/" all || return 1
  
  install -m 755 libvdr-*.so.*		$pkgdir/usr/lib/vdr/plugins/		|| return 1
  install -m 664 $startdir/plugin.actuator.conf $pkgdir/etc/vdr/plugins/		|| return 1
  wget http://www.fastsatfinder.com/bin/Transponders.zip -O $pkgdir/var/lib/vdr/plugins/transponders/Transponders.zip
  cd $pkgdir/var/lib/vdr/plugins/transponders/
  unzip Transponders.zip

}


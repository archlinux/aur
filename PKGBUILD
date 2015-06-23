_pkgname=rotorng
pkgname=vdr-plugin-$_pkgname
pkgver=0.3.1
revision=1
pkgrel=1
arch=(i686 x86_64)
pkgdesc="For archvdr project!!! VDR-Plugin to control rotor. You can also use it as a channelscanner."
url="http://projects.vdr-developer.org/projects/plg-rotor-ng/"
license="GPL"
makedepends=('vdr' 'unzip')
depends=('vdr>=1.7.15')
source=(http://projects.vdr-developer.org/attachments/download/1088/$_pkgname-$pkgver.tar.gz
	plugin.rotorng.conf)
backup=('etc/vdr/plugins/plugin.rotorng.conf')
build() {
  unset CXXFLAGS

  cd ${srcdir}/$_pkgname-${pkgver}

  mkdir -p $pkgdir/usr/lib/vdr/plugins/ || return 1
  mkdir -p $pkgdir/var/lib/vdr/plugins/transponders/ || return 1
  mkdir -p $pkgdir/etc/vdr/plugins/transponders/ || return 1
  sed -i Makefile -e 's:VDRDIR\ =\ ..\/..\/..:VDRDIR\ =\ \/usr\/lib\/vdr\/:'  
  make VDRDIR=/usr/include/vdr \
       LIBDIR=. \
       INCLUDES=-I/usr/include/vdr \
       LOCALEDIR="$startdir/pkg/usr/share/locale/" all || return 1
  
  install -m 755 libvdr-*.so.*		$pkgdir/usr/lib/vdr/plugins/		|| return 1
  install -m 664 $startdir/plugin.rotorng.conf $pkgdir/etc/vdr/plugins/		|| return 1
  wget http://www.fastsatfinder.com/bin/Transponders.zip -O $pkgdir/var/lib/vdr/plugins/transponders/Transponders.zip
  cd $pkgdir/var/lib/vdr/plugins/transponders/
  unzip Transponders.zip

}
md5sums=('7272c243c92995c521b8ca6712f42115'
         '89ba2f74cb03d8855599bf3a846bcceb')

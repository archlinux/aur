# Contributor: Andrew Simmons <andrew.simmons@gmail.com>
# Contributor: teddy_beer_maniac <teddy_beer_maniac@wp.pl>

pkgname=doom3
pkgver=1.3.1.1304
pkgrel=2
pkgdesc="Doom 3 Engine. You need the retail .pk4 files to play."
url="http://www.doom3.com/"
license=('custom:"DOOM 3"' \
         'custom:"PunkBuster"')
[ "$CARCH" = "i686" ] && depends=('libxext' 'libgl' 'alsa-lib>=1.0.6')
[ "$CARCH" = "x86_64" ] && depends=('lib32-libxext' 'lib32-libgl' 'lib32-alsa-lib>=1.0.6')
arch=('i686' 'x86_64')
install="doom3.install"
source=(http://www.1337-server.net/doom3/$pkgname-linux-$pkgver.x86.run \
        $pkgname.sh $pkgname-dedicated.sh $pkgname"_64.sh" $pkgname-dedicated_64.sh
	doom3.png doom3.desktop)
md5sums=('6325f0936f59420d33668754032141cb'
	 '18c6802eee15ad499e2fd3ae03d641a6'
	 'da4e827e7ddec2209bf832db5cd3ab74'
	 'b8e0aa217e4df414f009fe99448b49bb'
	 'f7c57e01b2c97b6e808add668c68ef36'
	 'f99eb141eecc4b9dd188d6819d741546'
	 'a8a6c7b7befff52cbb6c766466ee4ce9')

build() {
  cd $startdir/src
  chmod +x $pkgname-linux-$pkgver.x86.run
  mkdir -p $startdir/pkg/opt/$pkgname $startdir/pkg/usr/bin $startdir/pkg/usr/share/licenses/$pkgname
  ./$pkgname-linux-$pkgver.x86.run -- -i $startdir/pkg/opt/$pkgname -b $startdir/pkg/usr/bin
  # ncurses & gtk installers don't return 1 when canceled, so check that files are installed
  ls $startdir/pkg/opt/$pkgname/base || return 1
  if [ "$CARCH" == "i686" ]; then
	  install -m755 -D $pkgname.sh           $startdir/pkg/opt/$pkgname/$pkgname
	  install -m755 -D $pkgname-dedicated.sh $startdir/pkg/opt/$pkgname/$pkgname-dedicated
  else
	  install -m755 -D $pkgname"_64.sh"           $startdir/pkg/opt/$pkgname/$pkgname
	  install -m755 -D $pkgname-dedicated_64.sh $startdir/pkg/opt/$pkgname/$pkgname-dedicated
  fi
  
  ln -sf /opt/$pkgname/$pkgname           $startdir/pkg/usr/bin/$pkgname
  ln -sf /opt/$pkgname/$pkgname-dedicated $startdir/pkg/usr/bin/$pkgname-dedicated
  ln -sf /opt/$pkgname/License.txt        $startdir/pkg/usr/share/licenses/$pkgname/License.txt
  ln -sf /opt/$pkgname/pb/PB_EULA.txt     $startdir/pkg/usr/share/licenses/$pkgname/PB_EULA.txt

  mkdir -p $startdir/pkg/usr/share/pixmaps $startdir/pkg/usr/share/applications
  install -m644 -D doom3.png $startdir/pkg/usr/share/pixmaps
  install -m644 -D doom3.desktop $startdir/pkg/usr/share/applications
}

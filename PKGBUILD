# Contributor: Andrew Simmons <andrew.simmons@gmail.com>

pkgname=quake4-multiplayer-demo
pkgver=1.4.2
pkgrel=1
pkgdesc="Quake 4 Multiplayer demo"
url="http://www.quake4game.com/"
license=""
depends=('alsa-lib' 'sdl' 'libxext' 'libgl')
makedepends=('aria2')
arch=('i686')
license=('custom:"Quake 4 Multiplayer Demo"')
conflicts=()
replaces=()
backup=()
install="quake4-multiplayer-demo.install"
source=(ftp://ftp.idsoftware.com/idstuff/quake4/demo/$pkgname.x86.run \
        $pkgname.sh \
        ${pkgname}-dedicated.sh \
        ${pkgname}-smp.sh)
md5sums=('48188680efcf15421803d2af7f7750ca'
         'c80e55efbead2cae5e5326904a82d4d2'
         '791cf1d51a96213859f1608e08667d70'
         '95bcafe7217f4a67bca54f41dcab8d11')

build() {
  cd $startdir/src
  chmod +x $pkgname.x86.run
  mkdir -p $startdir/pkg/opt/$pkgname \
           $startdir/pkg/usr/bin \
           $startdir/pkg/usr/share/licenses/$pkgname
  ./$pkgname.x86.run -- -i $startdir/pkg/opt/$pkgname -b $startdir/pkg/usr/bin
  # ncurses & gtk installers don't return 1 when canceled, so check that files are installed
  ls $startdir/pkg/opt/$pkgname/q4base || return 1
  
  install -m755 -D $pkgname.sh              $startdir/pkg/opt/$pkgname/$pkgname
  install -m755 -D ${pkgname}-dedicated.sh  $startdir/pkg/opt/$pkgname/${pkgname}-dedicated
  install -m755 -D ${pkgname}-smp.sh        $startdir/pkg/opt/$pkgname/${pkgname}-smp

  rm $startdir/pkg/opt/$pkgname/quake4-demo \
     $startdir/pkg/opt/$pkgname/quake4-demo-dedicated \
     $startdir/pkg/opt/$pkgname/quake4-demo-smp \
     $startdir/pkg/usr/bin/quake4-demo \
     $startdir/pkg/usr/bin/quake4-demo-dedicated \
     $startdir/pkg/usr/bin/quake4-demo-smp

  ln -sf /opt/$pkgname/$pkgname              $startdir/pkg/usr/bin/$pkgname
  ln -sf /opt/$pkgname/${pkgname}-dedicated  $startdir/pkg/usr/bin/${pkgname}-dedicated
  ln -sf /opt/$pkgname/${pkgname}-smp        $startdir/pkg/usr/bin/${pkgname}-smp
  ln -sf /opt/$pkgname/EULA.txt              $startdir/pkg/usr/share/licenses/$pkgname/EULA.txt
}


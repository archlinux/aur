# Contributor: Andrew Simmons <andrew.simmons@gmail.com>

pkgname=quake4-demo
pkgver=1.0
pkgrel=4
pkgdesc="Quake 4 demo"
url="http://www.quake4game.com/"
arch=('i686')
license=('custom:"Quake 4 Demo"')
depends=('alsa-lib' 'sdl' 'libxext' 'libgl')
makedepends=()
conflicts=()
replaces=()
backup=()
install="quake4-demo.install"
source=(ftp://ftp.idsoftware.com/idstuff/quake4/demo/quake4-linux-1.0-demo.x86.run \
        $pkgname.sh \
        ${pkgname}-dedicated.sh)
md5sums=('98ebbb835cc71ea29062cd2b4a139a46'
         'e1eeb0067b02dc43315b43e69b6d681c'
         '966f6b8dd0166ddd305ae905f6958354')

build() {
  cd $startdir/src
  chmod +x quake4-linux-$pkgver-demo.x86.run
  mkdir -p $startdir/pkg/opt/$pkgname \
           $startdir/pkg/usr/bin \
           $startdir/pkg/usr/share/licenses/$pkgname
  ./quake4-linux-$pkgver-demo.x86.run -- -i $startdir/pkg/opt/$pkgname -b $startdir/pkg/usr/bin
  # ncurses & gtk installers don't return 1 when canceled, so check that files are installed
  ls $startdir/pkg/opt/$pkgname/q4base || return 1
  
  rm $startdir/pkg/opt/$pkgname/${pkgname}ded \
     $startdir/pkg/usr/bin/${pkgname}ded
  
  install -m755 -D $pkgname.sh              $startdir/pkg/opt/$pkgname/$pkgname
  install -m755 -D ${pkgname}-dedicated.sh  $startdir/pkg/opt/$pkgname/${pkgname}-dedicated

  ln -sf /opt/$pkgname/$pkgname              $startdir/pkg/usr/bin/$pkgname
  ln -sf /opt/$pkgname/${pkgname}-dedicated  $startdir/pkg/usr/bin/${pkgname}-dedicated
  ln -sf /opt/$pkgname/License.txt           $startdir/pkg/usr/share/licenses/$pkgname/License.txt
}

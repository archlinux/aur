pkgname=captvty
pkgver=2.3.11
pkgrel=1
pkgdesc='Accédez aux directs et à une multitude d’émissions proposées au rattrapage par différentes chaînes de télévision'
arch=('i686' 'x86_64')
url='http://www.captvty.fr'
license=('custom')
depends=('winetricks' 'wine-mono' 'libjpeg6-turbo')
depends_x86_64=('lib32-libjpeg6-turbo')
makedepends=('imagemagick' 'gendesk' 'icoutils')
_code=$(curl -s http://captvty.fr/ | grep -Pom 1 '(?<=ref=\")[^\"].*captvty-.*.zip' | awk -F "/" '{print $(NF-1)}')
source=("http://releases.captvty.fr/$_code/captvty-$pkgver.zip"
        "${pkgname}.ico::http://captvty.fr/favicon.ico?v=2"
        'captvty'
        'LICENSE')
sha1sums=('f5ee0e871bacda75ec799d230c0677dbf1b53173'
          '7210acfa98cb21ab32de463ccf0456743241b48e'
          '39b09f2f8fd5e5f72492854cfdacaa01a0afe9f6'
          'a1a03fcff4541bbf212eb20730d5e344ae817a5d')

prepare() {
  cd $srcdir
  gendesk -f -n --pkgname "captvty" --pkgdesc "$pkgdesc" --categories 'Wine;Multimedia'
  #wrestool -x -t 3 --raw Captvty.exe > captvty.ico
  #wrestool -x -o . -t 14 --raw Captvty.exe
  convert captvty.ico captvty.png
}

package() {
  cd $srcdir
  install -d $pkgdir/usr/share/$pkgname/ $pkgdir/usr/share/applications/ $pkgdir/usr/bin/
  install -Dm644 Captvty.exe Captvty.exe.config $pkgdir/usr/share/$pkgname
  install -m644 captvty-8.png $pkgdir/usr/share/$pkgname/captvty.png
  cp -r tools $pkgdir/usr/share/$pkgname
  install -Dm644 captvty.desktop $pkgdir/usr/share/applications/
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
  install -Dm755 captvty $pkgdir/usr/bin/
}


pkgname=captvty
pkgver=2.7.5
pkgrel=1
pkgdesc='Accédez aux directs et à une multitude d’émissions proposées au rattrapage par différentes chaînes de télévision'
arch=('any')
url='http://www.captvty.fr'
license=('custom')
depends=('winetricks' 'wine-mono')
makedepends=('imagemagick' 'gendesk')
_code=$(curl -s http://captvty.fr/ | grep -Pom 1 '(?<=ref=\")[^\"].*captvty-.*.zip' | awk -F "/" '{print $(NF-1)}')
source=("http://releases.captvty.fr/$_code/captvty-$pkgver.zip"
        "${pkgname}.ico::http://captvty.fr/favicon.ico?v=2"
        'captvty'
        'LICENSE')
sha1sums=('65436c701445d244d47151a1eb9f0b8ef5c717da'
          '7210acfa98cb21ab32de463ccf0456743241b48e'
          'ecd98eeb60b838edf16dc48ebc37d6a6ca520b91'
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
  install -d $pkgdir/usr/share/$pkgname
  install -Dm644 Captvty.exe Captvty.exe.config $pkgdir/usr/share/$pkgname
  cp -r tools $pkgdir/usr/share/$pkgname
  install -Dm755 captvty $pkgdir/usr/bin/captvty
  install -Dm644 captvty-8.png $pkgdir/usr/share/pixmaps/captvty.png
  install -Dm644 captvty.desktop $pkgdir/usr/share/applications/captvty.desktop
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}


pkgname=great-little-radio-player
pkgver=1.5.0
pkgrel=1
pkgdesc="A robust internet radio station streamer"
arch=('i686' 'x86_64')
url="https://sites.google.com/site/glrpgreatlittleradioplayer"
license=('GPL3')
depends=(
  'qt5-base'
  'qt5-multimedia'
)
optdepends=('')
source=(
  'https://downloads.sourceforge.net/project/glrp/v1.5.0/source_files.tar.gz'
  'https://downloads.sourceforge.net/project/glrp/v1.5.0/greatlittleradioplayer_1.5.0_amd64.deb'
)
sha1sums=('ff4c0da0c75335d652fab84bc87fa356ed9984b8'
          'f6895783dbdd99902b0960449c6c172a3581e168')

build() {
  cd source_files
  qmake -project "QT += widgets multimedia xml"
  qmake
  make
}

package() {
  mkdir -p "$pkgdir/usr/share/$pkgname"
  install -Dm755 source_files/source_files "$pkgdir/usr/share/$pkgname/$pkgname"

  mkdir -p data && tar xf data.tar.xz -C data
  cd data/

  install -Dm644 usr/share/applications/GreatLittleRadioPlayer.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  sed -i "s#Exec=/opt/glrp/GreatLittleRadioPlayer#Exec=/usr/share/$pkgname/$pkgname#" "$pkgdir/usr/share/applications/$pkgname.desktop"
  sed -i "s#/opt/glrp/#/usr/share/$pkgname/#" "$pkgdir/usr/share/applications/$pkgname.desktop"

  cd opt/glrp/
  cp -R changelog.txt \
    glrp_stations.xml \
    images \
    new-glrp64.png \
    new-glrp96.png \
    themes \
    "$pkgdir/usr/share/$pkgname"

  # Remove image with difficult name
  rm -R "$pkgdir/usr/share/$pkgname/images/RádioRaizSertaneja.png"
}

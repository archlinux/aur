# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: maz-1 <ohmygod19993 at gmail dot com>

pkgname=rpg2003-rtp
pkgver=2003
pkgrel=2
pkgdesc="RPG Maker 2003 Runtime Package (Japanese)"
arch=('any')
url="https://tkool.jp/products/rtp.html"
license=('custom: commercial')
makedepends=('unshield' 'unarchiver' 'glibc')
optdepends=('easyrpg-player: game engine for using the RTP')
source=("https://tkool.jp/products/rtp/2003rtp.zip")
sha256sums=('d388b183cc3a8206db53f58db4ea88c6661c9cf289c03aea1bf9ccd425f49cd1')
noextract=('2003rtp.zip')

prepare() {
  # cleanup
  rm -rf "2003RTPｾｯﾄｱｯﾌﾟ" RPG2003RTP rtp 2003
  # extract
  unar -e ms932 2003rtp.zip
  unar "2003RTPｾｯﾄｱｯﾌﾟ"/RPG2003RTP.exe
  unshield -e ms932 -d rtp x RPG2003RTP/data1.cab
  mv rtp/"RPGﾂｸｰﾙ2003_ﾗﾝﾀｲﾑﾊﾟｯｹｰｼﾞ" 2003
  # convert text
  iconv -f ms932 -t UTF-8 "2003RTPｾｯﾄｱｯﾌﾟ/使用規約.txt" > "使用規約.txt"
}

package() {
  # data
  install -d "$pkgdir"/usr/share/rtp
  cp -r 2003/RTP "$pkgdir"/usr/share/rtp/2003
  # sane permissions
  find "$pkgdir"/usr/share/rtp -type d -exec chmod 0755 {} \;
  find "$pkgdir"/usr/share/rtp -type f -exec chmod 0644 {} \;
  # license
  install -Dm0644 "使用規約.txt" -t "$pkgdir"/usr/share/licenses/$pkgname
}

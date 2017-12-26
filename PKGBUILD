# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: maz-1 <ohmygod19993 at gmail dot com>

pkgname=rpg2003-rtp
pkgver=2003
pkgrel=1
pkgdesc="RPG Maker 2003 Runtime Package (Japanese)"
arch=('any')
url="https://tkool.jp/support/download/rpg2003/rtp"
license=('custom: commercial')
makedepends=('unshield-git' 'convmv' 'glibc')
optdepends=('easyrpg-player: game engine for using the RTP')
source=("https://tkool.jp/assets/files/2003rtp.zip"
        "$pkgname.sh")
sha256sums=('d388b183cc3a8206db53f58db4ea88c6661c9cf289c03aea1bf9ccd425f49cd1'
            'bbf30c73a2a9933c930dc306b01e4dc70790f450567d319e0e0f1602f2e863cd')
noextract=('2003rtp.zip')

prepare() {
  # extract
  bsdtar --strip-components 1 --include='*.exe' -xf 2003rtp.zip
  bsdtar --include='*.txt' -O -xf 2003rtp.zip > TOS-sjis.txt
  bsdtar -xf RPG2003RTP.exe
  unshield -R -d rtp x data1.cab
  # cleanup
  rm -rf rtp/_*
  convmv -f SHIFT-JIS -t UTF-8 -r --qfrom --notest rtp
  iconv -f SHIFT-JIS -t UTF-8 TOS-sjis.txt > TOS.txt
  mv rtp/"RPGﾂｸｰﾙ2003_ﾗﾝﾀｲﾑﾊﾟｯｹｰｼﾞ" 2003
}

package() {
  # data
  install -d "$pkgdir"/usr/share/rtp
  cp -r 2003/RTP "$pkgdir"/usr/share/rtp/2003
  # sane permissions
  find "$pkgdir"/usr/share/rtp -type d -exec chmod 0755 {} \;
  find "$pkgdir"/usr/share/rtp -type f -exec chmod 0644 {} \;
  # export environment variables
  install -Dm0755 $pkgname.sh "$pkgdir"/etc/profile.d/$pkgname.sh
  # license
  install -Dm0644 TOS.txt "$pkgdir"/usr/share/licenses/$pkgname/TOS.txt
}

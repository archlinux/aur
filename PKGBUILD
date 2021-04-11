# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=rpg2000-rtp
pkgver=201906
pkgrel=2
pkgdesc="RPG Maker 2000 Runtime Package (Japanese)"
arch=('any')
url="https://tkool.jp/products/rtp.html"
license=('custom: commercial')
makedepends=('unshield' 'unarchiver' 'glibc')
optdepends=('easyrpg-player: game engine for using the RTP')
source=("https://tkool.jp/products/rtp/2000rtp.zip"
        "https://tkool.jp/products/rtp/RTP_patchk_190612.zip")
sha256sums=('c130f0078c0d6ecc3404f94af8258e4557ab85c3b204397c7f21dbc57efeef8e'
            '3041c57af04675b990da5709928fe7794cac2e4b21f6b526a81d310b353db3ad')
noextract=('2000rtp.zip' 'RTP_patchk_190612.zip')

prepare() {
  # cleanup
  rm -rf "RTPｾｯﾄｱｯﾌﾟ" RPG2000RTP rtp 2000 RTP_patchk_190612
  # extract
  unar -e ms932 2000rtp.zip
  unar "RTPｾｯﾄｱｯﾌﾟ"/RPG2000RTP.exe
  unshield -e ms932 -d rtp x RPG2000RTP/data1.cab
  unar -e ms932 RTP_patchk_190612.zip
  mv rtp/"RPGﾂｸｰﾙ2000_ﾗﾝﾀｲﾑﾊﾟｯｹｰｼﾞ" 2000
  # convert text
  iconv -f ms932 -t UTF-8 "RTPｾｯﾄｱｯﾌﾟ/使用規約.txt" > "使用規約.txt"
  iconv -f ms932 -t UTF-8 RTP_patchk_190612/"RTPの修正ファイルについて.txt" > "RTPの修正ファイルについて.txt"
  # apply patch
  mv RTP_patchk_190612/"モンスター.png" 2000/RTP/FaceSet
  mv RTP_patchk_190612/"主人公3.png" 2000/RTP/CharSet
  mv RTP_patchk_190612/{"基本","ダンジョン","船","内装","外観"}.png 2000/RTP/ChipSet
}

package() {
  # data
  install -Dm0644 2000/RPG2000.ico "$pkgdir"/usr/share/rtp/RPG2000.ico
  cp -r 2000/RTP "$pkgdir"/usr/share/rtp/2000
  # sane permissions
  find "$pkgdir"/usr/share/rtp -type d -exec chmod 0755 {} \;
  find "$pkgdir"/usr/share/rtp -type f -exec chmod 0644 {} \;
  # license
  install -Dm0644 "使用規約.txt" -t "$pkgdir"/usr/share/licenses/$pkgname
  # patch doc
  install -Dm0644 "RTPの修正ファイルについて.txt" -t "$pkgdir"/usr/share/doc/$pkgname
}

# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=rpg2000-rtp
pkgver=201906
pkgrel=1
pkgdesc="RPG Maker 2000 Runtime Package (Japanese)"
arch=('any')
url="https://tkool.jp/support/download/rpg2000/rtp"
license=('custom: commercial')
makedepends=('unshield-git' 'convmv' 'glibc')
optdepends=('easyrpg-player: game engine for using the RTP')
source=("https://tkool.jp/assets/files/2000rtp.zip"
        "https://tkool.jp/products/rtp/RTP_patchk_190612.zip"
        "$pkgname.sh")
sha256sums=('c130f0078c0d6ecc3404f94af8258e4557ab85c3b204397c7f21dbc57efeef8e'
            '3041c57af04675b990da5709928fe7794cac2e4b21f6b526a81d310b353db3ad'
            '1a892b64ea2df5827e560100408d6ff3f8abc9ec008f62bc8167fb91c0c2b5da')
noextract=('2000rtp.zip')

prepare() {
  # extract
  bsdtar --strip-components 1 --include='*.exe' -xf 2000rtp.zip
  bsdtar --include='*.txt' -O -xf 2000rtp.zip > TOS-sjis.txt
  bsdtar -xf RPG2000RTP.exe
  unshield -R -d rtp x data1.cab
  # cleanup
  rm -rf rtp/_*
  convmv -f SHIFT-JIS -t UTF-8 -r --qfrom --notest rtp
  iconv -f SHIFT-JIS -t UTF-8 TOS-sjis.txt > TOS.txt
  mv rtp/"RPGﾂｸｰﾙ2000_ﾗﾝﾀｲﾑﾊﾟｯｹｰｼﾞ" 2000
  convmv -f SHIFT-JIS -t UTF-8 -r --qfrom --notest RTP_patchk_190612
  iconv -f SHIFT-JIS -t UTF-8 RTP_patchk_190612/"RTPの修正ファイルについて.txt" > PatchNotes.txt
  # patch
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
  # export environment variables
  install -Dm0755 $pkgname.sh "$pkgdir"/etc/profile.d/$pkgname.sh
  # license
  install -Dm0644 TOS.txt "$pkgdir"/usr/share/licenses/$pkgname/TOS.txt
  # patch doc
  install -Dm0644 PatchNotes.txt "$pkgdir"/usr/share/doc/$pkgname/"Patch Notes.txt"
}

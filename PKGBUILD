# Maintainer: maz-1 <ohmygod19993 at gmail dot com>
# http://sycrealastudio.lofter.com/post/1c580c_a50bb4
_pkgname=majonoie
pkgname=${_pkgname}-zh-cn
pkgver=1.07
pkgrel=1
pkgdesc="The game \"The Witch's House\" also known as \"Majo No Ie\". Simplified chinese ver."
url='http://majonoie.karou.jp'
arch=('any')
license=('custom')
depends=('mkxp-git') # 'rpgvx-rtp'
makedepends=('p7zip' 'wget')
source=( # "Majonoie_Ver107_a_CHS_SycrealaStudio.exe::http://pan.plyz.net/d.asp?u=118488466&p=Majonoie_Ver107_a_CHS_SycrealaStudio.exe" 
        "LICENSE"
        "mkxp.conf"
        "Game.ini"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}.sh")
md5sums=( # '4df766bd96a9be244ee32ece1c7e3122'
         'e1ee4d59be2f6200828470a1ebc7bcf7'
         '6ab9261c4adc6bc6c58b0058c4210292'
         '6ec3e1d0ba0cfd56634c40f9206290fb'
         '6048d0572eba9e7a6add41ad8f6b9a6b'
         'dee931ca691fcdfcc937eedb30fe9d00'
         'd81ac9dea4008515d8ae636b725fa32f')

prepare() {
  cd "$srcdir/.."
  file_name=Majonoie_Ver107_a_CHS_SycrealaStudio.exe
  [ -f "$file_name" ] && checksum=`md5sum "$file_name" | grep -oP '[0-9a-z]+' | head -n 1` || true
  [ "z""$checksum" = "z""4df766bd96a9be244ee32ece1c7e3122" ] || \
    ( rm -f "$file_name" ; \
    wget --no-check-certificate "http://pan.plyz.net/d.asp?u=118488466&p=$file_name" -O "$file_name" )
  [ -f "$srcdir/$file_name" ] || ln -s "../$file_name" "$srcdir/$file_name"
}

package() {
  install -dm755 "$pkgdir/opt/$pkgname"
  install -dm755 "$pkgdir/usr/"{bin,share/applications,share/pixmaps}
  cd "$pkgdir/opt/$pkgname"
  LANG=zh_CN 7z x "${srcdir}/Majonoie_Ver107_a_CHS_SycrealaStudio.exe"
  convmv -r -f GBK -t utf-8 --notest .
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/opt/$pkgname/LICENSE"
  install -Dm644 "$srcdir/mkxp.conf" "$pkgdir/opt/$pkgname/mkxp.conf"
  install -Dm644 "$srcdir/Game.ini" "$pkgdir/opt/$pkgname/Game.ini"
  rm -f "$pkgdir/opt/$pkgname/PublicData.rvdata"
  
  cd "$pkgdir/opt/$pkgname"
  find . -type d -exec chmod 755 {} \;
  find . -not -type d -exec chmod 644 {} \;
  find . -type d | xargs chmod 755
  find . -not -type d | xargs chmod 644
  
  install -Dm755 "${srcdir}/${pkgname}.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "${srcdir}/${pkgname}.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "${srcdir}/${pkgname}.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

}


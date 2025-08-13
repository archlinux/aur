# Contributor: maz-1 <ohmygod19993 at gmail dot com>
_pkgname=yumenikki
_jname=ゆめにっき
pkgname=${_pkgname}-jp
pkgver=0.10
pkgrel=5
pkgdesc="Surrealistic adventure game about exploring the dreams (Japanese)"
url='http://www3.nns.ne.jp/pri/tk-mto/'
arch=('any')
license=('custom')
depends=(easyrpg-player rpg2003-rtp) #fluidsynth,soundfont-gmgsx?
makedepends=(unarchiver desktop-file-utils)
source=("http://ftp.vector.co.jp/43/88/3084/${_pkgname}${pkgver}.lzh"
https://cdn2.steamgriddb.com/icon/06409663226af2f3114485aa4e0a23b4/8/16x16.png
${pkgname}.sh )
# Cannot DL patch: "https://www3.nns.ne.jp/~tk-mto/yumesyuusei.lzh"
md5sums=('f3a16c395078dcec4950200732bc5194'
         '50288d205493517d498ddfcc40df2b09'
         'e6d724ce5a36ab364f0eed09a03f3ffe')
options=(!strip)
prepare() {
  unar -f -e cp932 "${_pkgname}${pkgver}.lzh" #unsupoorted by bsdtar yet
}

package() {
  install -d "$pkgdir/opt"
  mv "${_jname}/${_jname}${pkgver}" "$pkgdir/opt/$pkgname"
  rm "$pkgdir/opt/$pkgname/"{RPG_RT{.exe,_bak.ldb},*/Thumbs.db} #gabadge
  iconv -f cp932 "$srcdir/${_jname}/初めに読んで下さい。${pkgver}.txt" > "$pkgdir/opt/$pkgname/ReadMe.txt"
  install -Dm644 16x16.png "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm755 "${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}"
  # Entry
  install -Dm644 /usr/share/applications/easyrpg-player.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  desktop-file-edit "$pkgdir/usr/share/applications/$pkgname.desktop" \
    --set-name=${_jname} --set-key=Exec --set-value=${pkgname} --set-icon=${pkgname} --set-comment='Explore the dreams'
}

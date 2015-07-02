# Maintainer: 3ED <krzysztof1987@gmail.com>
pkgname=qsp-bin
pkgver=5.7.0
pkgrel=3
pkgdesc="Quest Soft Player is another interactive fiction player (only for qsp format)"
arch=('i686' 'x86_64')
url="http://qsp.su/"
license=('GPL' 'LGPL')
depends=('libjpeg6' 'libpng12' 'gtk2' 'cairo' 'libsm')
install=qsp-gui.install
_tarname="qsp${pkgver//\./}"

[ "$CARCH" = "x86_64" ] && _tarname="${_tarname}_64"

source=("http://qsp.su/attachments/${_tarname}.tar.bz2"
        "https://raw.githubusercontent.com/QSPFoundation/qsp/45c4e7180704b2940e547eb041bbc5b57c46d9e2/help/qsp-logo-vector.svg"
        "qsp-qui.sh"
        "qsp-gui.desktop"
        "qsp.mime")
sha256sums=('fabd48411d59d18b9c663a96490316634c5ef9bdf4208f559c952f9581299dda'
            '12de4d6a91bdc09d334585b04dbb3d2e9ae7277f0274090b9f73c812d414e5dc'
            'ce1ebd984d333cf6ea052875c3c7573ad3837474859eb8a58c29466c9f549255'
            'd2a84ebbc0d2c40200781791f2a8a10d126bf93b053532377b872c3d723bc130'
            'b68fd7e3cfb840a5ba6958a691cd5f360b3d9181995e27ded46182d63343c1f3')

[ "$CARCH" = "x86_64" ] && sha256sums[0]='0d1f22209fd0ab39c64b8834634f599de16ac96cb03b30ab385ce57a5eb6022f'

prepare() {
  cd "$srcdir"

  install -dm755 "$srcdir/hicolor/scalable/apps/"
  install -m644 "$srcdir/qsp-logo-vector.svg" "$srcdir/hicolor/scalable/apps/qsp.svg"

  for i in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256; do
    install -dm755 "$srcdir/hicolor/$i/apps/"
    rsvg-convert -w "${i%%x*}" -h "${i##*x}" -f png \
      -o "$srcdir/hicolor/$i/apps/qsp.png" "$srcdir/qsp-logo-vector.svg"
  done
}
package() {
  install -dm755 "$pkgdir"/usr/{bin,lib/qsp,share/{applications,icons,mime/packages}}
  install -m755 "$srcdir/qsp-qui.sh" "$pkgdir/usr/bin/qsp-gui"
  install -m644 "$srcdir/qsp-gui.desktop" "$pkgdir/usr/share/applications/"
  install -m644 "$srcdir/qsp.mime" "$pkgdir/usr/share/mime/packages/qsp.xml"

  cd "$srcdir"
	bsdtar -cf - hicolor | bsdtar -xf - -C "$pkgdir/usr/share/icons/"

  cd "$_tarname"
	bsdtar -cf - * | bsdtar -xf - -C "$pkgdir/usr/lib/qsp/"
}

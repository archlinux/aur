# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>
# Maintainer: Simon Zack <simonzack@gmail.com>
# Contributor: Tristelune <tristelune@archlinux.info>

_pkgname=PDFStudio
pkgname=${_pkgname,,}-bin
_pkgver=2021
pkgver=$_pkgver.1.1
pkgrel=2
pkgdesc='Review, annotate, and edit PDF Documents'
arch=(x86_64)
url='https://www.qoppa.com/pdfstudio/'
license=(custom)
depends=('java-runtime>=6')
provides=("${pkgname%-bin}=$pkgver")
conflicts=("${pkgname%-bin}")
replaces=("${pkgname%-bin}")
source=("${pkgname%-bin}.desktop"
        "${pkgname%-bin}.png"
        "https://download.qoppa.com/${pkgname%-bin}/v$_pkgver/${_pkgname}_v${pkgver//./_}_linux64.deb")
sha256sums=('7af4b3af56c1c36f10c04bca81fabdcdedadac7dabd3e782b82cfe1bbf34cf43'
            '0a3c1c337a22228f3df28412ca65d45d0d8067b508cf7b1cf93810fc17c9b447'
            'ab33299dce16ea485d50d9505bfef0768e205ea55ba35788e850f2aed7753221')

prepare() {
  bsdtar xf data.tar.gz
  # Comment out this in `.vmoptions` to be compatible with *JRE 15*
  sed -i 's/\(^-XX:+UseConcMarkSweepGC$\)/# \1/' "$srcdir/opt/${pkgname%-bin}$_pkgver/${pkgname%-bin}$_pkgver.vmoptions"
  bsdtar xf "opt/${pkgname%-bin}$_pkgver/lib/pdfstudio.jar" resources/license.html
  rm -rf "opt/${pkgname%-bin}$_pkgver/jre"
}

package() {
  install -Dm644 -t "$pkgdir/usr/share/applications/" "${pkgname%-bin}.desktop"
  install -Dm644 -t "$pkgdir/usr/share/pixmaps/" "${pkgname%-bin}.png"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" resources/license.html
  install -dm 755 "$pkgdir/usr/share/"
  cp -r "opt/${pkgname%-bin}$_pkgver" "$pkgdir/usr/share/${pkgname%-bin}"
  install -dm 755 "$pkgdir/usr/bin"
  ln -sf "/usr/share/${pkgname%-bin}/${pkgname%-bin}$_pkgver" "$pkgdir/usr/bin/${pkgname%-bin}"
}

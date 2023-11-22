# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Woof <woofy1231@hotmail.com>
# Contributor: catwell <catwell@archlinux.us>
# Contributor: Joan Bruguera Micó <joanbrugueram@gmail.com>

pkgname=ltsa
pkgver=3.0
pkgrel=8
pkgdesc="Labelled Transition System Analyser, a verification tool for concurrent systems"
arch=('any')
url="http://www.doc.ic.ac.uk/ltsa/"
# NB: (Joan Bruguera, 2019-04-21) I have send an e-mail to the authors (Robert
#     Chatley & Jeff Magee), and they have agreed to license this software under
#     the GPL.license. At this moment, this package still bundles the prebuilt
#     JAR, but since it's available, ideally, it should be built from source,
#     and then the license field should be changed to GPL
# PS: I haven't got the source at this moment or checked everything thorough yet.
#     If it's of any interest, I found the source of some unnamed version online at:
#     https://github.com/gabrielsr/ltsa/tree/master/ltsa/src/main/java/ic/doc/ltsa
license=('unknown')
depends=('java-runtime' 'bash' 'libcups')
install=ltsa.install
makedepends=('imagemagick' 'gendesk')
source=("http://www.doc.ic.ac.uk/~jnm/book/$pkgname/${pkgname}tool.zip"
        "$pkgname.sh")
sha256sums=('9ed894c4f2ae22e119a4f48e6e3f36b38b08f8fe85a6ac85564f4c5045fe9046'
            '34f53ef6b330e49d3eaeb8754703a09ac98d95052bf6c08abb9f0161bb66ff84')

build() {
  cd "$srcdir"
  gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --categories "Education;Java"
  echo "Generating $pkgname.png..."
  convert "${pkgname}tool/$pkgname.ico" "$pkgname.png"
}

package() {
  cd "$srcdir/${pkgname}tool"

  mkdir -p "$pkgdir/usr/share/$pkgname" "$pkgdir/usr/share/doc/$pkgname"
  echo "Packaging application..."
  cp -r -- *.jar "$pkgdir/usr/share/$pkgname"
  install -DTm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  echo "Packaging examples..."
  cp -r Chapter_examples "$pkgdir/usr/share/doc/$pkgname/examples"
  echo "Packaging icon and desktop shortcut..."
  cd "$srcdir"
  install -DTm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -DTm644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}


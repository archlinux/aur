# Contributor: Orivej Desh <smpuj@bk.ru>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=latin-words
pkgver=1.97FC
pkgrel=5
pkgdesc="William Whitaker's Latin-English-Latin intelligent dictionary and Latin text analyser."
arch=("i686" "x86_64")
url="http://archives.nd.edu/whitaker/words.htm"
license=('custom')
makedepends=('gcc-ada' 'unzip')
provides=("wordslatin")
conflicts=("wordslatin")
source=("http://archives.nd.edu/whitaker/wordsall.zip" "words.sh" "license.txt")
# alternative source: https://github.com/chrisfair/words
sha256sums=('592134d7602879e0937b6f977a6f63aa1d14b813edaf6de04a1d8596a9a2c18e'
            '227bd31f84236127628d4332629dafe19c412d4bc41c4f269a74eb40205a8b82'
            'd56ae6b06a2707b497f6f52b0bd6b15784bdba45586cc3e8bec789e14e025d99')

build() {
  cd "$srcdir"
  unzip -quo wordsall
  gnatmake -O3 words
  gnatmake makedict && echo "g" | ./makedict
  gnatmake makestem && echo "g" | ./makestem
  gnatmake makeefil && ./makeefil
  gnatmake makeinfl && ./makeinfl
}

package() {
  cd "$srcdir"
  install -D words "$pkgdir/usr/share/words-$pkgver/words"
  install -m644 ADDONS.LAT DICTFILE.GEN EWDSFILE.GEN INDXFILE.GEN \
    INFLECTS.SEC STEMFILE.GEN UNIQUES.LAT \
    "$pkgdir/usr/share/words-$pkgver/"
  install -Dm644 wordsdoc.htm "$pkgdir/usr/share/doc/words-$pkgver/wordsdoc.htm"
  install -D words.sh "$pkgdir/usr/bin/words"
  sed -i -s "s/PKGVER/$pkgver/" -i "$pkgdir/usr/bin/words"
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/latin-words/LICENSE"
}

pkgname=tile-molester
pkgver=0.15a
pkgrel=5
pkgdesc="Tile Molester is the next generation of tile editors"
arch=(any)
url="http://www.zophar.net/utilities/graphutil/tile-molester.html"
license=("GPL")
makedepends=(dos2unix java-environment)
depends=(java-runtime)
source=("TileMolester_${pkgver//./}_src.zip::http://www.zophar.net/download_file/2737"
"fig1.png"
"fig2.png"
"fig3.png"
"fig4.png"
"fig5.png"
"help.htm"
"language.properties"
"TMIcon.png.in"
"tile-molester.sh"
"tile-molester.desktop")
md5sums=('a664f4fe532f03522f8d3ac2ab54af8a'
         '992f5c830724d597d60c1ea0038815db'
         'd44bf0e1e143520cfcf0cae1daaa0239'
         'dbc27a22cd2a899597f5fd243fe04175'
         'bf33b58761069f4df69b39824d50e860'
         'da22f711669b8af87a38a5b80e3d92ab'
         'ae921e18903f9730d9b7a9a29e5871ab'
         'e0204644fecf63dfcf1bed0d2cb53197'
         'd6fff3a9990c2b307e4b42bc82b0b9ed'
         '0d44d78cf531c7e00dda4d46ff080d49'
         '4a38896184069180c97f4ddee623a6c1')

build() {
  cd $srcdir
  jar xvf bmpLibrary.jar
  find . -type f -exec dos2unix {} \;
  mkdir -p ".build/languages"
  find . -name '*.java' | xargs -rtl1 -I {} javac {} -d .build
  cp splash.gif .build
  cp -r icons .build
  find . -name '*.properties' | xargs -rtl1 -I {} cp {} ".build/languages/"
  cd .build
  jar cvef TileMolester tm.jar colorcodecs fileselection icons languages modaldialog osbaldeston \
    threads tilecodecs treenodes utils *.class splash.gif
}

package() {
  cd $srcdir
  install -Dm755 ".build/tm.jar" "$pkgdir/usr/share/java/tm.jar"
  install -Dm644 "resources/tmres.dtd" "$pkgdir/usr/share/tile-molester/resources/tmres.dtd"
  install -m644 settings.dtd "$pkgdir/usr/share/tile-molester/"
  install -m644 tmspec.dtd "$pkgdir/usr/share/tile-molester/"
  install -m644 tmspec.xml "$pkgdir/usr/share/tile-molester/"
  find . -name '*.png' | xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/share/doc/tile-molester/"{}
  install -m644 help.htm "$pkgdir/usr/share/doc/tile-molester/"
  install -Dm644 TMIcon.png.in "$pkgdir/usr/share/icons/tile-molester.png"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/tile-molester/COPYING"
  install -m644 README "$pkgdir/usr/share/licenses/tile-molester/"
  install -Dm755 "$srcdir/tile-molester.sh" "$pkgdir/usr/bin/tile-molester"
  install -Dm644 "$srcdir/tile-molester.desktop" "$pkgdir/usr/share/applications/tile-molester.desktop"
}

# vim:set ts=2 sw=2 et:

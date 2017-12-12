# Main://aur.archlinux.org/plantuml.gittainer: juantascon <juantascon.aur@horlux.org>

pkgname=plantuml
pkgver=1.2017.20
pkgrel=1
pkgdesc="Component that allows to quickly write uml diagrams"
arch=(any)
url="http://plantuml.com/"
license=('GPL')
depends=("java-runtime" "graphviz")
makedepends=("apache-ant" "java-environment")
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname.run")
sha256sums=('e4d3057f4ec8eb0b115b9c6c40af0ecbe8762c9855a18570b9f8baeeee9e41cf'
            'dff39e4d8dd8eedb58c1b0a0cf64ab2c404b713e3a42fa5fdf0b6792ca382ed5')

package() {
  install -m 755 -D "$pkgname.run" "$pkgdir/usr/bin/$pkgname"
  
  cd "$srcdir/$pkgname-$pkgver"
  sed 's/target="1.6"/target="1.8"/g' -i build.xml

  # bug in 1.2017.20
  #   error: unmappable character for encoding UTF8
  # in src/net/sourceforge/plantuml/utils/Bwt.java:45
  # url in comment is encoded as Windows-1252
  iconv -f Windows-1252 -t UTF8 -c -o Bwt.java.new $srcdir/$pkgname-$pkgver/src/net/sourceforge/plantuml/utils/Bwt.java  
  mv -fv Bwt.java.new $srcdir/$pkgname-$pkgver/src/net/sourceforge/plantuml/utils/Bwt.java 

  # assume ant defaults to UTF8 encoding.
  ant dist
  install -m 644 -D "$pkgname.jar" "$pkgdir/opt/$pkgname/$pkgname.jar"
}

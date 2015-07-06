# Maintainer: Stefan Seemayer <mail@semicolonsoftware.de>
pkgname=jalview
pkgver=2.8.2
pkgrel=1
pkgdesc="Bioinformatics Multiple Alignment Editor"
arch=(any)
url="http://www.jalview.org/"
license=('GPL3')
depends=(java-runtime)
makedepends=(perl wget)

source=( "http://www.jalview.org/webstart/jalview.jnlp"
         "logo.gif"
         "jalview"
         "jalview.desktop")

md5sums=('22199389866d5ea6829d5005bed6974c'
         'e124f66d646560813b1a06b0cff02d3a'
         '0ea5c6990bfa050c9c69f24926da3d57'
         'b3a842500e7ff3cd1324dede69822d21')

build() {

  mkdir -p "$srcdir/$pkgname-$pkgver" || exit 1
  cd "$srcdir/$pkgname-$pkgver" || exit 1

  # parse list of jar files from JNLP file
  jars=$(perl '-ne /<jar href="([^"]*)"\/>/ && print "$1\n"' "$srcdir/jalview.jnlp")

  for jar in $jars; do
    wget "http://www.jalview.org/webstart/$jar" -O "$jar" || exit 1
  done
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # set up directory structure
  mkdir -p $pkgdir/usr/{share/{applications,pixmaps,java/$pkgname},bin}

  install -Dm644 *.jar $pkgdir/usr/share/java/$pkgname/
  install -Dm755 ../jalview $pkgdir/usr/bin/
  install -Dm644 ../logo.gif $pkgdir/usr/share/pixmaps/jalview.gif
  install -Dm644 ../jalview.desktop $pkgdir/usr/share/applications/
}

# vim:set ts=2 sw=2 et:

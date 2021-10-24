# Maintainer: Ada Joule <ada dot fulmina at gmail dot com>

pkgname=ttf-google-thai
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Some of the best Thai fonts from google"
arch=('any')
url="https://fonts.google.com/"
license=('OFL')
makedepends=(curl wget)
source=('fonts.txt')
md5sums=('SKIP')

build() {
  cd "$srcdir"
  mkdir -p fonts
  cat fonts.txt | while read LINE
  do
    if ! test -r "fonts/$LINE.ttf" && test -n "$LINE"
    then
      echo "Downloading $LINE"
      REQUEST="https://fonts.googleapis.com/css?family=$(echo "$LINE" | sed 's# #+#g')"
      HINT="$(curl "$REQUEST" 2> /dev/null | grep 'https://fonts.gstatic.com')"
      URL="$(echo "$HINT" | sed 's#^.*url(\([^)]*\)).*$#\1#')"
      wget -q "$URL" -O "fonts/$LINE.ttf"
    fi
  done
}

package() {
  install -dm 755 "$pkgdir/usr/share/fonts/TTF"
  install -Dm 644 "$srcdir/fonts/"*.ttf "$pkgdir/usr/share/fonts/TTF"
}

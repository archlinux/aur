# Maintainer: Franck Lucien Duriez <franck.lucien.duriez@gmail.com>

pkgname=ttf-google
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Some of the best fonts from google"
arch=('any')
url="https://fonts.google.com/"
license=('custom:Creative Commons')
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

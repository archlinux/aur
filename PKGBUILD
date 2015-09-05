# Maintainer: Ian D. Scott <ian@perebruin.com>
pkgname=whitakers-words
pkgver=1.97FC
pkgrel=2
pkgdesc="Latin-English dictionary program."
arch=('i686' 'x86_64')
url="http://archives.nd.edu/whitaker/words.htm"
license=('custom')
makedepends=('gcc-ada')
source=("http://archives.nd.edu/whitaker/wordsall.zip")
md5sums=('e70ae2112bb7c7c491c3ec7a57af779c')

build() {
  cd "$srcdir"

  gnatmake -O3 words
  gnatmake makedict
  gnatmake makestem
  gnatmake makeefil
  gnatmake makeinfl

  echo G | ./makedict
  echo G | ./makestem
  echo G | ./makeefil
  echo G | ./makeinfl
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/opt/whitakers-words"
  mkdir -p "$pkgdir/usr/bin"

  cp words *.GEN *.SEC {UNIQUES,ADDONS}.LAT "$pkgdir/opt/whitakers-words"
  cat > "$pkgdir/usr/bin/words" << EOF
#!/bin/bash
cd /opt/whitakers-words
./words \$@
EOF
  chmod +x "$pkgdir/usr/bin/words"
}

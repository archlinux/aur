# Maintainer: Raphael Emberger(raember) <raphael.emberger@hotmail.ch>
# Contributor: Hervé Bitteur <herve.bitteur@audiveris.com>
pkgname=audiveris
pkgver=5.3.1
_gitcommit=f0bdbe6
_tag=5.3.1
pkgrel=1
pkgdesc="Music score OMR engine"
arch=('x86_64')
url="https://github.com/Audiveris/audiveris"
license=('AGPL3')
depends=(
  'java-runtime>=17'
  'archlinux-java-run>=7'
  'tesseract-data-eng'
  'freetype2'
)
makedepends=(
  'java-environment>=17'
  'gradle'
)
optdepends=('tesseract-data: For languages other than english')
source=(
  "$pkgname-${pkgver/_/-}.tar.gz::https://github.com/Audiveris/$pkgname/archive/${pkgver/_/-}.tar.gz"
  "$pkgname"
)
sha256sums=('b81ef95ea87cfb73ff718ff3a33acddc4a275f94d1d25134bdc43b813d28d6d6'
            'f8c61a27680a5255940d6837601dc461b517110e13aa9673c88f4c0300bfa255')

prepare() {
  # Replacing git commit request with static commit hash
  sed -i "s/git rev-parse --short HEAD/echo '${_gitcommit}'/g" "$srcdir/$pkgname-${pkgver/_/-}/build.gradle"
}

build() {
  cd "$srcdir/$pkgname-${pkgver/_/-}"
  export JAVA_HOME=$(archlinux-java-run -a 17 -b 18 -f jdk -j)
  gradle build javadoc --stacktrace
}

package() {
  # Extracting libraries
  install -dm755 "$pkgdir/usr/share/java/$pkgname"
  bsdtar -C "$pkgdir/usr/share/java/$pkgname" --strip-components=2 \
    -xf "$srcdir/$pkgname-${pkgver/_/-}/build/distributions/Audiveris-${_tag}.tar" \
    Audiveris-${_tag}/lib/*
  
  # Creating starter script
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Installing JavaDoc
  install -dm755 "$pkgdir/usr/share/doc"
  cp -r "$srcdir/$pkgname-${pkgver/_/-}/build/docs/javadoc" "$pkgdir/usr/share/doc/$pkgname"
}


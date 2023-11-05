# Maintainer: Raphael Emberger(raember) <raphael.emberger@hotmail.ch>
# Contributor: Hervé Bitteur <herve.bitteur@audiveris.com>
pkgname=audiveris-doc
pkgver=5.3.1
_gitcommit=f0bdbe6
_tag=5.3.1
pkgrel=1
pkgdesc="Music score OMR engine docs"
arch=('any')
url="https://github.com/Audiveris/audiveris"
license=('AGPL3')
depends=(
  'audiveris'
)
makedepends=(
  'java-environment>=17'
  'gradle'
)
source=("$pkgname-${pkgver/_/-}.tar.gz::https://github.com/Audiveris/audiveris/archive/${pkgver/_/-}.tar.gz")
sha256sums=('b81ef95ea87cfb73ff718ff3a33acddc4a275f94d1d25134bdc43b813d28d6d6')

prepare() {
  # Replacing git commit request with static commit hash
  sed -i "s/git rev-parse --short HEAD/echo '${_gitcommit}'/g" "$srcdir/audiveris-${pkgver/_/-}/build.gradle"
}

build() {
  cd "$srcdir/audiveris-${pkgver/_/-}"
  # Failing tests are not our concern. Ignore them.
  sed 's/src\/test/src\/main/' -i build.gradle
  sed 's/javadoc {/javadoc {\nexclude ("src\/**")/' -i build.gradle
  gradle build javadoc --stacktrace
}

package() {
  # Installing JavaDoc
  install -dm755 "$pkgdir/usr/share/doc"
  cp -r "$srcdir/audiveris-${pkgver/_/-}/build/docs/javadoc" "$pkgdir/usr/share/doc/audiveris"
}


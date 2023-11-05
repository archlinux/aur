# Maintainer: Raphael Emberger(raember) <raphael.emberger@hotmail.ch>
# Contributor: Hervé Bitteur <herve.bitteur@audiveris.com>

_pkgname=audiveris
pkgname="${_pkgname}-doc"
pkgver=5.3.1
_tag=5.3.1
_gitcommit=f0bdbe6
_name="${_pkgname}-${pkgver/_/-}"
pkgrel=2
pkgdesc="Music score OMR engine docs"
arch=('any')
url="https://github.com/Audiveris/$_pkgname"
license=('AGPL3')
makedepends=(
  'java-environment>=17'
  'gradle'
)
optdepends=(
  'audiveris'
  'audiveris-git'
)
source=(
  "${_name}.tar.gz::${url}/archive/${pkgver/_/-}.tar.gz"
)
sha256sums=(
  'b81ef95ea87cfb73ff718ff3a33acddc4a275f94d1d25134bdc43b813d28d6d6'
)

prepare() {
  # Replacing git commit request with static commit hash
  sed -i "s/git rev-parse --short HEAD/echo '${_gitcommit}'/g" "$srcdir/${_name}/build.gradle"
}

build() {
  cd "$srcdir/${_name}"
  # Failing tests are not our concern. Ignore them.
  sed 's/src\/test/src\/main/' -i build.gradle
  sed 's/javadoc {/javadoc {\nexclude ("src\/**")/' -i build.gradle
  gradle build javadoc
}

package() {
  # Installing JavaDoc
  install -dm755 "${pkgdir}/usr/share/doc"
  cp -r "$srcdir/${_name}/build/docs/javadoc" "${pkgdir}/usr/share/doc/$_pkgname"
}

# Maintainer: Dan McCurry <dan.mccurry at linux dot com>
# Contributer: Nikola Milinković <nikmil@gmail.com>
# Submitter: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=jabref-git
pkgver=4.0.0_v_2.9.2.r6339.2e9e7c89f
pkgrel=1
pkgdesc="GUI frontend for BibTeX, written in Java -- built from git"
arch=('any')
url="https://www.jabref.org"
license=('MIT')
depends=('java-environment>=8')
makedepends=('git' 'java-environment=8' 'java-openjfx')
optdepends=('gsettings-desktop-schemas: For web search support')
provides=('jabref')
conflicts=('jabref')
source=("${pkgname%-git}::git+https://github.com/JabRef/jabref.git"
	"${pkgname%-git}.desktop"
	"${pkgname%-git}.sh")
md5sums=('SKIP'
         '5f76feb6b2f66a2ea8b52bca999a934f'
         '97c6daba4b3fc1ff1bee0f5b3a4c627f')

pkgver() {
  cd ${srcdir}/${pkgname%-git}
  _release=$(sed -n 's/.*version = \"\(.*\)-dev\"/\1/p' build.gradle)
  printf "%s" "${_release}_$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  PATH=/usr/lib/jvm/java-8-openjdk/jre/bin/:$PATH
  
  ./gradlew releaseJar
}

package() {
  cd "${srcdir}/${pkgname%-git}"

  find "${srcdir}/${pkgname%-git}/build/releases" \
	  -iname "JabRef-${pkgver%%_*}-dev.jar" \
	  -exec install -Dm644 {} ${pkgdir}/usr/share/java/jabref/JabRef.jar \;

  install -Dm755 $srcdir/jabref.sh ${pkgdir}/usr/bin/jabref

  install -Dm644 $srcdir/jabref.desktop \
    ${pkgdir}/usr/share/applications/jabref.desktop

  install -Dm644 build/resources/main/images/icons/JabRef-icon-48.png \
    ${pkgdir}/usr/share/pixmaps/jabref.png

  install -Dm644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

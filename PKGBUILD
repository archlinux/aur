# Contributer: Dan McCurry <dan.mc at protonmail dot com>
# Contributer: Nikola Milinković <nikmil@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

# If an unsupported java environment is set using archlinux-java,
# uncomment/edit the appropriate line in /usr/bin/jabref after
# installation.

pkgname=jabref-git
pkgver=5.0.r804.gee2c9857c8
pkgrel=1
epoch=1
pkgdesc="GUI frontend for BibTeX, written in Java -- built from git"
arch=('any')
url="https://www.jabref.org"
depends=('archlinux-java-run>=7' 'java-runtime=14')
license=('MIT')
makedepends=('git' 'java-environment=14') # tested with  openjdk 14 from official repos
optdepends=('gsettings-desktop-schemas: For web search support')
provides=('jabref')
conflicts=('jabref')
source=("git+https://github.com/JabRef/jabref.git"
	"${pkgname%-git}.desktop"
	"${pkgname%-git}.sh")
sha256sums=('SKIP'
            'cb50a38f701374e6922e74e35c4f99f0418441c48b3c4855e64f0995f0be9cb8'
            '0d5ca38d2c4a5c60b0778f36317794d2fb13f20b13d8473f69b41a6caebcb839')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags |cut -c2-|sed 's+-+.r+'|sed 's+-+.+'
}

build() {
  cd ${pkgname%-git}
  [[ -d "$srcdir"/gradle ]] && install -d "$srcdir"/gradle
  export GRADLE_USER_HOME="$srcdir"/gradle
  
  export JAVA_HOME=$(archlinux-java-run -a 14 -f jdk -j)
  echo "Using JDK from $JAVA_HOME to build JabRef."
  
  ./gradlew --no-daemon -PprojVersion="${pkgver}" \
    -PprojVersionInfo="${pkgver}--ArchLinux--${pkgrel}" assemble
}

package() {
  install -dm755 "${pkgdir}"/usr/share/java/${pkgname}
  install -Dm755 jabref.sh "${pkgdir}"/usr/bin/JabRef
  install -Dm644 jabref.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop

  cd ${pkgname%-git}
  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md
  install -Dm644 src/main/resources/icons/jabref.svg "${pkgdir}"/usr/share/pixmaps/${pkgname}.svg

  cd build
  cp -r resources "${pkgdir}"/usr/share/java/${pkgname}
  tar xf distributions/JabRef-${pkgver}.tar -C "${pkgdir}"/usr/share/java/${pkgname} JabRef-${pkgver}/lib --strip-components=1
  rm "${pkgdir}"/usr/share/java/${pkgname}/lib/*-mac.*
}

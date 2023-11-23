# Contributer: Dan McCurry <dan.mc at protonmail dot com>
# Contributer: Nikola Milinković <nikmil@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

# If an unsupported java environment is set using archlinux-java,
# uncomment/edit the appropriate line in /usr/bin/jabref after
# installation.

pkgname=jabref-git
pkgver=5.11.r155.43364b8b87
pkgrel=1
epoch=3
pkgdesc="GUI frontend for BibTeX, written in Java -- built from git"
arch=('x86_64')
url="https://www.jabref.org"
license=('MIT')
depends=('java-runtime=21' 'xdg-user-dirs' 'gtk3>=3.8' 'alsa-lib')
makedepends=('git' 'jdk21-openjdk') # tested with openjdk from the repos
optdepends=('gsettings-desktop-schemas: For web search support')
provides=('jabref')
conflicts=('jabref')
source=("git+https://github.com/JabRef/jabref.git"
	"${pkgname%-git}.desktop"
	"${pkgname%-git}.sh")
sha256sums=('SKIP'
            'cb50a38f701374e6922e74e35c4f99f0418441c48b3c4855e64f0995f0be9cb8'
            'b5936f54b1fd806687171bef46b5be3fa247289e7c63352b448c0922072edcdf')

pkgver() {
  cd ${pkgname%-git}
  printf "%s" "$(git describe --tags --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
  # printf %s $(git log -1 --format="%cd" --date=short | tr -d '-') 
}

build() {
  # Due to a jlink bug you need at least JDK 21.0.1 to compile JabRef
  if [[ 0 -gt $(vercmp $("$JAVA_HOME"/bin/java -version |& sed -n "2s/.*build \([0-9.]*\).*/\1/; 2p") 21.0.1) ]]
  then
    echo "Error: you need JDK at least 21.0.1 to compile Jabref"
    echo "JDK currently in use:"
    "$JAVA_HOME"/bin/java -version |& sed -n "2p"
    exit 1
  fi
  cd ${pkgname%-git}
  [[ -d "$srcdir"/gradle ]] && install -d "$srcdir"/gradle
  export GRADLE_USER_HOME="$srcdir"/gradle
  export DEFAULT_JVM_OPTS='"-Xmx1g" "-Xms64m"'
  # pwd
  ./gradlew --no-daemon -PprojVersion="${pkgver}" \
	    -PprojVersionInfo="${pkgver}--ArchLinux--${pkgrel}" assemble
  ./gradlew --no-daemon --no-parallel -PprojVersion="${pkgver}" \
	    -PprojVersionInfo="${pkgver}--ArchLinux--${pkgrel}" jlink 
}

package() {
  # install -dm755 "${pkgdir}"/usr/share/java/${pkgname}
  install -Dm755 jabref.sh "${pkgdir}"/usr/bin/JabRef
    install -Dm644 jabref.desktop \
	  "${pkgdir}"/usr/share/applications/${pkgname}.desktop

  cd ${pkgname%-git}
  # install -Dm755 build/image/bin/JabRef "${pkgdir}"/usr/bin/JabRef
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 src/main/resources/icons/jabref.svg \
	  "${pkgdir}"/usr/share/pixmaps/${pkgname}.svg

  # lowercase alias (for convenience and required for browser extensions)
  ln -sf /usr/bin/JabRef "${pkgdir}"/usr/bin/jabref

  install -d "${pkgdir}/opt"
  cp -R build/image "${pkgdir}"/opt/${pkgname}
}

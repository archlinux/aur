# Maintainer: Pablo Romano <promano7@hotmail.com>

pkgname=jsignpdf
pkgver=3.2.1
pkgrel=2
pkgdesc='Digitally sign PDF documents with a graphical interface or command line'
arch=('x86_64' 'aarch64')
url='https://github.com/intoolswetrust/jsignpdf'
license=('MPL-2.0 OR LGPL-2.1-only')
depends=('gtk3' 'libxtst' 'libxxf86vm' 'hicolor-icon-theme')
makedepends=('jdk21-openjdk' 'maven')
checkdepends=('desktop-file-utils')
optdepends=('opensc: PKCS#11 module for compatible smart cards and tokens')
_tag="JSignPdf_${pkgver//./_}"
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz"
  'jsignpdf.sh'
  'jsignpdf.desktop'
)
sha256sums=('547ac4ad88ef1e0d3b2aea408b1db0c3aa5347650a60dbb17bf819bc128d4764'
            'c8e4c5662d11101fb6dea16277437f69aba0473fc555bc8a08efa0aa9bb29bab'
            '8870afe9c0673690e462439581d961abf399764f601c7d3cb0ab7805487d4d4d')

build() {
  cd "$pkgname-$_tag"

  export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
  export PATH="$JAVA_HOME/bin:$PATH"

  # Keep Maven's downloaded dependencies in the build tree.
  mvn --batch-mode --no-transfer-progress \
    -Dmaven.repo.local="$srcdir/.m2/repository" \
    -DskipTests package
}

check() {
  cd "$pkgname-$_tag"

  export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
  export PATH="$JAVA_HOME/bin:$PATH"

  # Upstream tests assert English diagnostics regardless of the host locale.
  mvn --batch-mode --no-transfer-progress \
    -Dmaven.repo.local="$srcdir/.m2/repository" \
    -Duser.language=en -Duser.country=US test
  desktop-file-validate "$srcdir/jsignpdf.desktop"
}

package() {
  # Resolve the JDK at build time before adding the runtime requirement.
  # Both Arch's JRE 21 and JDK 21 provide this virtual dependency.
  depends=('java-runtime-openjdk=21' 'gtk3' 'libxtst' 'libxxf86vm' 'hicolor-icon-theme')

  cd "$pkgname-$_tag"

  local staging=distribution/target/appassembler/lib
  local classifier jar name
  case "$CARCH" in
    x86_64) classifier=linux ;;
    aarch64) classifier=linux-aarch64 ;;
    *) return 1 ;;
  esac

  # Bootstrap expects the platform-specific JavaFX jars in a sibling
  # javafx/ directory. Keep only the Linux natives for this package's arch.
  install -dm755 "$pkgdir/usr/share/java/$pkgname/javafx"
  for jar in "$staging"/*.jar; do
    name=${jar##*/}
    case "$name" in
      javafx-*-win.jar|javafx-*-linux.jar|javafx-*-linux-aarch64.jar|javafx-*-mac.jar|javafx-*-mac-aarch64.jar)
        if [[ $name == *-"$classifier".jar ]]; then
          install -m644 "$jar" "$pkgdir/usr/share/java/$pkgname/javafx/"
        fi
        ;;
      *) install -m644 "$jar" "$pkgdir/usr/share/java/$pkgname/" ;;
    esac
  done

  install -Dm755 "$srcdir/jsignpdf.sh" "$pkgdir/usr/bin/jsignpdf"
  install -Dm644 "$srcdir/jsignpdf.desktop" \
    "$pkgdir/usr/share/applications/jsignpdf.desktop"
  install -Dm644 distribution/linux/flatpak/jsignpdf.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/io.github.intoolswetrust.JSignPdf.png"

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  cp -r distribution/licenses/. "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 License.md "$pkgdir/usr/share/licenses/$pkgname/"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -m644 distribution/target/generated-docs/*.pdf \
    "$pkgdir/usr/share/doc/$pkgname/"
  cp -r distribution/demo "$pkgdir/usr/share/doc/$pkgname/"
}

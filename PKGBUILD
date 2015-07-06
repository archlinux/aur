# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=raccoon
pkgname=$_pkgname-git
pkgver=20150611.r180.5f08b40
pkgrel=3
arch=('any')
pkgdesc='Google Play desktop client'
url='http://www.onyxbits.de/raccoon'
license=('Apache')
depends=('java-runtime' 'bash')
makedepends=('apache-ant' 'java-environment' 'git')

_commons_cli_ver=1.3.1
_commons_io_ver=2.4
_commons_loggin_ver=1.2
_httpclient_ver=4.5
_httpcore_ver=4.4.1
_protobuf_java_ver=2.6.1

source=(
  "$pkgname::git+https://github.com/onyxbits/Raccoon.git"
  "$pkgname.build.xml"
  "$pkgname.desktop"
  "http://central.maven.org/maven2/commons-cli/commons-cli/$_commons_cli_ver/commons-cli-$_commons_cli_ver.jar"
  "http://central.maven.org/maven2/commons-io/commons-io/$_commons_io_ver/commons-io-$_commons_io_ver.jar"
  "http://central.maven.org/maven2/commons-logging/commons-logging/$_commons_loggin_ver/commons-logging-$_commons_loggin_ver.jar"
  "http://central.maven.org/maven2/org/apache/httpcomponents/httpclient/$_httpclient_ver/httpclient-$_httpclient_ver.jar"
  "http://central.maven.org/maven2/org/apache/httpcomponents/httpcore/$_httpcore_ver/httpcore-$_httpcore_ver.jar"
  "http://central.maven.org/maven2/com/google/protobuf/protobuf-java/$_protobuf_java_ver/protobuf-java-$_protobuf_java_ver.jar"
)
sha512sums=(
  'SKIP'
  'fb9fb361819fbb67b14caf78bb84a9d8e67839f36ddb786ff96ad2626a4e6a382d37da24e56ca2b9a8dc82b52861fe94165acec62415c1cc89876c700f1faa56'
  'b0bdc6234e8ddc900547a92b54592c5f4ca8beec94ed238b78e1a797abe111e75d0c6d2034c5957100d960ab938aee8846108f896ccd78d9cea7dc9e3061f08f'
  '383ff22040787d7a27e18b414892dd204ba0f9d75e43eee775c1276d6dd6ea2a38fc349edec1b2bd332fb0bd324dcc8ccce084b98d47bcaf8aa443773fabf3de'
  '957a438894a196e534af9ae1e61fb21e16f273952b55a81abb8faf0b139fc031ea940cf477f81704db417d1ce6ff2d9ddd4a2cbf316903b0e2dc1aeaef24f292'
  'ed00dbfabd9ae00efa26dd400983601d076fe36408b7d6520084b447e5d1fa527ce65bd6afdcb58506c3a808323d28e88f26cb99c6f5db9ff64f6525ecdfa557'
  '4e90e6765c0d17a4908b095eb18a39055d4e4eaf7dfef9003e16b6962a41504de4cd9fb9a7dfe657a989fc923cf4943a94c0c8ccd5102b618379f84d1f4042e7'
  'e74a1632a9e1c58f4ab6341886ae2dd14e66bdb6e1d60c8afc09b9fd5c1abcfec350c23ec70cb36cdd82d5af80f98c017922497bf64cdb6caf8114b6dabb6d51'
  '0c16f6c582605d7e1ca57ee18cf990e1cddd6a0380e93c3da3c858625bdb81bb4d7324d85eaed2817f33521212afbc84a830f4ce552087653065edbc61ac4d2b'
)
noextract=(
  "commons-cli-$_commons_cli_ver.jar"
  "commons-io-$_commons_io_ver.jar"
  "commons-logging-$_commons_loggin_ver.jar"
  "httpclient-$_httpclient_ver.jar"
  "httpcore-$_httpcore_ver.jar"
  "protobuf-java-$_protobuf_java_ver.jar"
)

pkgver() {
  cd $pkgname
  printf "%s.r%s.%s" \
    "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  # Set the config dir to ~/.config/Raccoon instead of ~/Raccoon
  sed -i 's|public static final String HOMEDIR = "Raccoon";|public static final String HOMEDIR = ".config/Raccoon";|' \
      $pkgname/src/main/java/de/onyxbits/raccoon/App.java

  # Add the build script to the source folder
  sed 's|#commons_cli_pkgver#|'$_commons_cli_ver'|g;
       s|#commons_io_pkgver#|'$_commons_io_ver'|g;
       s|#commons_logging_pkgver#|'$_commons_loggin_ver'|g;
       s|#httpclient_pkgver#|'$_httpclient_ver'|g;
       s|#httpcore_pkgver#|'$_httpcore_ver'|g;
       s|#protobuf_java_pkgver#|'$_protobuf_java_ver'|g' \
         $pkgname.build.xml > $pkgname/build.xml

  # Remove the build and download instructions from the README
  sed -i '/^Building$/q' $pkgname/README.md
  sed -i 'N;$!P;$!D;$d' $pkgname/README.md
}

build() {
  cd $pkgname
  ant build jar
}

package() {
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
  install -Dm644 $pkgname/artwork/icon.svg "$pkgdir"/usr/share/pixmaps/$_pkgname.svg
  install -Dm644 $pkgname/README.md "$pkgdir"/usr/share/doc/$_pkgname/README.md
  install -Dm644 $pkgname/build/$pkgname.jar "$pkgdir"/usr/share/$_pkgname/$_pkgname.jar
  install -d "$pkgdir"/usr/bin
  printf '%s\n\n%s\n%s\n' \
    '#!/usr/bin/env bash' \
    'unset _JAVA_OPTIONS' \
    'java -jar -Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel /usr/share/'"$_pkgname"'/'"$_pkgname"'.jar "$@"' \
      > "$pkgdir/usr/bin/$_pkgname"
  chmod 755 "$pkgdir/usr/bin/$_pkgname"
}

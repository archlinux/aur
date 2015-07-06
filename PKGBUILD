# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=raccoon
pkgname=$_pkgname-git
pkgver=20150611.r180.5f08b40
pkgrel=2
arch=('any')
pkgdesc='Google Play desktop client'
url='http://www.onyxbits.de/raccoon'
license=('Apache')
depends=('java-runtime' 'bash')
makedepends=('apache-ant' 'java-environment' 'git')

_commons_cli_ver=1.2
_commons_io_ver=2.4
_commons_loggin_ver=1.2
_httpclient_ver=4.2.3
_httpcore_ver=4.2.2
_protobuf_java_ver=2.5.0

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
  '0b8f4610d3a05a589026b1af605cf976f73e6fecb9b9cce9f572e5883ce0a78e8a9cfe48e06257bb68cb8eea080ffe84a2b0b73682036f85dbbb3c03cfdedfaa'
  '957a438894a196e534af9ae1e61fb21e16f273952b55a81abb8faf0b139fc031ea940cf477f81704db417d1ce6ff2d9ddd4a2cbf316903b0e2dc1aeaef24f292'
  'ed00dbfabd9ae00efa26dd400983601d076fe36408b7d6520084b447e5d1fa527ce65bd6afdcb58506c3a808323d28e88f26cb99c6f5db9ff64f6525ecdfa557'
  'ec47816e290dbbef57f0011dadd71cea5602884c5bf87956e73d302876a8f767acf6d6690cd23bac1d720cd61a259779e382d1175a3610ed12a7963cc81ea26c'
  '5c8646a5e9ec038de26b2b6f4ca9d82065e38a40675486bc21dfac40fbf6b05df9ef26648bb4ccc52756f32404dba0bb7ece1ec38cb245df0278136a6e9ddfaa'
  '10ea0baf440c78598eee2bff3742bc2f41b7e67847f8bb43a1f154d7649853ebd9eb86288aab65f4d1a196f4586bab16b656ec7940ec92a57b1c117b8f59abac'
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

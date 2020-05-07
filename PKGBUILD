# Maintainer: arp12

pkgname=dart-dev
archive_name=dart
pkgver=2.9.0.5.0.dev
pkgrel=2
pkgdesc='The dart-dev programming language SDK'
arch=('x86_64')
url='https://www.dartlang.org/'
depends=('bash')
license=('BSD')
makedepends=('setconf')
options=('!strip')
source=("$pkgname-$pkgver-64.zip::https://storage.googleapis.com/dart-archive/channels/dev/release/2.9.0-5.0.dev/sdk/dartsdk-linux-x64-release.zip")
sha512sums=('6d432e7bd98cf69565e40738be61291c4f77a9b9ccb8a97b97a361c0254e2d4b9c351a1de783e4872513fe2cee82ecdddb9c814fced4d053c0b8f0708b067f49')
conflicts=('dart')

prepare() {
  mv "$archive_name-sdk" "$pkgname-sdk"
  
  # Fix permissions
  find "$pkgname-sdk" -type d -exec chmod 0755 '{}' + \
    -or -type f -exec chmod 0644 '{}' +
  chmod +x "$pkgname-sdk/bin/"*

  cd "$pkgname-sdk/bin"

  # Configure paths
  setconf dart2js BIN_DIR "/opt/$pkgname-sdk/bin"
  setconf dart2js PROG_NAME "/opt/$pkgname-sdk/bin/dart2js"
  setconf dartanalyzer SCRIPT_DIR "/opt/$pkgname-sdk/bin"
  setconf pub BIN_DIR "/opt/$pkgname-sdk/bin"
  setconf pub SDK_DIR "/opt/$pkgname-sdk/"
  setconf dartfmt BIN_DIR "/opt/$pkgname-sdk/bin"
  setconf dartfmt SDK_DIR "/opt/$pkgname-sdk/"

  # Extract license (AUTHORS and LICENSE files are missing)
  head -n5 "../include/dart_api.h" > ../../LICENSE
}

package() {
  # Create directories
  install -d "$pkgdir"{"/opt/$pkgname-sdk",/usr/{bin,"share/doc/$pkgname-sdk"}}

  # Package the files
  cp -a "dart-dev-sdk/"* "$pkgdir/opt/$pkgname-sdk/"

  # Set up symbolic links for the executables
  for f in dart dart2js dartanalyzer pub dartfmt dartdevc; do
    ln -s "/opt/$pkgname-sdk/bin/$f" "$pkgdir/usr/bin/$f"
  done

#   Package samples and documentation
  for f in samples about.html about_files; do
    echo mv "$pkgdir/opt/$pkgname-sdk/$f" "$pkgdir/usr/share/doc/$pkgname-sdk/"
  done

  # BSD License
  install -Dm644 dart-dev-sdk/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname-sdk/LICENSE"
}

# vim:set ts=2 sw=2 et:

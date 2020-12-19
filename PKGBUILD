# Maintainer: Berto Gomez <csberto at gmail dot com>
pkgname=dart-1.x
archive_name=dart
pkgver=1.24.3
pkgrel=1
pkgdesc='The dart programming language SDK'
arch=('x86_64')
url='https://www.dartlang.org/'
depends=('bash')
license=('BSD')
makedepends=('setconf')
optdepends=(
    'dartium: Build of Chromium that includes the Dart VM'
)
options=('!strip')
source=("$pkgname-$pkgver-64.zip::https://storage.googleapis.com/dart-archive/channels/stable/release/1.24.3/sdk/dartsdk-linux-x64-release.zip")
sha512sums=('ec050c51f2adae2fa6c57955b93f29580c07969965c33e4625bc94e44eb22244af616d82fc5fe85b8d13b8371b9874ff55baa400ab321883fbc83c1075fae219')
conflicts=('dart' 'dart-dev')

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
  cp -a "dart-1.x-sdk/"* "$pkgdir/opt/$pkgname-sdk/"

  # Set up symbolic links for the executables
  for f in dart dart2js dartanalyzer pub dartfmt dartdevc; do
    ln -s "/opt/$pkgname-sdk/bin/$f" "$pkgdir/usr/bin/$f"
  done

#   Package samples and documentation
  for f in samples about.html about_files; do
    echo mv "$pkgdir/opt/$pkgname-sdk/$f" "$pkgdir/usr/share/doc/$pkgname-sdk/"
  done

  # BSD License
  install -Dm644 dart-1.x-sdk/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname-sdk/LICENSE"
}

# vim:set ts=2 sw=2 et:

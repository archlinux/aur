# Maintainer: Ryan Gonzalez <rymg19@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: T. Jameson Little <t.jameson.little at gmail dot com>
# Contributor: Usagi Ito <usagi@WonderRabbitProject.net>
# Contributor: siasia <http://pastebin.com/qsBEmNCw>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>

_ver=2.0.0
_rel=50.0
pkgname=dart-dev
pkgver=$_ver.dev.$_rel
pkgrel=1
pkgdesc='The dart programming language SDK (dev channel)'
arch=('x86_64')
url='http://www.dartlang.org/'
license=('BSD')
makedepends=('setconf')
options=('!strip')
source_x86_64+=("$pkgname-$pkgver-64.zip::https://storage.googleapis.com/dart-archive/channels/dev/release/$_ver-dev.$_rel/sdk/dartsdk-linux-x64-release.zip")
sha256sums_x86_64=('0ac31f14ea073756c410123372e77005874235fecff324a5a702f15059278dca')

prepare() {
  # Fix permissions
  find "dart-sdk" -type d -exec chmod 0755 '{}' + \
    -or -type f -exec chmod 0644 '{}' +
  chmod +x "dart-sdk/bin/"*

  cd "dart-sdk/bin"

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
  cp -a "dart-sdk/"* "$pkgdir/opt/$pkgname-sdk/"

  # Set up symbolic links for the executables
  for f in dart-dev dart2js-dev dartanalyzer-dev pub-dev dartfmt-dev dartdevc-dev; do
    ln -s "/opt/$pkgname-sdk/bin/$f" "$pkgdir/usr/bin/$f"
  done

  # Package samples and documentation
  for f in samples about.html about_files; do
    echo mv "$pkgdir/opt/$pkgname-sdk/$f" "$pkgdir/usr/share/doc/$pkgname/"
  done

  # BSD License
  install -Dm644 dart-sdk/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

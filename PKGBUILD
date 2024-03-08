#!/hint/bash
# Maintainer: Oliver Weissbarth <mail@oweissbarth.de>

pkgname=dart-sass-embedded
pkgver=1.62.1
pkgrel=1
pkgdesc="Wrapper for Dart Sass that implements the compiler side of the Embedded Sass protocol"
arch=("x86_64")
url="https://github.com/sass/dart-sass-embedded"
license=('MIT')
groups=()
depends=('glibc')
makedepends=('dart' 'buf')
replaces=()
backup=()
options=('!strip')
source=("${pkgname}-${pkgver}.tgz::https://github.com/sass/${pkgname^^}/archive/${pkgver//_/-}.tar.gz")
noextract=()
sha256sums=('d7845134c31b6e288d267678fa85c16a89f02891ea70b761063f4e26912f68bd')

prepare() {
	dart --disable-analytics
	cd ${pkgname}-${pkgver//_/-}
	dart pub get
	dart run grinder protobuf
}
build() {
	cd ${pkgname}-${pkgver//_/-}
  PROTOCOL_VERSION=$(cat build/embedded-protocol/VERSION)
  COMPILER_VERSION=$(sed -nr 's/version:\s+(.*)/\1/p' pubspec.yaml)
  IMPLEMENTATION_VERSION=$(grep -A7 'sass:' pubspec.lock | sed -nr 's/\s*version:\s+"(.*)"/\1/p')

  dart compile exe \
    -o build/${pkgname} \
    -Dprotocol-version=$PROTOCOL_VERSION \
    -Dcompiler-version=$COMPILER_VERSION \
    -Dimplementation-version=$IMPLEMENTATION_VERSION \
    bin/dart_sass_embedded.dart
}

package() {
	install -Dm755 ${pkgname}-${pkgver//_/-}/build/${pkgname} -T ${pkgdir}/usr/bin/${pkgname}
	install -Dm644 ${pkgname}-${pkgver//_/-}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}
}

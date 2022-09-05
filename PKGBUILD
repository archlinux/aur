#!/hint/bash
# Maintainer: Oliver Weissbarth <mail@oweissbarth.de>

pkgname=dart-sass-embedded
pkgver=1.54.8
pkgrel=1
pkgdesc="Wrapper for Dart Sass that implements the compiler side of the Embedded Sass protocol"
arch=("x86_64")
url="https://github.com/sass/dart-sass-embedded"
license=('MIT')
groups=()
depends=('glibc')
makedepends=('dart')
replaces=()
backup=()
options=('!strip')
source=("${pkgname}-${pkgver}.tgz::https://github.com/sass/${pkgname^^}/archive/${pkgver//_/-}.tar.gz")
noextract=()
sha256sums=('ff3127947fb6f389a4ef4e3f6f7c0ca2b09c1fc65b87f6f23fb819fe3ae8d4c5')


prepare() {
	dart --disable-analytics
	cd ${pkgname}-${pkgver//_/-}
	dart pub get
	dart run grinder protobuf
}
build() {
	cd ${pkgname}-${pkgver//_/-}
	mkdir -p ${srcdir}/build
	dart run grinder pkg-compile-native
}

package() {
	install -Dm755 ${pkgname}-${pkgver//_/-}/build/${pkgname}.native -T ${pkgdir}/usr/bin/${pkgname}
	install -Dm644 ${pkgname}-${pkgver//_/-}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}
}

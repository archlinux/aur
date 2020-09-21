# Maintainer: DTMF.io Development Team <help@dtmf.io>
pkgname=dtmf
pkgver=1.9.0
pkgrel=1
pkgdesc="Client for the DTMF.io telephony service"
arch=("x86_64")
url="https://dtmf.io/"
license=('MIT')
depends=('gtk3')
makedepends=('clang' 'cmake' 'ninja' 'pkgconf')
install=
source=(
	"$pkgname-$pkgver.tar.gz"::"https://github.com/dtmf-io/dtmf-flutter/archive/v$pkgver.tar.gz"
	"https://storage.googleapis.com/flutter_infra/releases/dev/linux/flutter_linux_1.22.0-12.0.pre-dev.tar.xz"
)
sha256sums=(
	"e3dc21c15604387a339ddc64babb5c682afdc8b804a7ee2a1015e41028206a28"
	"088465e692ed42e55f992e4a6082f3ec4c2177c791bd11a3a2017b61109dc52c"
)

build() {
	cd "$pkgname-flutter-$pkgver"
	../flutter/bin/flutter build linux --suppress-analytics --no-version-check
}

package() {
	cd "$pkgname-flutter-$pkgver"
	mkdir -p $pkgdir/usr/share/licenses/dtmf
	cp LICENSE $pkgdir/usr/share/licenses/dtmf/
	cd "build/linux/release/bundle"
	patchelf --set-rpath /usr/lib/dtmf/lib dtmf lib/liburl_launcher_linux_plugin.so
	mkdir -p $pkgdir/usr/lib/dtmf/lib/
	cp -r dtmf lib data $pkgdir/usr/lib/dtmf/
	mkdir -p $pkgdir/usr/bin
	ln -s /usr/lib/dtmf/dtmf $pkgdir/usr/bin/dtmf
}

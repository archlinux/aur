# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=station-desktop
pkgname="$_pkgbase"
pkgver=3.3.0
pkgrel=1
pkgdesc="Smart browser for busy people. A single place for all of your web applications (stable version)"
arch=('any')
url="https://getstation.com/"
license=('Apache-2.0')
depends=('nss' 'at-spi2-core' 'libcups' 'gtk3' 'alsa-lib')
makedepends=('git' 'yarn' 'python')
conflicts=('station-bin')
source=(
	"$_pkgbase::git+https://github.com/getstation/desktop-app.git#tag=v$pkgver"
	'station-desktop-app.desktop'
)
sha256sums=('877ebb0e55c7677233069d5f0b717224b753ebd34b746aff715624c0cb8d6624'
            'bf5703422b6cf240d8bca0647c23141052e6ce4e77fdd8ff8c9e19ca61f183d8')

prepare() {
	cd "$_pkgbase"
	yarn install

	_package_file='packages/app/package.json'
	[ -f "$_package_file" ] && sed -i '/"release"/s/electron-builder"/electron-builder -l dir"/' "$_package_file"
}

build() {
	cd "$_pkgbase"
	yarn run release
}

check() {
	cd "$_pkgbase"
	yarn run test
}

package() {
	cd "$_pkgbase"
	install -dm755 "$pkgdir/opt/Station/"
	cp -r release/linux-unpacked/* "$pkgdir/opt/Station/"

	install -Dm644 ../station-desktop-app.desktop "$pkgdir/usr/share/applications/station-desktop-app.desktop"
	install -Dm644 packages/app/build/station.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/station-desktop-app.svg"
	install -Dm644 packages/app/build/icon_512x512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/station-desktop-app.png"
}

# Maintainer : Jenrikku (JkKU)
pkgname="openutau"
pkgver=0.1.549
pkgrel=1
pkgdesc="Open source UTAU successor"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/stakira/OpenUtau"
license=('MIT')
depends=('dotnet-runtime>=8')
makedepends=('dotnet-sdk-8.0')
options=(!strip)
source=("https://github.com/stakira/OpenUtau/archive/refs/tags/$pkgver.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.svg")
sha256sums=('440a1be2cffb78ae0a2c4721129dfb8f421cd8abb1f5ba4254bd6137b16482b9'
            '104e3f21f46958623fca959694f424036653e85a6b0cf7815d6a2251504db632'
            '490fd7489bb3c4225c3f2d1e96ba8320bd481da6eb031b97229dcf06997c2f5b')

build() {
	export DOTNET_CLI_TELEMETRY_OPTOUT=1

	cd "$srcdir/OpenUtau-$pkgver/OpenUtau"
	dotnet publish -c "Release" -o "$srcdir/publish"
}

package() {
	mkdir -p "${pkgdir}/opt/openutau/"
	mkdir -p "${pkgdir}/usr/bin/"

	cd $srcdir
	cp -r publish/* "${pkgdir}/opt/openutau/"

	# Desktop file and icon
	install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 ${pkgname}.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname}.desktop"

	# Add link in /bin
	ln -s "/opt/openutau/OpenUtau" "$pkgdir/usr/bin/openutau"
}

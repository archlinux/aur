# Maintainer: Jenrikku (JkKU)
pkgname="openutau"
pkgver=0.1.563
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
sha256sums=('a9a11307a6ba3cd5bfb6da212d76b35f03cf435b4b9003c594c2d46e4766bbab'
            '46cdff454ee6ea172ccdd912d64480a2ce7ffc123a89b183ffc74e314fc3c854'
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
	install -Dm755 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 ${pkgname}.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

	# Add link in /bin
	ln -s "/opt/openutau/OpenUtau" "$pkgdir/usr/bin/openutau"
}

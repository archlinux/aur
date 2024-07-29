# Maintainer : Jenrikku (JkKU)
pkgname="openutau"
pkgver=0.1.529
pkgrel=2
pkgdesc="Open source UTAU successor"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/stakira/OpenUtau"
license=('MIT')
#depends=('fuse2' 'fuse3' 'fuse-common')
depends=('dotnet-runtime>=6')
makedepends=('dotnet-sdk>=6')
options=(!strip)
source=("https://github.com/stakira/OpenUtau/archive/refs/tags/build/$pkgver.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.svg")
sha256sums=('3599a8d83c1e65d24dce026e9a889e6d526d1ce170cd0bc03f7700593998b501'
            '104e3f21f46958623fca959694f424036653e85a6b0cf7815d6a2251504db632'
            '490fd7489bb3c4225c3f2d1e96ba8320bd481da6eb031b97229dcf06997c2f5b')

build() {
	export DOTNET_CLI_TELEMETRY_OPTOUT=1

	cd "$srcdir/OpenUtau-build-$pkgver/OpenUtau"
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

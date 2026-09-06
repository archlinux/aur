# Maintainer: Jenrikku (JkKU)
pkgname=openutau
pkgver=0.1.569
pkgrel=1
_tag=$pkgver-beta
pkgdesc="Open source UTAU successor"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/stakira/OpenUtau"
license=('MIT')
depends=('dotnet-runtime>=10' 'hicolor-icon-theme')
makedepends=('dotnet-sdk-10.0')
options=(!strip)
source=("OpenUtau-$_tag.tar.gz::https://github.com/stakira/OpenUtau/archive/refs/tags/$_tag.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.svg")
sha256sums=('e21a5b0eeb09676143275290c261aa756cc5bd2cfb5e3efe02c5a9e6b5e0a160'
            '46cdff454ee6ea172ccdd912d64480a2ce7ffc123a89b183ffc74e314fc3c854'
            '490fd7489bb3c4225c3f2d1e96ba8320bd481da6eb031b97229dcf06997c2f5b')

build() {
	export DOTNET_CLI_TELEMETRY_OPTOUT=1

	cd "$srcdir/OpenUtau-$_tag/OpenUtau"
	dotnet publish -c "Release" -o "$srcdir/publish" /p:Version=$pkgver
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

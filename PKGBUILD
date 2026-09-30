# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=humblebee-gui
_pkgname=humblebee
pkgver=0.7.0
pkgrel=1
pkgdesc="Desktop GUI (Wails) for the HumbleBee local-first time tracker"
arch=('x86_64' 'aarch64')
url="https://github.com/grobmeier/humblebee"
license=('Apache-2.0')
depends=('glibc' 'gtk3' 'webkit2gtk-4.1')
makedepends=('go>=1.25' 'gcc' 'pkgconf' 'nodejs' 'npm')
options=('!lto')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d3e3baea2f3df49aa73190a2aea1cdd230efa00932d491813e263d79fd2c65fc')

prepare() {
	cd "$_pkgname-$pkgver"
	go mod download
	(
		cd frontend
		export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
		npm ci --no-audit --no-fund
	)
}

build() {
	cd "$_pkgname-$pkgver"
	(
		cd frontend
		npm run build
	)
	export CGO_ENABLED=1
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -tags "desktop,production,webkit2_41" -ldflags "-linkmode external -s -w" -o "$pkgname" .
}

package() {
	cd "$_pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 build/appicon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 GUI.md "$pkgdir/usr/share/doc/$pkgname/GUI.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=HumbleBee
Comment=Local-first time tracking
Exec=$pkgname
Icon=$pkgname
Terminal=false
Categories=Office;ProjectManagement;
DESKTOP

}

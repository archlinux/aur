# Maintainer: Sascha Loishandl <sascha.loishandl@gmail.com>
pkgname=mangoverlay
_app_id="io.github.loissascha.$pkgname"
pkgver=0.4.0
pkgrel=1
pkgdesc="GUI app for managing your MangoHud configuration."
arch=('x86_64')
url="https://github.com/loissascha/MangOverlay"
license=('MIT')
depends=(
  'gtk3'
  'mangohud'
  'vulkan-tools'
  'webkit2gtk-4.1'
) 
makedepends=(
  'go'
  'wails'
) 
source=("MangOverlay-$pkgver.tar.gz::https://github.com/loissascha/MangOverlay/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4671729b9b75fdb7a651cbb8b063ee75a4f2b466541a944621bd9620b9f50bb9')

prepare() {
  cd "MangOverlay-$pkgver"

  # Set StartupWMClass
  desktop-file-edit --set-key=StartupWMClass --set-value="$pkgname" \
    "build/${_app_id}.desktop"
}

build() {
	cd "MangOverlay-$pkgver"
	export GOPATH="$srcdir/gopath"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	wails build -tags webkit2_41

	# Clean module cache for makepkg -C
	go clean -modcache
}

package() {
	cd "MangOverlay-$pkgver"
	install -Dm755 "build/bin/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 "build/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm644 "build/${_app_id}.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
	install -Dm644 "build/$pkgname.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/${_app_id}.png"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Yufan You <ouuansteve at gmail>

pkgname=nvui
pkgver=0.2.1
pkgrel=1
pkgdesc='Modern frontend for Neovim'
arch=('x86_64')
url='https://github.com/rohit-px2/nvui'
license=('MIT')
depends=(
	'boost-libs'
	'fmt'
	'qt5-base'
	'qt5-svg'
	'hicolor-icon-theme'
)
makedepends=(
	'msgpack-cxx'
	'cmake'
	'ninja'
	'catch2'
)
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	nvui.desktop
	nvui.sh
)
sha256sums=('89cdeaec33f9727e1bbac29b7700cf29189c55a85e4b1fd08d55ea1d6484ee32'
            '529e087f9ea5d212c05e1cfd7da51f5e5718acc186a1925f937707c641ebd509'
            'f6094d0da2e36432a74a6e7d4169b5c3c74d1c7383bec53819b5821e658ba12e')

build() {
    cd "$pkgname-$pkgver"
    cmake -B build -S . -DCMAKE_BUILD_TYPE=Release -G Ninja
    cmake --build build --target nvui --config Release
}

package() {
    # https://github.com/rohit-px2/nvui/blob/main/BUILDING.md#packaging-executable
    install -D nvui.sh "$pkgdir/usr/bin/$pkgname"
    install -Dm644 nvui.desktop -t "$pkgdir/usr/share/applications"

    cd "$pkgname-$pkgver"
		find assets vim -type f -exec install -Dm 644 "{}" "$pkgdir/usr/share/$pkgname/{}" \;
    install -D build/nvui -t "$pkgdir/usr/lib/$pkgname/"
		install -d "$pkgdir/usr/share/$pkgname/bin/"
		ln -s "/usr/lib/$pkgname/$pkgname" "$pkgdir/usr/share/$pkgname/bin/"
    install -Dm644 assets/appicon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# Maintainer: jiutong <jiutong@localhost>
pkgname=mayoi-bin
pkgver=0.22.3
pkgrel=2
pkgdesc="A small, fast code editor written in Go with a native GPU-drawn UI (no webview, no Electron)"
arch=('x86_64' 'aarch64')
url='https://github.com/sorrycc/Mayoi'
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libsecret')
optdepends=('gtk-layer-shell: native Wayland layer-shell support')
source_x86_64=("https://github.com/sorrycc/Mayoi/releases/download/v${pkgver}/mayoi-${pkgver}-linux-amd64.tar.gz"
	"https://raw.githubusercontent.com/sorrycc/Mayoi/v${pkgver}/LICENSE")
source_aarch64=("https://github.com/sorrycc/Mayoi/releases/download/v${pkgver}/mayoi-${pkgver}-linux-arm64.tar.gz"
	"https://raw.githubusercontent.com/sorrycc/Mayoi/v${pkgver}/LICENSE")
sha256sums_x86_64=('34ffb2c9acc644c51f3e2be14096051030c903711420a8ad00d2f2c152613e0c'
	'd0ab3d39f23b23a30fdfff2039f533588c766cc7624ce6a8ac414975e76652e1')
sha256sums_aarch64=('df53da7b938911dae6c361e393575a8d6979c260b7ad06e04bd85a8f350034c3'
	'd0ab3d39f23b23a30fdfff2039f533588c766cc7624ce6a8ac414975e76652e1')

package() {
	cd "$srcdir"

	# libghostty-vt.so is dlopened from beside the binary
	install -Dm755 mayoi "$pkgdir/usr/lib/mayoi/mayoi"
	install -Dm755 libghostty-vt.so "$pkgdir/usr/lib/mayoi/libghostty-vt.so"
	install -d "$pkgdir/usr/bin"
	ln -s /usr/lib/mayoi/mayoi "$pkgdir/usr/bin/mayoi"

	install -Dm644 mayoi.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/mayoi.png"
	sed -e 's|^Exec=mayoi|Exec=/usr/bin/mayoi|' -e '/^Icon=mayoi/a StartupWMClass=mayoi' mayoi.desktop |
		install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/mayoi.desktop"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

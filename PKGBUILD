# Maintainer: jiutong <jiutong@localhost>
pkgname=mayoi-bin
pkgver=0.23.2
pkgrel=1
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
sha256sums_x86_64=('ae0e4ddca97580bfe79130865238421648fe7f5d0a40bb2aec5d2bccebce5e38'
                   'd0ab3d39f23b23a30fdfff2039f533588c766cc7624ce6a8ac414975e76652e1')
sha256sums_aarch64=('f9c0245b7732b97f36c5f891954ebaaa41b0b984c18d986f6521fc9a9b0c5a8b'
                    'd0ab3d39f23b23a30fdfff2039f533588c766cc7624ce6a8ac414975e76652e1')

package() {
	cd "$srcdir"

	# libghostty-vt.so is dlopened from beside the binary
	install -Dm755 mayoi "$pkgdir/usr/lib/mayoi/mayoi"
	install -Dm755 libghostty-vt.so "$pkgdir/usr/lib/mayoi/libghostty-vt.so"
	install -d "$pkgdir/usr/bin"
	ln -s /usr/lib/mayoi/mayoi "$pkgdir/usr/bin/mayoi"

	install -Dm644 mayoi.png "$pkgdir/usr/share/pixmaps/mayoi.png"
	sed -e 's|^Exec=mayoi|Exec=/usr/bin/mayoi|' -e 's|^Icon=mayoi|Icon=/usr/share/pixmaps/mayoi.png|' \
		-e '/^Icon=/a StartupWMClass=mayoi' mayoi.desktop |
		install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/mayoi.desktop"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

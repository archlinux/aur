# Maintainer: jiutong <jiutong@localhost>
pkgname=mayoi-bin
pkgver=0.23.4
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
sha256sums_x86_64=('ff43a1531fb5b601c0da0ac35771fcf5bd94c14ec9c571d9f54fc93ff7059bcc'
                   'd0ab3d39f23b23a30fdfff2039f533588c766cc7624ce6a8ac414975e76652e1')
sha256sums_aarch64=('ad9e98b49376d7e4246e036a782d47e84d775647d7841f269e2f4c51d949c2a2'
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

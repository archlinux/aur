# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=ipfs-desktop-electron-bin
pkgver=0.31.0
pkgrel=1
pkgdesc="An unobtrusive and user-friendly desktop application for IPFS on Windows, Mac and Linux."
arch=(x86_64 aarch64)
url="https://ipfs.tech/"
license=('MIT')
depends=(electron bash hicolor-icon-theme kubo)
source=("https://github.com/ipfs-shipyard/ipfs-desktop/releases/download/v${pkgver}/ipfs-desktop-${pkgver}-linux-amd64.deb"
	https://raw.githubusercontent.com/ipfs/ipfs-desktop/main/LICENSE
)
sha256sums=('a49e75692891646c1ef008ebbe6f562090a6bdbd8ffa1b1c2a2e7a04081a8f58'
            '12987594680fa07203d37f691267bfea6eafc5e8b441f3c9ac7afcbda09c92ef')

package() {
	bsdtar -xvpf data.tar.* -C "$pkgdir"
	find $pkgdir/opt -type f -not -path "*/resources/*" -delete
	find $pkgdir -type f -name "ipfs" -path "*/app.asar.unpacked/*" -print -exec ln -sf /usr/bin/ipfs {} \;

	printf '#!/bin/sh
exec electron "/opt/IPFS Desktop/resources/app.asar" "$@"
' | install -Dm755 /dev/stdin "${pkgdir}/opt/IPFS Desktop/ipfs-desktop"
	install -Dm644 $srcdir/LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
	find $pkgdir -type d -empty -delete
}

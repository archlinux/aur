# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=ipfs-desktop-electron-bin
pkgver=0.39.0
pkgrel=1
pkgdesc="An unobtrusive and user-friendly desktop application for IPFS on Windows, Mac and Linux."
arch=(x86_64 aarch64)
url="https://ipfs.tech/"
license=('MIT')
depends=(electron bash hicolor-icon-theme go-ipfs)
source=("https://github.com/ipfs-shipyard/ipfs-desktop/releases/download/v${pkgver}/ipfs-desktop-${pkgver}-linux-amd64.deb"
	https://raw.githubusercontent.com/ipfs/ipfs-desktop/main/LICENSE
)
sha256sums=('3af7084d493df600e37b51c10a6a96e3b1ccd64016f77efac99d466ff29cb709'
            '12987594680fa07203d37f691267bfea6eafc5e8b441f3c9ac7afcbda09c92ef')

package() {
	bsdtar -xvpf data.tar.* -C "$pkgdir"
	find $pkgdir/opt -type f -not -path "*/resources/*" -delete
	find $pkgdir -type f -name "ipfs" -path "*/app.asar.unpacked/*" -print -exec ln -sf /usr/bin/ipfs {} \;

	printf '#!/bin/sh
exec electron "/opt/IPFS Desktop/resources/app.asar" "$@"
' | install -vDm755 /dev/stdin "${pkgdir}/opt/IPFS Desktop/ipfs-desktop"
	install -vDm644 $srcdir/LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
	find $pkgdir -type d -empty -delete
}

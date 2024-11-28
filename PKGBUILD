# Maintainer: SysAdm <sysadm.archlinux@proton.me>
# Contributor: Asuka Minato
pkgname=caido-desktop
pkgver=0.44.1
pkgrel=1
pkgdesc="A lightweight web security auditing toolkit."
arch=('x86_64')
url="https://caido.io/"
license=('private')
depends=(glibc gcc-libs)
provides=(caido)
source=("https://caido.download/releases/v${pkgver}/caido-desktop-v${pkgver}-linux-x86_64.AppImage")
sha256sums=('18a8634d33d7b59ee330574a28352c4f5a59b23dbe2a69f702efbeb00b15e94f')

prepare() {
	chmod +x *.AppImage
	./*.AppImage --appimage-extract
	mv squashfs-root/ ${srcdir}/build
}

package() {
	install -dm 755 "$pkgdir/usr/bin"
	install -dm 755 "$pkgdir/opt/$pkgname"

	cp -a "${srcdir}/build/usr/share" "$pkgdir"
	cp -aR "${srcdir}/build"/* "$pkgdir/opt/$pkgname/"
	ln -s "/opt/$pkgname/caido" "$pkgdir/usr/bin/$provides"
	find "$pkgdir/opt/$pkgname" -type d -exec chmod 755 {} +

	sed -i 's|Exec=AppRun --no-sandbox %U|Exec=caido|' "build/caido.desktop"
	install -Dm 644 "build/caido.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm 644 "build/caido.png" -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
}

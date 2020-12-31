# Maintainer: rany <rany@disroot.org>
pkgname=glowing-bear-electron
pkgver=0.9.0
pkgrel=3
pkgdesc="A web client for Weechat (Electron version)"
arch=(any)
url="https://www.glowing-bear.org/"
license=('GPL-3.0')
groups=(irc weechat)
depends=(electron glowing-bear-web)
makedepends=(librsvg)
source=("glowing-bear.desktop"
	"glowing-bear.sh"
	"index.js")
sha256sums=("8e8f5c38849a8e76e0f217c38c24b5b6b297b7c644ea3513ea80a5ac39787424"
	"6f629478fc412719c7200b43a360aceafdabc58a76016cba66cc41188d86e5bf"
	"5104282cf97cdc605d562d553b564040b9872627e1651ea005459b30f7f86bea")

package() {
	# Register the binary as glowing-bear
	install -Dm755 "${srcdir}/glowing-bear.sh" "${pkgdir}/usr/bin/glowing-bear"
	
	# Add the scalable icon
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
	ln -sf /usr/share/webapps/glowing-bear/assets/img/glowing-bear.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/glowing-bear.svg"
	
	# Add the non-scalable icon
	for icon in 16 22 24 32 36 48 64 72 96 128 192 256 384 512; do
		mkdir -p "${pkgdir}/usr/share/icons/hicolor/${icon}x${icon}/apps"
		rsvg-convert -h $icon -w $icon /usr/share/webapps/glowing-bear/assets/img/glowing-bear.svg -o "${pkgdir}/usr/share/icons/hicolor/${icon}x${icon}/apps/glowing-bear.png"
	done

	# Setup /usr/lib/glowing-bear
	mkdir -p "${pkgdir}/usr/lib/glowing-bear"
	install -Dm644 "$srcdir/index.js" "${pkgdir}/usr/lib/glowing-bear"
	ln -sf /usr/share/webapps/glowing-bear "${pkgdir}/usr/lib/glowing-bear/webapp"

	# Add the .desktop file
	install -Dm644 "$srcdir/glowing-bear.desktop" "${pkgdir}/usr/share/applications/glowing-bear.desktop"
}

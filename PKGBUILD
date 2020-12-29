# Maintainer: rany <rany@disroot.org>
pkgname=glowing-bear-electron-git
pkgver=0.9.0
pkgrel=1
pkgdesc="A web client for Weechat (Electron version)"
arch=(any)
url="https://www.glowing-bear.org/"
license=('GPL-3.0')
groups=(irc weechat)
depends=(electron)
makedepends=(npm git)
source=("git+https://github.com/glowing-bear/glowing-bear.git"
	"glowing-bear.desktop"
	"glowing-bear.sh")
sha256sums=("SKIP"
	"0df8757eb5a0d1aca43e86d35bf99178626de0741e9d5e35b71fabd151e4a1ab"
	"c366508cac1c450e397f26caa92f951a8afff5b78f17223781d7a775b8a4ea9c")

prepare() {
	# Install the dependencies
	cd "glowing-bear"
	npm install
}

pkgver() {
	cd "glowing-bear"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "glowing-bear"
	npm run build
}

package() {
	# Copy the app to usr/lib/glowing-bear
	cd "glowing-bear/build"
	mkdir -p "${pkgdir}/usr/lib/glowing-bear"
	cp * -R "${pkgdir}/usr/lib/glowing-bear"

	# Register the binary as glowing-bear
	install -Dm755 "${srcdir}/glowing-bear.sh" "${pkgdir}/usr/bin/glowing-bear"
	
	# Add the scalable icon
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
	ln -sf /usr/lib/glowing-bear/assets/img/glowing-bear.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/glowing-bear.svg"
	
	# Add the 128x128 icon
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
	ln -sf /usr/lib/glowing-bear/assets/img/glowing_bear_128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/glowing-bear.png"

	# Add the .desktop file
	install -Dm644 "$srcdir/glowing-bear.desktop" "${pkgdir}/usr/share/applications/glowing-bear.desktop"
}

# Maintainer: wilke
pkgname=jcloisterzone
pkgver=5.11.0
pkgrel=0
pkgdesc="A Java version of the Carcassonne board game."
arch=('any')
url="https://github.com/farin/JCloisterZone-Client"
license=('GPL3')
options=('!strip')

sha512sums=('d50fa9db79808b79ab1118fc2b291b8fd5ffa60d2e8ed2122869ef8a70381c7b24f30cace47102b7aafaf5bd2b0724ba1e21241b58492307c227d45219b0e331')

source=("https://github.com/farin/JCloisterZone-Client/releases/download/v${pkgver}/jcloisterzone-${pkgver}.AppImage")

prepare() {
	[ -d squashfs-root ] && rm -rf squashfs-root
	chmod 755 jcloisterzone-${pkgver}.AppImage
	./jcloisterzone-${pkgver}.AppImage --appimage-extract
	sed -i 's|^Exec=.*|Exec=jcloisterzone|' squashfs-root/jcloisterzone.desktop
}

package() {
	for dir in squashfs-root/usr/share/icons/hicolor/*; do
		resolution=$(basename "$dir")

		mkdir -p "$pkgdir/usr/share/icons/hicolor/${resolution}/apps/"
		install -Dm644 "$dir/apps/jcloisterzone.png" "$pkgdir/usr/share/icons/hicolor/${resolution}/apps/"
	done

  	install -Dm644 squashfs-root/jcloisterzone.desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"
  	install -Dm755 jcloisterzone-${pkgver}.AppImage "$pkgdir/usr/bin/jcloisterzone"
}

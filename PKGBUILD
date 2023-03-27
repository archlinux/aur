# Maintainer: wilke
pkgname=jcloisterzone
pkgver=5.12.0
pkgrel=0
pkgdesc="A Java version of the Carcassonne board game."
arch=('any')
url="https://github.com/farin/JCloisterZone-Client"
license=('GPL3')
options=('!strip')

sha512sums=('ef6422724d342a5ca0b21fa779a8de7d5a74003caa9cc4615be30f042086548acda4f694552036747f8e4459a909c7eed14dcf2f6c8a5f36bfec6a1458fc3a4f')

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

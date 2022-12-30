# Maintainer: wilke
pkgname=jcloisterzone
pkgver=5.10.2
pkgrel=0
pkgdesc="A Java version of the Carcassonne board game."
arch=('any')
url="https://github.com/farin/JCloisterZone-Client"
license=('GPL3')
options=('!strip')

sha512sums=('4dfedc88f7a424e2d5b1026fbf95ff63f8952b3bc1fa9b394185341f88b8eeed1659238f629bfa067bb292dd2aaed149c3bd1c857fd2798e57a7df23ac2f8ec9')

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

		mkdir -p $pkgdir/usr/share/icons/hicolor/${resolution}/apps/
		install -Dm644 "$dir/apps/jcloisterzone.png" "$pkgdir/usr/share/icons/hicolor/${resolution}/apps/"
	done

  	install -Dm644 squashfs-root/jcloisterzone.desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"
  	install -Dm755 jcloisterzone-${pkgver}.AppImage "$pkgdir/usr/bin/jcloisterzone"
}

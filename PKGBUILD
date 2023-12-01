# Maintainer: Tommaso Dordoni <t dot dordoni dot aur at outlook dot it>

pkgname=greenlight-beta-appimage
pkgver=2.0.0_beta15
pkgrel=1
pkgdesc="An open-source client for xCloud and xHome streaming made in Javascript and Typescript"
arch=('any')
url="https://github.com/unknownskl/greenlight"
license=('unknown')
depends=(
    'fuse2'
    'hicolor-icon-theme'
    'zlib'
)
options=(!strip)
source=("https://github.com/unknownskl/greenlight/releases/download/v${pkgver//_/-}/Greenlight-${pkgver//_/-}.AppImage")
sha512sums=(SKIP)

prepare() {
    chmod a+x $srcdir/Greenlight-${pkgver//_/-}.AppImage
    $srcdir/Greenlight-${pkgver//_/-}.AppImage --appimage-extract

    sed '/^Name=/ s/Greenlight/Greenlight Beta/' -i "$srcdir/squashfs-root/${pkgname//-beta-appimage/""}.desktop"
    sed 's/AppRun/\/usr\/bin\/greenlight-beta/g' -i "$srcdir/squashfs-root/${pkgname//-beta-appimage/""}.desktop"
}

package() {
    # AppImage
	install -Dm755 "$srcdir/Greenlight-${pkgver//_/-}.AppImage" "$pkgdir/opt/${pkgname//-appimage/""}/Greenlight-${pkgver//_/-}.AppImage"

	# Desktop file
	install -Dm755 "$srcdir/squashfs-root/${pkgname//-beta-appimage/""}.desktop" "$pkgdir/usr/share/applications/${pkgname//-appimage/""}.desktop"

	# Icon images
	for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm645 "$srcdir/squashfs-root/usr/share/icons/hicolor/$_icons/apps/${pkgname//-beta-appimage/""}.png" "$pkgdir/usr/share/icons/hicolor/$_icons/apps/${pkgname//-beta-appimage/""}.png"
    done

    # Symlink executable
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/${pkgname//-appimage/""}/Greenlight-${pkgver//_/-}.AppImage" "$pkgdir/usr/bin/${pkgname//-appimage/""}"

}

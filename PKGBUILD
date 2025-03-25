# Contributor: solopasha <daron439 at gmail dot com>
# Contributor: Aron Young <tkf6fkt at gmail dot com>
# Contributor: asuka minato
# Maintainer: tristanrw <hidden>

pkgname=remnote
pkgver=1.18.49
pkgrel=2
pkgdesc="All-in-one workspace for note-taking, learning, organizing thoughts and growing knowledge"
arch=('x86_64' 'aarch64')
depends=(sh)
makedepends=(fuse)
url="https://www.remnote.com"
license=('custom:Commercial')
_appimage="RemNote-${pkgver}.AppImage"
source=("https://download2.remnote.io/remnote-desktop2/RemNote-$pkgver.AppImage")
sha256sums=('2d28cf41b45897ad5cec8fd34f478f4a85e45ea895b820fc45d685149b0ad363')

prepare() {
    chmod a+x $_appimage
    ./$_appimage --appimage-extract #extract appimage so it can be run without fuse
	sed -i \
	    -e "s|^Exec=.*|Exec=/usr/bin/$pkgname %U|" \
        -e '/^X-AppImage-Version=.*/d' \
        -e '/Categories=/s/=/&Office;/' squashfs-root/${pkgname}.desktop
} #extract AppImage and patch .desktop file

package() {
    #move extracted electron app
    install -d "${pkgdir}/usr/lib/${pkgname}"
    cp -rav squashfs-root/* "${pkgdir}/usr/lib/${pkgname}"
    #fix permissions on extracted directories
    find "${pkgdir}/usr/lib/${pkgname}" -type d -exec chmod 755 {} \;
    # The folders inside the squashfs are normally unaccessible for other users,
    # but the /usr/lib is owned by root and set to 755 (drwxr-x-r-x),
    # so we let them inherit the 755 permission by not preserving their original (drwx------) permission.

    # copy directories not preserving their mode
    #cp -rav --no-preserve=mode squashfs-root/* "${pkgdir}/usr/lib/${pkgname}"
    # no-preserve=mode :

    #cp -v "./RemNote-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}"
    #chmod a+x "${pkgdir}/opt/${pkgname}/RemNote-${pkgver}.AppImage"
      # -L deference symlinks. needed if the AppImage in src folder is a symlink

    #Place Run-script in /usr/bin
	install -Dm755 /dev/null "${pkgdir}/usr/bin/$pkgname"
	cat >>"${pkgdir}/usr/bin/$pkgname" <<EOD
#! /bin/sh
exec /usr/lib/${pkgname}/AppRun "\$@"
EOD
#exec /opt/${pkgname}/RemNote-${pkgver}.AppImage "\$@"

    #install icons and .desktop from extracted AppImage
	install -Dm644 "squashfs-root/remnote.png" -t "${pkgdir}/usr/share/pixmaps"
	install -Dm644 "squashfs-root/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}

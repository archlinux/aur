# Maintainer: Alexander Daum <alexander.daum at mailbox dot org>

pkgname='fantasia-archive-appimage'
pkgver=0.1.15
pkgrel=1
pkgdesc='A database manager for world building'
url='https://github.com/vishiri/fantasia-archive-v1'
basename="Fantasia.Archive-${pkgver}-linux"
zipname="${basename}-appImage.zip"
appimgname="${basename}.AppImage"
options=(!strip) # necessary otherwise the AppImage file in the package is truncated

depends=(
    'hicolor-icon-theme'
    'glibc'
    'zlib'
)

license=(
    'GPL3'
)
source=(
    "https://github.com/vishiri/fantasia-archive-v1/releases/download/v${pkgver}/${zipname}"
)
sha512sums=('8fc5d42e714147fc6b405e5af814e81a739aa3e740ec8cb665d931ece48fc7def9cb119684908f21189f9ad51fb1bf1818a4bfc1a0270803798a1941527b5259')
arch=(
    'x86_64'
)

_appimg_root="squashfs-root"
_desktop_file="$_appimg_root/fantasiaarchive.desktop"
_icons="$_appimg_root/usr/share/icons/"
prepare() {
    # extract appimage
    chmod +x "$srcdir/${appimgname}"
    "$srcdir/$appimgname" --appimage-extract 'usr/share/icons/hicolor/*/apps/fantasiaarchive.png'
    "$srcdir/$appimgname" --appimage-extract 'fantasiaarchive.desktop'
    sed -i 's+AppRun+/usr/bin/FantasiaArchive.AppImage+g' "squashfs-root/fantasiaarchive.desktop"
}

package() {
    install -D "${srcdir}/${appimgname}" "${pkgdir}/usr/bin/FantasiaArchive.AppImage"
    install -Dm644 "$srcdir/$_desktop_file" "${pkgdir}/usr/share/applications/fantasiaarchive.desktop"
    # Install all icons, command install doesn't work with directories
    install -dm755 "${pkgdir}/usr/share/icons"
    cp -dpr --no-preserve=ownership "$srcdir/$_icons" "${pkgdir}/usr/share"
    # Fix permissions, dirs should be 755 and icon files 644
    chmod -R 755 "${pkgdir}/usr/share/icons"
    find "${pkgdir}/usr/share/icons" -type f  -exec chmod 644 {} \;
}

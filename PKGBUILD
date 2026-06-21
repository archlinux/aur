# Maintainer: reakjra <reakjra@proton.me>
pkgname=omikuji-bin
_pkgname=omikuji
pkgver=0.3.0
pkgrel=1
pkgdesc='Qt/QML based wine apps launcher for Linux'
arch=('x86_64')
url='https://github.com/reakjra/omikuji'
license=('GPL-3.0-or-later')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
optdepends=('plasma-integration: KDE Plasma theme integration')
options=('!strip')
_appimage="Omikuji-v${pkgver}-anylinux-x86_64.AppImage"
source=("$_appimage::${url}/releases/download/v${pkgver}/${_appimage}")
noextract=("$_appimage")
sha256sums=('2bad2f70ee38f15e2d770ecfbc2494abfb941435c35b6f806fc5ba8c1b8f6012')

package() {
    cd "$srcdir"
    chmod +x "$_appimage"
    "./$_appimage" --appimage-extract >/dev/null

    install -dm755 "$pkgdir/opt/$_pkgname"
    cp -a squashfs-root/. "$pkgdir/opt/$_pkgname/"

    # the AppImage bundles Qt6 plugins under shared/lib/qt6/plugins/ but does not include the KDE platform theme plugin.
    # so yeah. lets just symlink to the host's KDEPlasmaPlatformTheme6.so. Absolute brain damage but works right????
    install -dm755 "$pkgdir/opt/$_pkgname/shared/lib/qt6/plugins/platformthemes"
    ln -s /usr/lib/qt6/plugins/platformthemes/KDEPlasmaPlatformTheme6.so \
          "$pkgdir/opt/$_pkgname/shared/lib/qt6/plugins/platformthemes/"

    install -dm755 "$pkgdir/usr/bin"
    printf '#!/bin/sh\nARGV0=%s exec "/opt/%s/AppRun" "$@"\n' "$_pkgname" "$_pkgname" > "$pkgdir/usr/bin/$_pkgname"
    chmod 755 "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 "squashfs-root/io.github.reakjra.omikuji.desktop" \
        "$pkgdir/usr/share/applications/io.github.reakjra.omikuji.desktop"
    sed -i "s|^Exec=.*|Exec=$_pkgname|" "$pkgdir/usr/share/applications/io.github.reakjra.omikuji.desktop"
    install -Dm644 "squashfs-root/io.github.reakjra.omikuji.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/io.github.reakjra.omikuji.png"
}

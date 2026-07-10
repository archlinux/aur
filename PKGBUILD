# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Shayne Hartford <shayneehartford@gmail.com>

pkgname=wootility
_name=${pkgname^}
pkgver=5.3.2
pkgrel=1
pkgdesc='Utility for configuring Wooting keyboards'
arch=(x86_64)
url="https://wooting.io/$pkgname"
license=(unknown)
depends=(glibc fuse2 hicolor-icon-theme zlib)
options=(!strip !debug)
_appimage=$_name-$pkgver.AppImage
source=("$_appimage::https://api.wooting.io/public/$pkgname/download?os=linux&version=$pkgver"
        '70-wooting.rules')
noextract=($_appimage)
b2sums=('ca47f52e95ae71079abb97da9c51549e5443efc94894c9fa74c7ce9eb7f66be72995167886d3d89dcfdcb861b2f94324e806898590a24d05b8cc0a66ca5f7f2f'
        '80b4a516f8aafb6eada36cdde59295f2358b22e6cc28b1a21b0b5f22a59bcfabc63bba956d23544faca5fd76a1c4b4c1ff98ada41e7c9ad015d48c7c436dbac1')

prepare() {
    # Copy AppImage in case $SRCDEST is mounted with noexec
    cp $_appimage $_appimage.copy
    chmod +x $_appimage.copy
    ./$_appimage.copy --appimage-extract $pkgname.desktop
    ./$_appimage.copy --appimage-extract usr/share/icons
    rm $_appimage.copy

    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/$pkgname|" \
        "squashfs-root/$pkgname.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    install -Dm755 $_appimage -t "$pkgdir/opt/$_name"

    # Symlink executable
    install -d "$pkgdir/usr/bin/"
    ln -s /opt/$_name/$_appimage "$pkgdir/usr/bin/$pkgname"

    # Install desktop entry and icons
    install -Dm644 squashfs-root/$pkgname.desktop -t "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/"
    cp -a squashfs-root/usr/share/icons "$pkgdir/usr/share/"

    # Install udev rules
    install -Dm644 70-wooting.rules -t "$pkgdir/usr/lib/udev/rules.d"
}

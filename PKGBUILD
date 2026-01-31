# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Shayne Hartford <shayneehartford@gmail.com>

pkgname=wootility
_name=${pkgname^}
pkgver=5.2.4
pkgrel=1
pkgdesc='Utility for configuring Wooting keyboards'
arch=(x86_64)
url="https://wooting.io/$pkgname"
license=(unknown)
depends=(glibc fuse2 hicolor-icon-theme zlib)
options=(!strip)
_appimage=$_name-$pkgver.AppImage
source=("$_appimage::https://api.wooting.io/public/$pkgname/download?os=linux&version=$pkgver"
        '70-wooting.rules')
noextract=($_appimage)
b2sums=('2655b8c26504ca3716b96e1351e3339f06248ff1729ccfe7e51ed8a24198100d93e93b58d2fcbb8cb243170aa862900cd6223b80929b613238cd958c6f09c70e'
        '80b4a516f8aafb6eada36cdde59295f2358b22e6cc28b1a21b0b5f22a59bcfabc63bba956d23544faca5fd76a1c4b4c1ff98ada41e7c9ad015d48c7c436dbac1')

prepare() {
    # Copy AppImage in case $SRCDEST is mounted with noexec
    cp $_appimage $_appimage.copy
    chmod +x $_appimage.copy
    ./$_appimage.copy --appimage-extract $_name.desktop
    ./$_appimage.copy --appimage-extract usr/share/icons
    rm $_appimage.copy
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/$pkgname|" \
        "squashfs-root/$_name.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    install -Dm755 $_appimage -t "$pkgdir/opt/$_name"

    # Symlink executable
    install -d "$pkgdir/usr/bin/"
    ln -s /opt/$_name/$_appimage "$pkgdir/usr/bin/$pkgname"

    # Install desktop entry and icons
    install -Dm644 squashfs-root/$_name.desktop -t "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/"
    cp -a squashfs-root/usr/share/icons "$pkgdir/usr/share/"

    # Install udev rules
    install -Dm644 70-wooting.rules -t "$pkgdir/usr/lib/udev/rules.d"
}

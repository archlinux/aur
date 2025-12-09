# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Shayne Hartford <shayneehartford@gmail.com>

pkgname=wootility
_name=${pkgname^}
pkgver=5.2.1
pkgrel=1
pkgdesc='Utility for configuring Wooting keyboards'
arch=('x86_64')
url="https://wooting.io/$pkgname"
license=('unknown')
depends=('glibc' 'fuse2' 'hicolor-icon-theme' 'zlib')
options=(!strip)
_appimage=$_name-$pkgver.AppImage
source=("$_appimage::https://api.wooting.io/public/$pkgname/download?os=linux&version=$pkgver"
        '70-wooting.rules')
noextract=("$_appimage")
b2sums=('9ec878f56c76d73714a28fa4f9eae907ccbbfcb96db0a192e6da76edc3346f2d7f9ea84bb888911ad94f2f2946104c9bd0f570c558a396417dc8fb56d4903819'
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
    install -Dm755 $_appimage "$pkgdir/opt/$_name/$_appimage"

    # Symlink executable
    install -dm755 "$pkgdir/usr/bin/"
    ln -s /opt/$_name/$_appimage "$pkgdir/usr/bin/$pkgname"

    # Install desktop entry and icons
    install -Dm644 squashfs-root/$_name.desktop "$pkgdir/usr/share/applications/$_name.desktop"
    install -dm755 "$pkgdir/usr/share/"
    cp -a squashfs-root/usr/share/icons "$pkgdir/usr/share/"

    # Install udev rules
    install -Dm644 70-wooting.rules "$pkgdir/usr/lib/udev/rules.d/70-wooting.rules"
}

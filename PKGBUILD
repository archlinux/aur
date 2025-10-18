# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Shayne Hartford <shayneehartford@gmail.com>

pkgname=wootility
pkgver=5.1.2
pkgrel=1
pkgdesc='Utility for configuring Wooting keyboards'
arch=('x86_64')
url="https://wooting.io/$pkgname"
license=('unknown')
depends=('glibc' 'fuse2' 'hicolor-icon-theme' 'zlib')
options=(!strip)
install=$pkgname.install
_appimage=$pkgname-$pkgver.AppImage
source=("$_appimage::https://api.wooting.io/public/$pkgname/download?os=linux&version=$pkgver"
        '70-wooting.rules')
noextract=("$_appimage")
b2sums=('b19310837e29143f4b1adeddf97e92c77560b062ce3df82f78bd246febdfdc4706d6ffd8dda173ef10c5737607a8451e021480062a9e96d936274c90be0dea9c'
        '80b4a516f8aafb6eada36cdde59295f2358b22e6cc28b1a21b0b5f22a59bcfabc63bba956d23544faca5fd76a1c4b4c1ff98ada41e7c9ad015d48c7c436dbac1')

prepare() {
    # Copy AppImage in case $SRCDEST is mounted with noexec
    cp $_appimage $_appimage.copy
    chmod +x $_appimage.copy
    ./$_appimage.copy --appimage-extract $pkgname.desktop
    ./$_appimage.copy --appimage-extract usr/share/icons
    rm $_appimage.copy
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/$pkgname|" \
        "squashfs-root/$pkgname.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    install -Dm755 $_appimage "$pkgdir/opt/$pkgname/$_appimage"

    # Symlink executable
    install -dm755 "$pkgdir/usr/bin/"
    ln -s /opt/$pkgname/$_appimage "$pkgdir/usr/bin/$pkgname"

    # Install desktop entry and icons
    install -Dm644 "squashfs-root/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -dm755 "$pkgdir/usr/share/"
    cp -a squashfs-root/usr/share/icons "$pkgdir/usr/share/"

    # Install udev rules
    install -Dm644 70-wooting.rules "$pkgdir/usr/lib/udev/rules.d/70-wooting.rules"
}

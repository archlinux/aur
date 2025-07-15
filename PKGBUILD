# Maintainer: AlphaLynx <AlphaLynx at protonmail dot com>
# Contributor: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Shayne Hartford <shayneehartford@gmail.com>

pkgname=wootility-appimage
_name=${pkgname%-appimage}
pkgver=5.0.6
pkgrel=1
pkgdesc='Utility for configuring Wooting keyboards'
arch=('x86_64')
url="https://wooting.io/$_name"
license=('unknown')
depends=('fuse2' 'hicolor-icon-theme' 'zlib')
provides=("$_name")
conflicts=("$_name")
options=('!strip')
install=$_name.install
_appimage=$_name-$pkgver.AppImage
source=("$_appimage::https://api.wooting.io/public/$_name/download?os=linux&version=$pkgver"
        '70-wooting.rules')
noextract=("$_appimage")
b2sums=('01f4997054be96dcbee8bbb6d4f68874d23bb1507898337e4e4165c6c417f183cca947b4d7fb98e2500a4c85011e95b1d2d45c993aa1949bb5122452d97367d9'
        '80b4a516f8aafb6eada36cdde59295f2358b22e6cc28b1a21b0b5f22a59bcfabc63bba956d23544faca5fd76a1c4b4c1ff98ada41e7c9ad015d48c7c436dbac1')

prepare() {
    chmod +x $_appimage
    ./$_appimage --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/$_name|" \
        "squashfs-root/$_name.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    install -Dm755 $_appimage "$pkgdir/opt/$_name/$_appimage"

    # Symlink executable
    install -dm755 "$pkgdir/usr/bin/"
    ln -s /opt/$_name/$_appimage "$pkgdir/usr/bin/$_name"

    # Install desktop entry and icons
    install -Dm644 "squashfs-root/$_name.desktop" "$pkgdir/usr/share/applications/$_name.desktop"
    install -dm755 "$pkgdir/usr/share/"
    cp -a squashfs-root/usr/share/icons "$pkgdir/usr/share/"

    # Install udev rules
    install -Dm644 70-wooting.rules "$pkgdir/usr/lib/udev/rules.d/70-wooting.rules"
}

# Maintainer: Michael Hupf <michihupf at protonmail dot com>
_pkgname=cs-demo-manager
pkgname=$_pkgname-appimage
pkgver=3.16.3
pkgrel=1
pkgdesc="Companion application for Counter-Strike demos."
arch=('any')
url="https://cs-demo-manager.com/"
license=('MIT')
depends=('postgresql')
options=('!strip')
_appimage="CS-Demo-Manager-$pkgver.AppImage"
noextract=("$_appimage")
source=("$_appimage::https://github.com/akiver/$_pkgname/releases/download/v$pkgver/$_appimage"
    "AKIVER_LICENSE::https://raw.githubusercontent.com/akiver/$_pkgname/refs/tags/v$pkgver/LICENSE"
    )
sha256sums=('ffc39478b2eb4f2caec0751e9a8efeac986b45363b17dc5b8aa6d37aff3a921b'
            '13c63653c5aab89a5515ebb31b6c1dd518006cf7bd8d30e157007ab04aee1f93')

prepare() {
    chmod +x "$_appimage"
    ./"$_appimage" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|AppRun|/usr/bin/$_pkgname|"\
        "squashfs-root/$_pkgname.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "$srcdir/$_appimage" "$pkgdir/opt/$pkgname/$pkgname.AppImage"

    # Desktop file
    install -Dm644 "$srcdir/squashfs-root/$_pkgname.desktop"\
            "$pkgdir/usr/share/applications/$_pkgname.desktop"

    # Icon images
    install -dm755 "$pkgdir/usr/share/"
    cp -a "$srcdir/squashfs-root/usr/share/icons" "$pkgdir/usr/share/"

    # Symlink image
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/$pkgname.AppImage" "$pkgdir/usr/bin/$_pkgname"

    # Licenses
    install -Dm644 "$srcdir/AKIVER_LICENSE"\
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/squashfs-root/LICENSE.electron.txt"\
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
    install -Dm644 "$srcdir/squashfs-root/LICENSES.chromium.html"\
        "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}

# Maintainer: AlphaLynx <alphalynx@protonmail.com>
# Contributor: rbagpksr <rbagpksr@mailer.me>

pkgname=jan-appimage
_name=jan
pkgver=0.5.15
pkgrel=2
pkgdesc='An open source alternative to ChatGPT that runs 100% offline on your computer'
arch=('x86_64')
url='https://jan.ai/'
license=('AGPL-3.0-only')
depends=('fuse2' 'hicolor-icon-theme' 'zlib')
provides=("$_name")
conflicts=("$_name")
options=(!strip)
_appimage="$pkgname-$pkgver.AppImage"
source_x86_64=("$_appimage::https://github.com/janhq/$_name/releases/download/v$pkgver/jan-linux-x86_64-$pkgver.AppImage")

noextract=("$_appimage")
sha512sums_x86_64=('e5a38de72357c796f998ab0ffc6542cc340a0864ac4967911e56e3c349178c2238e8b19853861827bb37d80c636d6ab1e00f644a9d98e92c837cff72e7585273')

prepare() {
    chmod +x "$_appimage"
    ./"$_appimage" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/$_name|" "squashfs-root/$_name.desktop"

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "$srcdir/$_appimage" "$pkgdir/opt/$_name/$_name.AppImage"
    
    # Desktop file
    install -Dm644 "$srcdir/squashfs-root/$_name.desktop" "$pkgdir/usr/share/applications/$_name.desktop"

    # Icon images
    install -dm755 "$pkgdir/usr/share/"
    cp -a "$srcdir/squashfs-root/usr/share/icons" "$pkgdir/usr/share/"

    # Symlink executable
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_name/$_name.AppImage" "$pkgdir/usr/bin/$_name"
}

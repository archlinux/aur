# Maintainer: redponike <proton (dot) me>
# Contributor: AlphaLynx <alphalynx@protonmail.com>
# Contributor: rbagpksr <rbagpksr@mailer.me>

pkgname=jan-appimage
_name=${pkgname%%-*}
pkgver=0.5.16
pkgrel=1
pkgdesc='An open source alternative to ChatGPT that runs 100% offline on your computer'
arch=('x86_64')
url='https://jan.ai/'
license=('AGPL-3.0-only')
depends=('fuse2' 'hicolor-icon-theme' 'zlib')
provides=("jan")
conflicts=("jan-bin" "jan")
options=(!strip)
_appimage="$pkgname-$pkgver.AppImage"
source=("$_appimage::https://github.com/menloresearch/$_name/releases/download/v$pkgver/$_name-linux-x86_64-$pkgver.AppImage")
sha256sums=('a0a2525fc56e092fc2cc8ae8618cee12dc9fbe2bf79dac58afc8e97d471cc418')
noextract=("$_appimage")

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

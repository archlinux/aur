# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=kiro-crew-bin
_name=${pkgname%-bin}
pkgver=0.2.0
pkgrel=1
pkgdesc='A persistent workspace for development work that self-improves and continues beyond one session'
arch=(x86_64)
url=https://kiro.dev/crew
license=(Apache-2.0)
depends=(alsa-lib
         at-spi2-core
         cairo
         dbus
         expat
         glib2
         glibc
         gtk3
         hicolor-icon-theme
         kiro-cli
         libcups
         libgcc
         libstdc++
         libx11
         libxcb
         libxcomposite
         libxdamage
         libxext
         libxfixes
         libxkbcommon
         libxrandr
         mesa
         nspr
         nss
         pango
         systemd-libs
         zlib)
makedepends=(imagemagick)
provides=($_name)
conflicts=($_name)
options=(!strip !debug)
_appimage=KiroCrew-$pkgver.AppImage
source=(https://github.com/kirodotdev/KiroCrew/releases/download/v$pkgver/$_appimage)
b2sums=('a3b5023aa873e651ea3a582da37cc07358f0734aed2ee5ec38a6679d94d58ab96ff03730fc3caf8fb962fd7ba15c306b108a7d8970a1701bff17f585402e8d8e')

prepare() {
    local _appname=kirocrew-electron-mac

    # Copy AppImage in case $SRCDEST is mounted with noexec
    cp $_appimage $_appimage.copy
    chmod +x $_appimage.copy
    ./$_appimage.copy --appimage-extract
    rm $_appimage.copy

    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|^Exec=.*|Exec=/usr/bin/$_name %U|;s|^Icon=.*|Icon=$_name|" \
        squashfs-root/$_appname.desktop

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a+rX squashfs-root
    chmod u+s squashfs-root/chrome-sandbox

    magick squashfs-root/usr/share/icons/hicolor/1024x1024/apps/$_appname.png \
        -resize 512x512 $_name.png

    mv squashfs-root/$_appname squashfs-root/$_name
    mv squashfs-root/$_appname.desktop $_name.desktop
    magick squashfs-root/usr/share/icons/hicolor/1024x1024/apps/$_appname.png \
        -resize 512x512 $_name.png
    mv squashfs-root/LICENSE.electron.txt squashfs-root/LICENSES.chromium.html .

    rm -f squashfs-root/{$_appname.png,AppRun,.DirIcon}
    rm -r squashfs-root/usr/share
    rm -r squashfs-root/resources/backend-dist/kirocrew-backend/lib/python3.12/site-packages/kiro_crew/_vendor/llama_cpp_libs/{linux_aarch64,macos_arm64,macos_x86_64,win_amd64}
}

package() {
    install -d "$pkgdir/opt/$_name"
    cp -a squashfs-root/. "$pkgdir/opt/$_name/"

    install -d "$pkgdir/usr/bin"
    ln -s /opt/$_name/$_name "$pkgdir/usr/bin/$_name"

    install -Dm644 $_name.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 $_name.png -t "$pkgdir/usr/share/icons/hicolor/1024x1024/apps"
    install -Dm644 LICENSE.electron.txt LICENSES.chromium.html \
        -t "$pkgdir/usr/share/licenses/$pkgname"
}

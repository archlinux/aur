# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=kiro-crew-bin
_name=${pkgname%-bin}
pkgver=0.3.0
pkgrel=1
pkgdesc='A persistent workspace for development work that self-improves and continues beyond one session'
arch=(aarch64 x86_64)
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
provides=($_name)
conflicts=($_name)
options=(!strip !debug)
source_aarch64=($pkgname-$pkgver-aarch64.AppImage::https://github.com/kirodotdev/KiroCrew/releases/download/v$pkgver/KiroCrew-aarch64.AppImage)
source_x86_64=($pkgname-$pkgver-x86_64.AppImage::https://github.com/kirodotdev/KiroCrew/releases/download/v$pkgver/KiroCrew-x86_64.AppImage)
b2sums_aarch64=('7d3f184186bf0a3ad62ea6e54f25a0e1c33018282a88982951553d1c40e73953b0ea433ed640e5752170cf75fdc9c8a256030c93cd964471ce8904c96ce07cac')
b2sums_x86_64=('b7a76ac80f2d552f22e15097d0c84599be44a17f6bede6a88d2b8e65c54a78e11d782372fafd64d63e723a616a054e79699d42ec17b321a5bc115dad2c75ede8')

prepare() {
    local appname=kirocrew-electron-mac
    local appimage=$pkgname-$pkgver-$CARCH.AppImage

    # Copy AppImage in case $SRCDEST is mounted with noexec
    cp $appimage $appimage.copy
    chmod +x $appimage.copy
    ./$appimage.copy --appimage-extract
    rm $appimage.copy

    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|^Exec=.*|Exec=/usr/bin/$_name %U|;s|^Icon=.*|Icon=$_name|" \
        squashfs-root/$appname.desktop

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a+rX squashfs-root
    chmod u+s squashfs-root/chrome-sandbox

    mv squashfs-root/$appname squashfs-root/$_name
    mv squashfs-root/$appname.desktop $_name.desktop
    mv squashfs-root/LICENSE.electron.txt squashfs-root/LICENSES.chromium.html .
    mv squashfs-root/usr/share/icons .
    rename $appname $_name icons/hicolor/*/apps/$appname.png

    rm -f squashfs-root/{$appname.png,AppRun,.DirIcon}
    rm -r squashfs-root/usr/share
    find squashfs-root/resources/backend-dist/kirocrew-backend/lib/python3.12/site-packages/kiro_crew/_vendor/llama_cpp_libs \
        -mindepth 1 -maxdepth 1 -type d ! -name linux_$CARCH -exec rm -r {} +
}

package() {
    install -d "$pkgdir/opt/$_name"
    cp -a squashfs-root/. "$pkgdir/opt/$_name/"

    install -d "$pkgdir/usr/bin"
    ln -s /opt/$_name/$_name "$pkgdir/usr/bin/$_name"

    install -Dm644 $_name.desktop -t "$pkgdir/usr/share/applications"
    cp -a icons "$pkgdir/usr/share"
    install -Dm644 LICENSE.electron.txt LICENSES.chromium.html \
        -t "$pkgdir/usr/share/licenses/$pkgname"
}

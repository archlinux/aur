# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=kiro-crew-bin
_name=${pkgname%-bin}
pkgver=0.6.0
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
source_aarch64=($pkgname-$pkgver-aarch64.AppImage::https://github.com/kirodotdev/KiroCrew/releases/download/v$pkgver/KiroCrew-$pkgver-arm64.AppImage)
source_x86_64=($pkgname-$pkgver-x86_64.AppImage::https://github.com/kirodotdev/KiroCrew/releases/download/v$pkgver/KiroCrew-$pkgver-x86_64.AppImage)
b2sums_aarch64=('d21d8614613cbe5b66e43dc9bcea528a2f29ce36ed17db446329a6ca5fdfbe69867d5de25981ba2a40df8dde1b820ba604cfb8193516699618376262431ac669')
b2sums_x86_64=('ebe1be47de95d5c0efd96ade3c0599f602e25108f35d05e43747fdd998ef77991b05101832370cfcf0608fd260b3fe02acae75f232648d770c3c3361dfccd7af')

prepare() {
    local appname=kirocrew-desktop
    local appimage=$pkgname-$pkgver-$CARCH.AppImage

    # Copy AppImage in case $SRCDEST is mounted with noexec
    cp $appimage $appimage.copy
    chmod +x $appimage.copy
    ./$appimage.copy --appimage-extract
    rm $appimage.copy

    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|^Exec=.*|Exec=/usr/bin/$_name %U|;s|^Icon=.*|Icon=$_name|;s|^StartupWMClass=.*|StartupWMClass=$_name|" \
        squashfs-root/$appname.desktop

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a+rX squashfs-root
    chmod u+s squashfs-root/chrome-sandbox

    mv squashfs-root/$appname squashfs-root/$_name
    mv squashfs-root/$appname.desktop $_name.desktop
    mv squashfs-root/LICENSE.electron.txt squashfs-root/LICENSES.chromium.html .
    mv squashfs-root/usr/share/icons .
    rename $appname $_name icons/hicolor/*/apps/$appname.png

    rm squashfs-root/resources/app-update.yml
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

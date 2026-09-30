# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=kiro-crew-bin
_name=${pkgname%-bin}
pkgver=0.7.2
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
b2sums_aarch64=('1a0ad9e5e4efa0e9fd7a1a2a103ff14dc12e4e83a9fed7901640c21c15469e59f9c1b60c36c0e8c5b98a226487a50cbcb0c30bd0f82cccc937b145b1497d0716')
b2sums_x86_64=('2edc0c3d89aefd38d5ce11b92fc090943d9ad207db7b4f70b039574d0c02375c0083c0ede26a2b2d65627d8d6727013bc5b02985f323470d3e3bf25a656adacf')

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

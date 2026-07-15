# Maintainer: Saba Goginashvili <mindhardware@protonmail.com>

# WARNING:
# For qt5-webengine, qt5webchannel and qt5-location, to avoid compiling them
# is highly recommended to install via pacman -U downloading the .okg.tar.zst
# from CachyOS mirror (https://mirror.cachyos.org/repo/x86_64/cachyos/) searching them.
# If you use aurutils, it's important to import the packages to the custom database.
pkgname=stremio-bin
pkgver=4.4.168
pkgrel=1
pkgdesc="Freedom to Stream. Streaming client for free, with addons"
arch=('x86_64')
url="https://stremio.com"
license=('custom')
depends=(
    'mpv'
    'nodejs'
    'qt5-webchannel'
    'qt5-location'
    'qt5-webengine'
    'qt5-translations'
    'qt5-quickcontrols'
    'qt5-quickcontrols2'
    'openssl-1.1'
    'hicolor-icon-theme'
)
makedepends=('patchelf')
provides=("${pkgname}")
conflicts=("stremio")
source=("https://dl.strem.io/shell-linux/v${pkgver}/stremio_${pkgver}-1_amd64.deb")
b2sums=('5cef04a9acc5eb1a5cc9504971bfb72d73c8271076fe615ba2033cd9413b666ddd448d1b806828be2068ed8af501507128d14ad6fddaeaf6c901ec547806818b')
prepare() {
    cd "$srcdir"
    bsdtar -xf data.tar.*
    patchelf --replace-needed libmpv.so.1 libmpv.so.2 "$srcdir/opt/stremio/stremio"
}
package() {
    cp -r "$srcdir/opt" "$pkgdir"
    mkdir -p "$pkgdir/usr/bin"
    ln -sf /opt/stremio/stremio "$pkgdir/usr/bin/stremio"
    mkdir -p "$pkgdir/usr/share/applications"
    cp "$pkgdir/opt/stremio/smartcode-stremio.desktop" "$pkgdir/usr/share/applications/stremio.desktop"
    regex="([^_]+)_([0-9]+).png$"
    for file in *.png
    do
        if [[ $file =~ $regex ]]
        then
            icon="${BASH_REMATCH[1]##*/}"
            size="${BASH_REMATCH[2]}"
            mkdir -p "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
            cp "$file" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/${icon}.png"
        fi
    done
}

# Maintainer: ZeroWeb <zeroweb91 at protonmail dot com>
# Contributors: Det, Achilleas Pipinellis, speed145a, Schnouki

_launcher_ver=6
pkgname=ungoogled-chromium-bin
pkgver=65.0.3325.181
pkgrel=3
pkgdesc="Modifications to Google Chromium for removing Google integration and enhancing privacy, control, and transparency (binary version)"
arch=("x86_64")
url="https://github.com/Eloston/ungoogled-chromium"
license=("BSD")
depends=("libjpeg6-turbo" "icu57" "libevent-compat" "nss" "libxss" "snappy" "gtk3" "minizip"
         "libxslt" "ffmpeg" "re2")
provides=("chromium")
conflicts=("chromium" "iridium" "ungoogled-chromium")
optdepends=("gnome-keyring: for storing passwords in GNOME keyring"
            "kdialog: needed for file dialogs in KDE"
            "kwallet: for storing passwords in KWallet"
            "pepper-flash: support for Flash content")
source=("ungoogled-chromium.deb::https://github.com/Eloston/ungoogled-chromium-binaries/releases/download/${pkgver}-1/ungoogled-chromium_${pkgver}-1.stretch_amd64.deb"
        "ungoogled-chromium-common.deb::https://github.com/Eloston/ungoogled-chromium-binaries/releases/download/${pkgver}-1/ungoogled-chromium-common_${pkgver}-1.stretch_amd64.deb"
        "ungoogled-chromium-driver.deb::https://github.com/Eloston/ungoogled-chromium-binaries/releases/download/${pkgver}-1/ungoogled-chromium-driver_${pkgver}-1.stretch_amd64.deb"
        "ungoogled-chromium-widevine.deb::https://github.com/Eloston/ungoogled-chromium-binaries/releases/download/${pkgver}-1/ungoogled-chromium-widevine_${pkgver}-1.stretch_amd64.deb"
        "chromium-launcher-$_launcher_ver.tar.gz::https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver.tar.gz")
noextract=("ungoogled-chromium-common.deb"
           "ungoogled-chromium-driver.deb"
           "ungoogled-chromium-widevine.deb")
sha256sums=("bbfe1c3e142d51bfda93955d2dd31edce835617777c7c0ab81f08e3889d4754f"
            "d82738a78e535905a9507ab6cd2f1d4b74d1e1e88fa9d4fd3a8a430ded46e15f"
            "015406b4362c54b6df712e42dcac1c63db7ae577509d65464c9196b7c5edca43"
            "46a1b7bae44134eafe0531aa4d3e786c99101fefd973e2afa1f991d8097fa8e0"
            "04917e3cd4307d8e31bfb0027a5dce6d086edb10ff8a716024fbb8bb0c7dccf1")

declare -ga _debfiles=("common" "driver" "widevine")

prepare() {
    # Decompress deb files
    for deb in "${_debfiles[@]}"
    do
        mkdir "${srcdir}/${deb}"
        cd $_
        bsdtar -x -f ../ungoogled-chromium-"$deb".deb
        tar -xf data.tar.xz
        cd ${srcdir}
    done

    # Decompress browser files
    tar -xf data.tar.xz
}

build() {
    make -C chromium-launcher-$_launcher_ver
}

package() {
    cd chromium-launcher-$_launcher_ver
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/chromium/LICENSE.launcher"

    cd ${srcdir}

    install -d "${pkgdir}/usr/lib/chromium"
    cp -r usr/lib/chromium/* "${pkgdir}/usr/lib/chromium"

    install -d "${pkgdir}/usr/share/icons"
    cp -r usr/share/icons/* "${pkgdir}/usr/share/icons"

    install -d "${pkgdir}/usr/share/man"
    cp -r usr/share/man/* "${pkgdir}/usr/share/man"

    install -d "${pkgdir}/usr/share/applications"
    cp -r usr/share/applications/* "${pkgdir}/usr/share/applications"

    # Install files from additional debs
    for deb in "${_debfiles[@]}"
    do
        cp -r "${srcdir}/${deb}/usr/lib/chromium"/* "${pkgdir}/usr/lib/chromium"
    done

    # Needed symlinks
    ln -s /usr/lib/libre2.so.0.0.0 ${pkgdir}/usr/lib/libre2.so.3
    ln -s /usr/lib/libwebp.so.7.0.1 ${pkgdir}/usr/lib/libwebp.so.6
    ln -s /usr/lib/libwebpmux.so.3.0.1 ${pkgdir}/usr/lib/libwebpmux.so.2

    # Chromium won't start without correct permissions
    chmod 4755 ${pkgdir}/usr/lib/chromium/chrome-sandbox
}


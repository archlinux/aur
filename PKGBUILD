# Maintainer: ZeroWeb <zeroweb91 at protonmail dot com>
# Contributors: Det, Achilleas Pipinellis, speed145a, Schnouki

_launcher_ver=6
pkgname=ungoogled-chromium-bin
pkgver=66.0.3359.139
pkgrel=3
pkgdesc="Modifications to Google Chromium for removing Google integration and enhancing privacy, control, and transparency (binary version)"
arch=("x86_64")
url="https://github.com/Eloston/ungoogled-chromium"
license=("BSD")
depends=("libjpeg6-turbo" "icu57" "libevent-compat" "nss" "libxss" "snappy" "gtk3" "minizip"
        "libxslt" "ffmpeg" "re2" "ffmpeg-compat-57")
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
sha256sums=("ccaab2c4e395167de8a92288086b4f91ed9ff55c3a53ce966a1a17acbd3eb6df"
            "ff2a7191bd3e9dd2ff4cf6d6b70184d26731cdf3ef83c4f8dd561d1c4438c2ad"
            "e207b7a5fa7b0f35f6e7391d5544f4b088ff7da39c472d81c64f0983cff6c64f"
            "62df3521f265a9333b6f41629baf888863e854966bd3954f27c94ad637514e58"
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
    ln -s /usr/lib/libwebp.so.7.0.2 ${pkgdir}/usr/lib/libwebp.so.6
    ln -s /usr/lib/libwebpmux.so.3.0.2 ${pkgdir}/usr/lib/libwebpmux.so.2
    ln -s /usr/lib/libvpx.so.5.0.0 ${pkgdir}/usr/lib/libvpx.so.4

    # Add link to chromedriver
    ln -s /usr/lib/chromium/chromedriver ${pkgdir}/usr/bin/chromedriver

    # Chromium won't start without correct permissions
    chmod 4755 ${pkgdir}/usr/lib/chromium/chrome-sandbox
}


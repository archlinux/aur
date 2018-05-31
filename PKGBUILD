# Maintainer: Evrea <evrea at cock dot li>
# Contributors: Det, Achilleas Pipinellis, speed145a, Schnouki

_launcher_ver=6
pkgname=ungoogled-chromium-bin
pkgver=66.0.3359.181
pkgrel=1
pkgdesc="Modifications to Google Chromium for removing Google integration and enhancing privacy, control, and transparency (binary version)"
arch=("x86_64")
url="https://github.com/Eloston/ungoogled-chromium"
license=("BSD")
depends=("libjpeg6-turbo" "icu57" "libevent-compat" "nss" "libxss" "snappy" "gtk3" "minizip"
        "libxslt" "re2" "ffmpeg-compat-57")
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
sha256sums=("93cd390ac76b7d7605a9ac7e1506a435f61bc89d1224c9925c2a0e76f2874bf1"
            "b4763a78b5440f42883c0589ceca00758b48700f85ae09852ca85f9a1b81ff5f"
            "de480d719262818550b28462e5296b6f0f3a6f903437b149390095ab419692b8"
            "2c5a1b059a5aedddabf53bbcf7ff3f3566d55070dbd75cbdbac70483b68719b3"
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


#!/bin/bash
# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>

pkgname=d.launcher2
pkgver=2.0.0.4
pkgrel=1
pkgdesc="Application for Qualified Electronic Signature"
arch=(
    x86_64
)
url=https://www.slovensko.sk/sk/na-stiahnutie
license=(
    custom
)
depends=(
    gcc-libs
    glibc
    libzip
    openssl-1.1
    pacparser
    qt5-base
    qt5-svg
    xerces-c
    xml-security-c
)
makedepends=(
    fuse2
    gcc
    proot
)
source=(
    missing-symbols.cpp
    missing-symbols.version
    wrapper
)
source_x86_64=(
    https://web.archive.org/web/20231219104933if_/https://www.slovensko.sk/static/kep/apps/dlauncher2_2.x/sk.ditec.dlauncher2-linux-x86_64.zip
)
sha256sums=(
    SKIP
    SKIP
    SKIP
)
# https://www.slovensko.sk/static/kep/apps/dlauncher2_2.x/sk.ditec.dlauncher2.xml
# $ echo <sha256> | base64 -d | xxd -c 0 -p
sha256sums_x86_64=(
    76a5b15c812e14fc20610ae1bc976a29ca28c031763a1e31e5bff7d56562704a
)

: "${pkgname}"
: "${pkgver}"
: "${pkgrel}"
: "${pkgdesc}"
: "${arch[@]}"
: "${url}"
: "${license[@]}"
: "${depends[@]}"
: "${makedepends[@]}"
: "${source[@]}"
: "${source_x86_64[@]}"
: "${sha256sums[@]}"
: "${sha256sums_x86_64[@]}"

prepare() {
    ./DLauncher2.linux.x86_64.run --appimage-extract
}

build() {
    IFS=" " read -r -a BUILD_FLAGS <<< "${CXXFLAGS} ${LDFLAGS} ${LTOFLAGS}"

    # If the files exist, the installer attempts to reinstall the app.
    rm -rf install

    mkdir -p install/{sbin,install/.local/share}

    # Prevents the installer from trying to use systemctl
    ln -fs /usr/bin/true install/sbin/systemctl

    for exe in dBridge2Nm dLauncher2; do
        install -Dm755 "squashfs-root/dlauncher2/${exe}" \
            "install/opt/${pkgname}/_${exe}"

        ln -fs "/opt/${pkgname}/wrapper" "install/opt/${pkgname}/${exe}"
    done

    # Fixes `undefined symbol: _ZdlPvm, version Qt_5` error.
    # https://community.esri.com/t5/qt-maps-sdk-questions/undefined-reference-to-operator-delete-void/m-p/238571/highlight/true#M1203
    g++ "${BUILD_FLAGS[@]}" -Wl,--version-script=missing-symbols.version \
        -shared -fPIC -o "install/opt/${pkgname}/libmissingsymbols.so" \
        missing-symbols.cpp
    install -Dm755 wrapper "install/opt/${pkgname}"

    install -Dm644 squashfs-root/dlauncher2/*.png "install/opt/${pkgname}"

    # --register fixes `path` in manifests.
    for mode in install register; do
        env -i proot -S install -b /bin -b /etc -b /lib64 -b /usr -w / /usr/bin/env \
            HOME=/install \
            PATH=/sbin:/usr/bin \
            QT_QPA_PLATFORM=offscreen \
            XDG_UTILS_INSTALL_MODE=user \
            "/opt/${pkgname}/dLauncher2" --headless "--${mode}"
    done
}

package() {
    : "${pkgdir:?}"

    cp -r install/opt "${pkgdir}"

    install -Dm644 install/install/.ditec/dlauncher2/manifest-chrome.json \
        "${pkgdir}/etc/chromium/native-messaging-hosts/sk.ditec.dbridge2.nm.json"
    mkdir -p "${pkgdir}/etc/opt/chrome/native-messaging-hosts"
    ln -fs /etc/chromium/native-messaging-hosts/sk.ditec.dbridge2.nm.json \
        "${pkgdir}/etc/opt/chrome/native-messaging-hosts/sk.ditec.dbridge2.nm.json"

    install -Dm644 install/install/.ditec/dlauncher2/manifest-firefox.json \
        "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/sk.ditec.dbridge2.nm.json"

    install -Dm644 install/install/.local/share/applications/sk.ditec.dlauncher2.desktop \
        "${pkgdir}/usr/share/applications/sk.ditec.dlauncher2.desktop"
    sed -i "s|/install/.local/share/dlauncher2/|/opt/${pkgname}/|g" \
        "${pkgdir}/usr/share/applications/sk.ditec.dlauncher2.desktop"

    for size in 16 32 48 64 128 256 512; do
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/"{apps,mimetypes}
        ln -fs "/opt/${pkgname}/sk.ditec.dlauncher2_${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/sk.ditec.dlauncher2.png"
        ln -fs "/opt/${pkgname}/sk.ditec.dlauncher2_${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/gnome-mime-sk.ditec.dlauncher2.png"
        ln -fs "/opt/${pkgname}/sk.ditec.dlauncher2_${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/sk.ditec.dlauncher2.png"
    done
}

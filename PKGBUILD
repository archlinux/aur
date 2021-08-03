# Maintainer: Pi-Yueh chuang <pychuang@pm.me>
# Contributor: Nover <novares.x@gmail.com>
# Contributor: agentcobra <agentcobra@free.fr>
pkgname=shadow-tech
pkgver=5.0.996
pkgrel=1
pkgdesc="Desktop client for Shadow Tech cloud gaming service."
arch=('x86_64')
url="https://shadow.tech"
license=('unknown')
depends=(
    'gtk3'
    'libinput'
    'libva'
    'libxss'
    'nss'
    'xcb-util-renderutil'
    'xcb-util-image'
)
makedepends=(
    'yq'
    'desktop-file-utils'
)
optdepends=(
    'libva-intel-driver: driver for Intel GPU (G45 and HD family)'
    'intel-media-driver: driver of Intel GPU (Broadwell (2014) and newer)'
    'libva-vdpau-driver-shadow-nvidia: patch for recent Nvidia GPU'
    'nouveau-fw: driver for old Nvidia GPU'
    'org.freedesktop.secrets: to remember login credentials'
)
provides=(shadow-tech)
_urlbase='https://storage.googleapis.com/shadow-update/launcher/prod/linux/ubuntu_18.04'
source=(
    "${pkgname}-meta.yml::${_urlbase}/latest-linux.yml"
    "${pkgname}-${pkgver}.AppImage::${_urlbase}/Shadow.AppImage"
    "shadow.sh"
)
sha256sums=(
    'SKIP'
    'SKIP'
    '9d8583947ef29549b26e85f81abe7cc3b7c28555cf42986d6d0f831532c798bf'
)
install=${pkgname}.install

pkgver() {
    cd ${srcdir}
    echo $(yq -r .version "${pkgname}-meta.yml")
}

prepare() {
    cd ${srcdir}

    # manually check the sha512sum of the appimage file
    sha="$(yq -r .sha512 ${pkgname}-meta.yml| base64 -d | xxd -p -c 256)"
    echo "${sha} ${pkgname}-${pkgver}.AppImage" | sha512sum --check

    # give execution rights
    chmod +x ${pkgname}-${pkgver}.AppImage

    # extract AppImage
    ./${pkgname}-${pkgver}.AppImage --appimage-extract

    # rename the folder
    rm -rf ${pkgname}-${pkgver}
    mv squashfs-root ${pkgname}-${pkgver}
}

package() {

    # copy all files first
    mkdir -p "${pkgdir}/opt"
    mv ${pkgname}-${pkgver} "${pkgdir}/opt/${pkgname}"

    # go into the package folder
    cd "${pkgdir}/opt/${pkgname}"

    # move icons
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps"
    cp "usr/share/icons/hicolor/0x0/apps/shadow.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps"
    cp "usr/share/icons/hicolor/0x0/apps/shadow.png" "${pkgdir}/usr/share/icons"

    # modify and install desktop file
    mv "shadow.desktop" "${pkgname}.desktop"
    desktop-file-install \
        --dir="${pkgdir}/usr/share/applications" \
        --set-key="Categories" --set-value="Game;" \
        --set-key="Exec" --set-value="/usr/bin/shadow.sh --no-sandbox" \
        --delete-original \
        "${pkgname}.desktop"

    # remove files that are not needed
    rm "${pkgdir}/opt/${pkgname}/AppRun"
    rm "${pkgdir}/opt/${pkgname}/.DirIcon"
    rm "${pkgdir}/opt/${pkgname}/shadow.png"
    rm -r "${pkgdir}/opt/${pkgname}/usr/share"
    rm "${pkgdir}/opt/${pkgname}/usr/lib/libappindicator.so.1"
    rm "${pkgdir}/opt/${pkgname}/usr/lib/libgconf-2.so.4"
    rm "${pkgdir}/opt/${pkgname}/usr/lib/libindicator.so.7"
    rm "${pkgdir}/opt/${pkgname}/usr/lib/libnotify.so.4"

    # fix permissions
    chmod 755 $(find ${pkgdir} -type d)
    chmod 644 $(find ${pkgdir} -type f)
    chmod 755 "${pkgdir}/opt/${pkgname}/shadow"
    chmod 755 "${pkgdir}/opt/${pkgname}/resources/app.asar.unpacked/release/native/Shadow"
    chmod 755 "${pkgdir}/opt/${pkgname}/resources/app.asar.unpacked/release/native/ShadowHelper"
    chmod 755 $(find ./ -path "*.so*")

    # install executable shell script
    install -Dm755 ${srcdir}/shadow.sh -t "${pkgdir}/usr/bin"
}

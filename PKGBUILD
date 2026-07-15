# vim:cms=#\ %s
# Maintainer: awh (https://aur.archlinux.org/account/awh)
# Contributor: jeskko (https://aur.archlinux.org/account/jeskko)

pkgname=baballonia
pkgver=v1.1.1.0rc6
pkgrel=4
pkgdesc="A cross-platform, hardware-agnostic VR eye and face tracking application."
arch=('x86_64' 'aarch64')
url="https://github.com/Project-Babble/Baballonia"
license=('LicenseRef-Babble Software Distribution License 1.0')

pkgver() {
    cd "$pkgname"
    git describe --tags --abbrev=0 --match 'v[0-9]*' main
}

makedepends=(
    dotnet-sdk-10.0
    git
    ca-certificates
    unzip
)
depends=(
    dotnet-runtime-10.0
    lttng-ust
    fontconfig
    libglvnd
    libjpeg
    hicolor-icon-theme
    gstreamer
    gst-plugins-base-libs
    glib2
    onnxruntime
    espflash
    babbletrainer
    babblecalibration
)
source=(
    "${pkgname}::git+${url}.git#tag=${pkgver}"
    "baballonia.sh"
    "Baballonia.desktop"
    "LICENSE"
   )
sha256sums=('SKIP'
            'f14601e1bca1b90fa4a83198fe7982cc4503efd83d2f5094fdfafc9abb66d760'
            'c79d564f433ef8786b125c58da586c2f40779d8978bf0d708ce68e02823ff450'
            'a0c3fedbc0083597993489730d8178d2e79fdb6c03d596cb4bebfafc819d063f')
prepare() {
    cd "${pkgname}"
    git submodule update --init --recursive
}
build() {
    cd "${srcdir}/${pkgname}/src/Baballonia.Desktop"
    dotnet publish -r linux-x64 -c Release --self-contained -f net10.0
}
package() {
    cd "${pkgname}"

    export _publishdir="src/Baballonia.Desktop/bin/Release/net10.0/linux-x64/publish"

    # force system onnxruntime since shipped library only includes cpu execution provider
    rm "${_publishdir}/libonnxruntime"*

    install -d "${pkgdir}/opt/${pkgname}"
    cp -a "$_publishdir/"* "${pkgdir}/opt/${pkgname}/"

    install -Dm644 "${_publishdir}/Assets/Icon_512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/baballonia.png"
    install -Dm644 "${_publishdir}/Assets/Icon_32x32.ico"   "${pkgdir}/usr/share/icons/hicolor/32x32/apps/baballonia.ico"

    install -Dm755 "${srcdir}/baballonia.sh"      "${pkgdir}/usr/bin/baballonia"
    install -Dm644 "${srcdir}/Baballonia.desktop" "${pkgdir}/usr/share/applications/Baballonia.desktop"
    install -Dm644 "${srcdir}/LICENSE"            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # BabbleCalibration
    rm "${pkgdir}/opt/${pkgname}/Calibration/Linux/Overlay/temp"
    rmdir "${pkgdir}/opt/${pkgname}/Calibration/Linux/Overlay/"
    ln -s /opt/babblecalibration/ "${pkgdir}/opt/${pkgname}/Calibration/Linux/Overlay"

    # espflash
    mkdir -p "${pkgdir}/opt/${pkgname}/Firmware/Linux/"
    ln -s /usr/bin/espflash "${pkgdir}/opt/${pkgname}/Firmware/Linux/espflash"

    # BabbleTrainer
    ln -s "/opt/babbletrainer/babbletrainer.sh" "${pkgdir}/opt/${pkgname}/Calibration/Linux/Trainer/BabbleTrainer"
}

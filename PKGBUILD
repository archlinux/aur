# Maintainer: awh (https://aur.archlinux.org/account/awh)

pkgname=baballonia
pkgver=v1.1.0.9rc3
_trainerver=1.3.8-linux-paths
_calibrationver=1.0.5
_espflashver=v4.3.0
pkgrel=2
pkgdesc="A cross-platform, hardware-agnostic VR eye and face tracking application."
arch=('x86_64')
url="https://github.com/Project-Babble/Baballonia"
license=('LicenseRef-Babble Software Distribution License 1.0')

makedepends=('dotnet-sdk-8.0' 'git' 'ca-certificates')
depends=(
    dotnet-sdk-8.0
    lttng-ust
    fontconfig
    libglvnd
    libjpeg
    hicolor-icon-theme
    gstreamer
    gst-plugins-base-libs
    glib2
    onnxruntime
)

source=(
    "${pkgname}::git+${url}.git#tag=${pkgver}"
    # will potentially desync from the official github builds since we're
    # targeting latest but it's probably fine to just cachebust with our
    # own pkgver
    "BabbleCalibration_${_calibrationver}.zip::https://github.com/Project-Babble/BabbleCalibration/releases/download/${_calibrationver}/Linux.zip"
    "BabbleTrainer-x64_${_trainerver}::https://github.com/Project-Babble/BabbleTrainer/releases/download/${_trainerver}/BabbleTrainer-x64"
    "espflash_${_espflashver}.zip::https://github.com/esp-rs/espflash/releases/download/${_espflashver}/espflash-x86_64-unknown-linux-gnu.zip"

    "baballonia.sh"
    "Baballonia.desktop"
    "LICENSE"
   )
noextract=(
    "BabbleCalibration_${_calibrationver}.zip"
)
sha256sums=('0136c14e531ff1244a54a1a5538a7482fcb14339f298e7bb868d9a3946cc4c1a'
            'e78593a5a9147fa948ee7703c95a424a0020ca668b157ce23fed65ab02693ee1'
            'e9a505418ef85108c2b2dfff4b8f805e6288def7fb8ab6bf160bbc82b7cd1720'
            'c2b8597568e3aa85208a1fc699ddde92a04e7ab730642253aeb7466023790fe1'
            'f14601e1bca1b90fa4a83198fe7982cc4503efd83d2f5094fdfafc9abb66d760'
            'c79d564f433ef8786b125c58da586c2f40779d8978bf0d708ce68e02823ff450'
            'a0c3fedbc0083597993489730d8178d2e79fdb6c03d596cb4bebfafc819d063f')
prepare() {
    cd "${pkgname}"
    git submodule update --init --recursive
}
build() {
    cd "${pkgname}/src/Baballonia.Desktop"
    dotnet publish -r linux-x64 -c Release --self-contained -f net8.0
}
package() {
    cd "${pkgname}"

    export _publishdir="src/Baballonia.Desktop/bin/Release/net8.0/linux-x64/publish"

    # force system onnxruntime since shipped library only includes cpu execution provider
    rm "${_publishdir}/libonnxruntime"*

    install -d "${pkgdir}/opt/${pkgname}"
    cp -a "$_publishdir/"* "${pkgdir}/opt/${pkgname}/"

    install -Dm755 "${srcdir}/BabbleTrainer-x64_${_trainerver}"        "${pkgdir}/opt/${pkgname}/Calibration/Linux/Trainer/BabbleTrainer"
    unzip          "${srcdir}/BabbleCalibration_${_calibrationver}.zip" -d "${pkgdir}/opt/${pkgname}/Calibration/Linux/Overlay/"
    install -Dm755 "${srcdir}/espflash"                           "${pkgdir}/opt/${pkgname}/Firmware/Linux/espflash"

    install -Dm644 "${_publishdir}/Assets/Icon_512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/baballonia.png"
    install -Dm644 "${_publishdir}/Assets/Icon_32x32.ico"   "${pkgdir}/usr/share/icons/hicolor/32x32/apps/baballonia.ico"

    install -Dm755 "${srcdir}/baballonia.sh"      "${pkgdir}/usr/bin/baballonia"
    install -Dm644 "${srcdir}/Baballonia.desktop" "${pkgdir}/usr/share/applications/Baballonia.desktop"
    install -Dm644 "${srcdir}/LICENSE"            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

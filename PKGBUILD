# Maintainer: awh (https://aur.archlinux.org/account/awh)

pkgname=baballonia
pkgver=v1.1.0.9rc3
pkgrel=1
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
    "BabbleCalibration_${pkgver}.zip::https://github.com/Project-Babble/BabbleCalibration/releases/latest/download/Linux.zip"
    "BabbleTrainer-x64_${pkgver}::https://github.com/Project-Babble/BabbleTrainer/releases/latest/download/BabbleTrainer-x64"
    "espflash_${pkgver}.zip::https://github.com/esp-rs/espflash/releases/latest/download/espflash-x86_64-unknown-linux-gnu.zip"

    "baballonia.sh"
    "Baballonia.desktop"
    "LICENSE"
   )
noextract=(
    "BabbleCalibration_${pkgver}.zip"
)
sha256sums=('0136c14e531ff1244a54a1a5538a7482fcb14339f298e7bb868d9a3946cc4c1a'
            'e78593a5a9147fa948ee7703c95a424a0020ca668b157ce23fed65ab02693ee1'
            '156c6e98da7617615f58bbaed02492b84f087856953b83f77092af3a9d8e0f1f'
            '601572be5ae943f72631ce883af988c597d88b1bb3f0cfac70d2d40760158dbd'
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

    install -Dm755 "${srcdir}/BabbleTrainer-x64_${pkgver}"        "${pkgdir}/opt/${pkgname}/Calibration/Linux/Trainer/BabbleTrainer"
    unzip          "${srcdir}/BabbleCalibration_${pkgver}.zip" -d "${pkgdir}/opt/${pkgname}/Calibration/Linux/Overlay/"
    install -Dm755 "${srcdir}/espflash"                           "${pkgdir}/opt/${pkgname}/Firmware/Linux/espflash"

    install -Dm644 "${_publishdir}/Assets/Icon_512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/baballonia.png"
    install -Dm644 "${_publishdir}/Assets/Icon_32x32.ico"   "${pkgdir}/usr/share/icons/hicolor/32x32/apps/baballonia.ico"

    install -Dm755 "${srcdir}/baballonia.sh"      "${pkgdir}/usr/bin/baballonia"
    install -Dm644 "${srcdir}/Baballonia.desktop" "${pkgdir}/usr/share/applications/Baballonia.desktop"
    install -Dm644 "${srcdir}/LICENSE"            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

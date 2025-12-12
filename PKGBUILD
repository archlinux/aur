# Maintainer: awh (https://aur.archlinux.org/account/awh)

pkgname=baballonia
pkgver=v1.1.0.9rc2
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
        "baballonia.sh"
        "Baballonia.desktop"
        "onnxruntime-rocm-to-migraphx.patch"
        "LICENSE"
       )
sha256sums=('56cac69541367cc68d6f5908ccdbbbe6a9c7da766e9f743c94629ff7ca77fd6b'
            'f14601e1bca1b90fa4a83198fe7982cc4503efd83d2f5094fdfafc9abb66d760'
            'c79d564f433ef8786b125c58da586c2f40779d8978bf0d708ce68e02823ff450'
            '542ad6a7b0f638afd3de649cdbc905e8fcaa45abd3fc91aa939e54259ec9ac1f'
            'a0c3fedbc0083597993489730d8178d2e79fdb6c03d596cb4bebfafc819d063f')
prepare() {
    cd "${pkgname}"
    git submodule update --init --recursive
    patch -Np1 -i "${srcdir}/onnxruntime-rocm-to-migraphx.patch"
}
build() {
    cd "${pkgname}/src/Baballonia.Desktop"
    dotnet publish -r linux-x64 -c Release --self-contained -f net8.0
}
package() {
    cd "${pkgname}"

    export _publishdir="src/Baballonia.Desktop/bin/Release/net8.0/linux-x64/publish"

    # force system onnxruntime since shipped library only includes cpu execution provider
    rm ${_publishdir}/libonnxruntime*.so

    install -d "${pkgdir}/opt/${pkgname}"
    cp -a "$_publishdir/"* "${pkgdir}/opt/${pkgname}/"
    chmod 755 "${pkgdir}/opt/${pkgname}/Calibration/Linux/"*

    install -Dm644 "${_publishdir}/Assets/Icon_512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/baballonia.png"
    install -Dm644 "${_publishdir}/Assets/Icon_32x32.ico" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/baballonia.ico"

    install -Dm755 "${srcdir}/baballonia.sh" "${pkgdir}/usr/bin/baballonia"
    install -Dm644 "${srcdir}/Baballonia.desktop" "${pkgdir}/usr/share/applications/Baballonia.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

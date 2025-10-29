# Maintainer: awh (https://aur.archlinux.org/account/awh)

pkgname=baballonia
pkgver=v1.1.0.8
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
)
# unsure since copy included in build already
#optdepends=(
#    'onnxruntime: accelerated image decoding'
#)

source=(
        "${pkgname}::git+${url}.git#tag=${pkgver}"
        "baballonia.sh"
        "Baballonia.desktop"
        "LICENSE"
       )
sha256sums=('f1cbcecc2e12dd4b625062f6e03d05f0d2d0284a97f636d01d8b988237b15ed7'
            'f14601e1bca1b90fa4a83198fe7982cc4503efd83d2f5094fdfafc9abb66d760'
            'c79d564f433ef8786b125c58da586c2f40779d8978bf0d708ce68e02823ff450'
            'a0c3fedbc0083597993489730d8178d2e79fdb6c03d596cb4bebfafc819d063f')

prepare() {
    cd "${pkgname}"
    git submodule update --init --recursive
}
build() {
    cd "${pkgname}"
    dotnet publish src/Baballonia.Desktop/Baballonia.Desktop.csproj -r linux-x64 -c LinuxRelease --no-self-contained -f net8.0
}
package() {
    cd "${pkgname}"

    export _publishdir="src/Baballonia.Desktop/bin/LinuxRelease/net8.0/linux-x64"

    # duplicated tree?
    rm -rf "$_publishdir/publish"

    install -d "${pkgdir}/opt/${pkgname}"
    cp -a "$_publishdir/"* "${pkgdir}/opt/${pkgname}/"

    install -Dm644 "${_publishdir}/Assets/Icon_512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/baballonia.png"
    install -Dm644 "${_publishdir}/Assets/Icon_32x32.ico" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/baballonia.ico"

    install -Dm755 "${srcdir}/baballonia.sh" "${pkgdir}/usr/bin/baballonia"
    install -Dm644 "${srcdir}/Baballonia.desktop" "${pkgdir}/usr/share/applications/Baballonia.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

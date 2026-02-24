# Maintainer: you
pkgname=voquill-gpu
pkgver=0.0.432
pkgrel=1
pkgdesc='AI voice dictation (GPU build)'
arch=('x86_64')
url='https://github.com/josiahsrc/voquill'
license=('custom:proprietary')
depends=(
    'gtk3'
    'webkit2gtk-4.1'
    'xdotool'
    'libayatana-appindicator'
    'alsa-lib'
    'libxtst'
    'vulkan-icd-loader'
)
options=('!strip')
_tag="desktop-gpu-v${pkgver}"
source=("Voquill.GPU_${pkgver}_amd64.deb::https://github.com/josiahsrc/voquill/releases/download/${_tag}/Voquill.GPU_${pkgver}_amd64.deb")
sha256sums=('113a97ad234ab03e84f76973b1fc457340b5bd318d5ff927b7f8856c01606e31')

prepare() {
    cd "${srcdir}"
    ar x "Voquill.GPU_${pkgver}_amd64.deb"
    tar -xzf data.tar.gz
}

package() {
    cd "${srcdir}"

    install -Dm755 "usr/bin/Voquill GPU" "${pkgdir}/usr/bin/voquill-gpu"

    install -Dm644 "usr/share/applications/Voquill GPU.desktop" \
        "${pkgdir}/usr/share/applications/voquill-gpu.desktop"

    for size in 32x32 128x128 256x256@2; do
        install -Dm644 "usr/share/icons/hicolor/${size}/apps/Voquill GPU.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}/apps/voquill-gpu.png"
    done

    # Fix Exec and Icon in the desktop file to match installed names
    sed -i \
        -e 's|^Exec=.*|Exec=voquill-gpu|' \
        -e 's|^Icon=.*|Icon=voquill-gpu|' \
        -e 's|^StartupWMClass=.*|StartupWMClass=Voquill GPU|' \
        "${pkgdir}/usr/share/applications/voquill-gpu.desktop"
}

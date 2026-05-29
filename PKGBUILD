# Maintainer: Mark Austin <ganthore@gmail.com>
pkgname=qmidigen
pkgver=0.1.0
pkgrel=1
pkgdesc='Randomized MIDI music generator with JRPG-style compositions'
arch=('x86_64' 'aarch64')
url='https://gitlab.com/ganthore/qmidigen'
license=('MIT' 'LicenseRef-GeneralUser-GS')
depends=(
    'qt6-declarative'
    'qt6-wayland'
    'fluidsynth'
)
makedepends=(
    'cargo'
    'cmake'
    'ninja'
    'pkgconf'
)
optdepends=(
    'ffmpeg: non-WAV audio export (MP3, FLAC, OGG, AAC, MP4)'
    'kdialog: native KDE file dialogs'
)
# Update b2sums after tagging v${pkgver} with: updpkgsums
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/ganthore/qmidigen/-/archive/v${pkgver}/qmidigen-v${pkgver}.tar.gz")
b2sums=('SKIP')
options=('!lto' 'debug')

prepare() {
    # GitLab tag archives sometimes include the commit hash in the dir name;
    # normalise to a predictable path.
    if [ -d "${srcdir}/qmidigen-v${pkgver}" ]; then
        ln -sf "qmidigen-v${pkgver}" "${srcdir}/${pkgname}-${pkgver}"
    else
        mv "${srcdir}/qmidigen-v${pkgver}"* "${srcdir}/${pkgname}-${pkgver}"
    fi
    cd "${srcdir}/${pkgname}-${pkgver}"
    export CARGO_HOME="${srcdir}/.cargo"
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export CARGO_HOME="${srcdir}/.cargo"
    export CARGO_TARGET_DIR="${srcdir}/target"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 "${srcdir}/target/release/qmidigen" \
        "${pkgdir}/usr/bin/qmidigen"

    install -Dm644 "assets/com.qmidigen.QMidiGen.desktop" \
        "${pkgdir}/usr/share/applications/com.qmidigen.QMidiGen.desktop"

    install -Dm644 "assets/icon.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.qmidigen.QMidiGen.svg"

    local s
    for s in 16 32 48 64 128 256 512; do
        install -Dm644 "assets/icon_${s}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${s}x${s}/apps/com.qmidigen.QMidiGen.png"
    done

    install -Dm644 "assets/soundfonts/GeneralUser-GS.sf2" \
        "${pkgdir}/usr/share/qmidigen/soundfonts/GeneralUser-GS.sf2"

    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "assets/soundfonts/GeneralUser-GS-LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/GeneralUser-GS-LICENSE.txt"
}

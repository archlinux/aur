# Maintainer: Mark Austin <ganthore@gmail.com>
pkgname=qmidigen-git
pkgver=0.1.0.r1.g7dd4c5b
pkgrel=1
pkgdesc='Randomized MIDI music generator with JRPG-style compositions (git)'
arch=('x86_64' 'aarch64')
url='https://gitlab.com/ganthore/qmidigen'
license=('MIT' 'LicenseRef-GeneralUser-GS')
provides=('qmidigen')
conflicts=('qmidigen')
depends=(
    'qt6-declarative'
    'qt6-wayland'
    'fluidsynth'
)
makedepends=(
    'cargo'
    'cmake'
    'git'
    'ninja'
    'pkgconf'
)
optdepends=(
    'ffmpeg: non-WAV audio export (MP3, FLAC, OGG, AAC, MP4)'
    'kdialog: native KDE file dialogs'
)
source=("${pkgname}::git+https://gitlab.com/ganthore/qmidigen.git")
b2sums=('SKIP')
options=('!lto' 'debug')

pkgver() {
    cd "${srcdir}/${pkgname}"
    ( git describe --long --tags --abbrev=7 2>/dev/null \
        | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g' \
        | grep .
    ) || printf 'r%s.g%s' \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}"
    export CARGO_HOME="${srcdir}/.cargo"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}/${pkgname}"
    export CARGO_HOME="${srcdir}/.cargo"
    export CARGO_TARGET_DIR="${srcdir}/target"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release
}

package() {
    cd "${srcdir}/${pkgname}"

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

pkgname=psst-git-bin
_pkgname="psst"
pkgver=r579.86169f8
pkgrel=4
pkgdesc="Fast and multi-platform Spotify client with native GUI (binary git version)."
arch=("x86_64" "aarch64")
url="https://github.com/jpochyla/psst"
license=('MIT')
makedepends=('unzip' 'curl' 'jq')
depends=('gtk3' 'openssl' 'alsa-lib')
provides=("psst")
conflicts=("psst" "psst-git")

if [[ "${CARCH}" == "x86_64" ]]; then
    nightly_link="https://nightly.link/jpochyla/psst/workflows/build/main/psst-gui-x86_64-unknown-linux-gnu.zip"
elif [[ "${CARCH}" == "aarch64" ]]; then
    nightly_link="https://nightly.link/jpochyla/psst/workflows/build/main/psst-gui-aarch64-unknown-linux-gnu.zip"
else
    echo "Unsupported architecture: ${CARCH}"
    exit 1
fi

source=(
    "${nightly_link}"
    "https://raw.githubusercontent.com/jpochyla/psst/main/psst-gui/assets/logo_32.png"
    "https://raw.githubusercontent.com/jpochyla/psst/main/psst-gui/assets/logo_64.png"
    "https://raw.githubusercontent.com/jpochyla/psst/main/psst-gui/assets/logo_128.png"
    "https://raw.githubusercontent.com/jpochyla/psst/main/psst-gui/assets/logo_256.png"
    "https://raw.githubusercontent.com/jpochyla/psst/main/psst-gui/assets/logo_512.png"
    "https://raw.githubusercontent.com/jpochyla/psst/main/psst-gui/assets/logo.svg"
    "https://raw.githubusercontent.com/jpochyla/psst/main/.pkg/psst.desktop"
)

sha256sums=(
    'SKIP'
    '7b53df46ae46e3843f497ddc12bd47866b8b8933ba9102443c674630ce0b9e4e'
    'f74a037ecdb92ac4789bf23d0e0e936db8d2dd9c30a73179e862f0a7c26f9aa5'
    '6ec968ba0bc0f60ed1a798cc155d40f9839a37175d566dc658f6b30848f63dcd'
    'b4af1fcd4bf767a1da148e776ceb4ea4221ac359f7725aa0daa9bb4583479e7c'
    'da79acff7d35ef5c51ee6a516c852a4ad75e84ba83d3a0fbe789d677e627ebaf'
    '1f67253dd5d3a7d7bda2126240b51ef9ed16196bee85ce1342d4bad3d0af9d40'
    '8e933a0a2f191c3e91d7287e1fe6b177843da8cc4450c888e670f31f674dc13a'
)

pkgver() {
    cd "${srcdir}"
    local commit_count commit_hash
    commit_count=$(curl -s -I -k "https://api.github.com/repos/jpochyla/psst/commits?per_page=1" | sed -n '/^[Ll]ink:/ s/.*"next".*page=\([0-9]*\).*"last".*/\1/p') # https://gist.github.com/0penBrain/7be59a48aba778c955d992aa69e524c5
    commit_hash=$(curl -Ls https://api.github.com/repos/jpochyla/psst/commits/main | jq -r .sha)
    printf "r%s.%s" "${commit_count}" "${commit_hash:0:7}"
}

prepare() {
    cd "${srcdir}"
    unzip -o "$(basename "${nightly_link}")"
}

package() {
    cd "${srcdir}"

    # Install binary
    install -Dm755 psst-gui "${pkgdir}/usr/bin/psst-gui"
    
    # Install desktop entry
    install -Dm644 "${srcdir}/psst.desktop" "${pkgdir}/usr/share/applications/psst.desktop"

    # Install icons
    install -Dm644 "${srcdir}/logo_32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/psst-gui.png"
    install -Dm644 "${srcdir}/logo_64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/psst-gui.png"
    install -Dm644 "${srcdir}/logo_128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/psst-gui.png"
    install -Dm644 "${srcdir}/logo_256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/psst-gui.png"
    install -Dm644 "${srcdir}/logo_512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/psst-gui.png"
    install -Dm644 "${srcdir}/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/psst-gui.svg"
}

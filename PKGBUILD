# Maintainer: Kristofer Lund <kristoferlund@users.noreply.github.com>
pkgname=ostt
pkgver=0.0.4
pkgrel=1
pkgdesc="Open Speech-to-Text: Terminal application for recording and transcribing audio"
arch=('x86_64' 'aarch64')
url="https://github.com/kristoferlund/ostt"
license=('MIT')
depends=(
    'alsa-lib'      # Audio capture (Linux)
    'openssl'       # TLS for API calls
    'ffmpeg'        # Audio format conversion
)
optdepends=(
    'wl-clipboard: Clipboard support on Wayland'
    'xclip: Clipboard support on X11'
)
makedepends=('cargo' 'rust' 'git' 'pkgconf')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kristoferlund/ostt/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "ostt-${pkgver}"
}

build() {
    cd "ostt-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "ostt-${pkgver}"
    
    # Install the binary (includes embedded config files)
    install -Dm755 target/release/ostt "${pkgdir}/usr/bin/ostt"
    
    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/ostt/README.md"
}

check() {
    cd "ostt-${pkgver}"
    cargo test --release --locked
}


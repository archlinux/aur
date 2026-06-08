# Maintainer: Kristofer Lund <kristoferlund@users.noreply.github.com>
pkgname=ostt
pkgver=0.0.21
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
sha256sums=('5bf910626d0dfc4a156c6b5799182c5a0e8f4036bb29ed75ca8f259fa08dbeba')

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
    
    # Generate shell completions
    mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
    mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
    mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d"
    ./target/release/ostt completions bash > "${pkgdir}/usr/share/bash-completion/completions/ostt"
    ./target/release/ostt completions zsh > "${pkgdir}/usr/share/zsh/site-functions/_ostt"
    ./target/release/ostt completions fish > "${pkgdir}/usr/share/fish/vendor_completions.d/ostt.fish"
}

check() {
    cd "ostt-${pkgver}"
    cargo test --release --locked
}

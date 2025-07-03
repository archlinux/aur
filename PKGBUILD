pkgname=ffplayout-git
pkgver=0.25.3
pkgrel=1
pkgdesc="24/7 playout based on rust and ffmpeg"
arch=('x86_64')
url="https://github.com/ffplayout/ffplayout"
license=('GPL-3.0')
depends=(
    'ffmpeg'
    'sudo'
)
makedepends=(
    'rustup'
    'musl'
    'nodejs-lts-jod'
    'npm'
    'pandoc'
    'git'
)
provides=('ffplayout')
conflicts=('ffplayout' 'ffplayout-unstable-git')
replaces=('ffplayout', 'ffplayout-unstable-git')
backup=(etc/ffplayout/{ffplayout.toml,advanced.toml})
install='ffplayout.install'

source=(
    "${pkgname}::git+https://github.com/ffplayout/ffplayout.git"
    'ffplayout.install'
)
sha256sums=('SKIP'
            'eaaf8977a2b657abdc3273f024ffdd8ccfc2e462f5fdaa1535144c8ff84a813d')

pkgver() {
    cd ${pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname}"
    
    sed -i 's/default = \["embed_frontend"\]/default = []/' engine/Cargo.toml
    
    export CARGO_HOME="$srcdir/rust-home"
    export RUSTUP_HOME="$srcdir/rust-home"
    export RUSTUP_TOOLCHAIN=stable
    rustup target add x86_64-unknown-linux-musl
    
    cd frontend
    npm install
}

build() {
    cd "${srcdir}/${pkgname}"
    CFLAGS+=" -ffat-lto-objects"
    export CARGO_HOME="$srcdir/rust-home"
    export RUSTUP_HOME="$srcdir/rust-home"
    export RUSTUP_TOOLCHAIN=stable
    
    # Frontend build steps
    cd frontend
    npm run build
    cp -vr dist "${srcdir}/${pkgname}/public"
    
    # man docs
    cd "${srcdir}/${pkgname}"
    ./scripts/man_create.sh
    
    # Backend build step
    cargo build --locked --release --target=x86_64-unknown-linux-musl
}

package() {
    cd "${srcdir}/${pkgname}"
    
    install -Dm755 target/x86_64-unknown-linux-musl/release/ffplayout "${pkgdir}/usr/bin/ffplayout"
    install -Dm644 assets/ffplayout.service "${pkgdir}/usr/lib/systemd/system/ffplayout.service"
    install -Dm644 assets/ffplayout.1.gz "${pkgdir}/usr/share/man/man1/ffplayout.1.gz"
    install -Dm644 assets/logo.png "${pkgdir}/usr/share/ffplayout/logo.png"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/ffplayout/README"
    install -Dm644 LICENSE "${pkgdir}/usr/share/doc/ffplayout/copyright"
    cp -a public "${pkgdir}/usr/share/ffplayout/"
}

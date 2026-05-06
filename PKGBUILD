# Maintainer: taotieren <admin@taotieren.com>

pkgname=dsview-cli
pkgver=1.2.3
pkgrel=1
pkgdesc="Scriptable DSLogic Plus capture and protocol decoding without the DSView GUI"
arch=($CARCH)
url="https://github.com/LISTENAI/dsview-cli"
license=('Apache-2.0')
provides=(
    ${pkgname}
)
conflicts=(
    ${pkgname}
)
replaces=()
depends=(
    sh
    bzip2
    expat
    gdbm
    glib2
    glibc
    libgcc
    libffi
    libusb
    mpdecimal
    ncurses
    openssl
    python
    readline
    sqlite
    util-linux-libs
    xz
    zlib
    zstd
)
makedepends=(
    git
    rust
    libusb
    fftw
    boost
    boost-libs
    cmake
    ninja
    pkgconf
)
optdepends=(
)
backup=()
options=(!lto !debug)
install=
source=(
    "${pkgname}::git+${url}.git#tag=v${pkgver}"
    "DSView::git+https://github.com/DreamSourceLab/DSView.git"
)
sha256sums=('c49a24ba6d439ec2c987a6deaa9f87a4b89e16cb950bac07d79f7abe800c9b9f'
            'SKIP')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}"
    git submodule init
    git config submodule.DSView.url "$srcdir/DSView"
    git -c protocol.file.allow=always submodule update
    
    ./scripts/apply-dsview-patches.sh

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build \
        --offline \
        --locked \
        --release
}

# check() {
#     cd "${srcdir}/${pkgname}/"
#
#     export RUSTUP_TOOLCHAIN=stable
#     cargo test --all-features
# }

package() {
    cd "${srcdir}/${pkgname}/"
    _dsview_cli=$(find target/release/ -name "dsview-cli" -print -quit)
    _libdsview_runtime=$(find target/release/build/dsview-sys-*/out/source-runtime-build -name "libdsview_runtime.so" -print -quit)
    _libdsview_decode_runtime=$(find target/release/build/dsview-sys-*/out/source-decode-runtime-build -name "libdsview_decode_runtime.so" -print -quit)
    
    python tools/package-bundle.py  \
        --exe $_dsview_cli \
        --runtime $_libdsview_runtime \
        --decode-runtime $_libdsview_decode_runtime \
        --resources DSView/DSView/res \
        --decoder-dir DSView/libsigrokdecode4DSL/decoders \
        --output "dsview-cli-$pkgver.tar.gz" \
        --version $pkgver \
        --target $pkgver
    export RUSTUP_TOOLCHAIN=stable
    #     cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    # find target/release \
    #     -maxdepth 1 \
    #     -executable \
    #     -type f \
    #     -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
    
    install -vdm0755 ${pkgdir}/usr/share/${pkgname}/ \
        ${pkgdir}/usr/bin/
    tar -xf dsview-cli-$pkgver.tar.gz --strip-components=1 -C ${pkgdir}/usr/share/${pkgname}/ 
    ln -sf /usr/share/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname} 

    install -vDm0644 README* -t "$pkgdir/usr/share/doc/${pkgname}/"
    # install -vDm0644/* -t "$pkgdir/usr/share/doc/${pkgname}/"
    install -vDm0644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/"
}

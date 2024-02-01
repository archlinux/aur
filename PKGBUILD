# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ocrs-git
pkgname=(ocrs-git
    libocrs-git
    chrome-extension-ocrs-git)
pkgver=0.4.0.r0.g7ce90df
pkgrel=1
pkgdesc="A modern OCR engine (extracts text from images), written in Rust"
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/robertknight/ocrs"
license=('MIT' 'Apache-2.0')
# provides=(${pkgname%-git})
# conflicts=(${pkgname%-git})
replaces=()
depends=(glibc)
makedepends=(git
    binaryen
    cargo
    rust-wasm
    wasm-bindgen
    npm)
backup=()
options=('!lto')
install=
source=("${pkgbase}::git+${url}.git"
    "chrome-extension-ocrs-git.install")
sha256sums=('SKIP'
            'c0de42c2aa99bda9824e956273db85c77d6b420ee5225a52a64c70564bc81816')

pkgver() {
    cd "${srcdir}/${pkgbase}/"
    git describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    git -C "${srcdir}/${pkgbase}" clean -dfx
    cd "${srcdir}/${pkgbase}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}/${pkgbase}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features

    # build chrome-extension-ocrs-git
    make wasm
    ./ocrs/examples/download-models.sh
    mkdir -p models/ocr
    cp -rv text-detection.rten text-recognition.rten models/ocr
    cd ocrs-extension
    npm install
    make build
}

check() {
    cd "${srcdir}/${pkgbase}/"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --all-features
}

package_libocrs-git() {
    pkgdesc+=' - Lib'
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})
#     depends=()

    cd "${srcdir}/${pkgbase}/"

    export RUSTUP_TOOLCHAIN=stable
    install -Dm0644 target/release/*.so -t "$pkgdir/usr/lib/"
}

package_ocrs-git() {
    pkgdesc+=''
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})
#     depends=()

    cd "${srcdir}/${pkgbase}/"

    export RUSTUP_TOOLCHAIN=stable
    install -Dm0755 target/release/${pkgname%-git} -t "$pkgdir/usr/bin/"
#     cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
#     find target/release \
#         -maxdepth 1 \
#         -executable \
#         -type f \
#         -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}

package_chrome-extension-ocrs-git() {
    pkgdesc='Ocrs browser extension for Chrome'
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})
    depends=('google-chrome')
    install="${pkgname}.install"

    cd "${srcdir}/${pkgbase}/"
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    cp -rv ocrs-extension/* "${pkgdir}/usr/share/${pkgname}"
}

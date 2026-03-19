# Maintainer: graysky <graysky AT proton DOT me>
pkgname=gpu-fryer
pkgver=1.1.0
pkgrel=1
pkgdesc="GPU stress tester that detects thermal throttling and performance degradation"
arch=('x86_64')
url="https://github.com/huggingface/gpu-fryer"
license=('Apache-2.0')
depends=('nvidia-utils')
makedepends=('rust' 'git' 'cuda')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/huggingface/gpu-fryer/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('6057e0cf0a01b1fc52ee4cd0eeedc8de96c35b118d1fcea557a0493a02c1044c')

prepare() {
    cd "$pkgname-$pkgver"

    export CARGO_HOME="$srcdir/cargo-home"
    cargo fetch
}

build() {
    cd "$pkgname-$pkgver"

    export CARGO_HOME="$srcdir/cargo-home"

    export CUDA_PATH="/opt/cuda"
    export PATH="$CUDA_PATH/bin:$PATH"
    export LD_LIBRARY_PATH="$CUDA_PATH/lib64:$LD_LIBRARY_PATH"

    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"

    # Install the binary
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Install a wrapper that fixes the NVML path for Arch.
    # Upstream defaults to the Debian/Ubuntu path; on Arch it lives in /usr/lib/.
    # The wrapper passes the correct path unless the user already set it via the flag.
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/${pkgname}-arch" <<'EOF'
#!/bin/sh
# Wrapper around gpu-fryer that supplies the correct libnvidia-ml path for Arch Linux.
# All arguments are forwarded verbatim, so --nvml-lib-path can still override this default.
exec /usr/bin/gpu-fryer \
    --nvml-lib-path /usr/lib/libnvidia-ml.so.1 \
    "$@"
EOF

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

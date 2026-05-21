# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=smolvm
pkgver=0.7.2
pkgrel=1
pkgdesc='Tool to build & run portable, lightweight, self-contained virtual machines.'
arch=('x86_64' 'aarch64')
url='https://github.com/smol-machines/smolvm'
license=('Apache-2.0')
depends=(
    'libkrun'
    'libkrunfw'
    'seatd'
    'crun'
    'jq'
    'e2fsprogs'
    'util-linux'
    'libcap'
)
makedepends=(
    'cargo'
    'curl'
    'tar'
    'busybox'
    'alpine-sdk'
)
options=(!lto !debug)
provides=('smolvm')
conflicts=('smolvm-git' 'smolvm-bin')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    'Cargo.lock'
)
sha256sums=('364b3082794492fcc247f92cc804d125a90b8c7d0973f5133507b33d92919884'
            'af2549e360ba2bed63ece9f8816b1a9fc019d8af6602eeb8710c54ff31aeaaf5')

prepare() {
    cd "$pkgname-$pkgver"
    cp "../Cargo.lock" .
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"

    case "$CARCH" in
        x86_64)
            export ALPINE_ARCH="x86_64"
            export CRANE_ARCH="x86_64"
            ;;
        aarch64)
            export ALPINE_ARCH="aarch64"
            export CRANE_ARCH="arm64"
            ;;
    esac

    mkdir -p target/agent-rootfs

    ALPINE_VERSION="3.19"
    CRANE_VERSION="0.19.0"

    ALPINE_MIRROR="https://dl-cdn.alpinelinux.org/alpine"
    ALPINE_MINIROOTFS="alpine-minirootfs-${ALPINE_VERSION}.0-${ALPINE_ARCH}.tar.gz"
    ALPINE_URL="${ALPINE_MIRROR}/v${ALPINE_VERSION}/releases/${ALPINE_ARCH}/${ALPINE_MINIROOTFS}"

    CRANE_URL="https://github.com/google/go-containerregistry/releases/download/v${CRANE_VERSION}/go-containerregistry_Linux_${CRANE_ARCH}.tar.gz"

    curl -fsSL "$ALPINE_URL" -o alpine-minirootfs.tar.gz
    tar -xzf alpine-minirootfs.tar.gz -C target/agent-rootfs

    curl -fsSL "$CRANE_URL" -o crane.tar.gz

    mkdir -p target/agent-rootfs/usr/local/bin
    tar -xzf crane.tar.gz -C target/agent-rootfs/usr/local/bin crane

    mkdir -p target/agent-rootfs/etc/apk

    cat > target/agent-rootfs/etc/apk/repositories << EOF
https://dl-cdn.alpinelinux.org/alpine/v${ALPINE_VERSION}/main
https://dl-cdn.alpinelinux.org/alpine/v${ALPINE_VERSION}/community
EOF

    apk \
        --usermod \
        --root target/agent-rootfs \
        --initdb \
        --no-cache \
        --arch "$ALPINE_ARCH" \
        add \
        busybox \
        jq \
        e2fsprogs \
        e2fsprogs-extra \
        crun \
        util-linux \
        libcap \
        seatd

    mkdir -p \
        target/agent-rootfs/storage \
        target/agent-rootfs/etc/init.d \
        target/agent-rootfs/run

    echo "nameserver 1.1.1.1" > \
        target/agent-rootfs/etc/resolv.conf

    rm -f target/agent-rootfs/run/seatd.sock
}

build() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release --bin smolvm
    cargo build \
        --frozen \
        --profile release-small \
        -p smolvm-agent \

    install -Dm755 \
        "target/release-small/smolvm-agent" \
        target/agent-rootfs/usr/local/bin/smolvm-agent

    rm -f target/agent-rootfs/sbin/init

    ln -sf \
        /usr/local/bin/smolvm-agent \
        target/agent-rootfs/sbin/init

    truncate -s 512M storage-template.ext4
    mkfs.ext4 -F -q -m 0 -L smolvm storage-template.ext4

    truncate -s 512M overlay-template.ext4
    mkfs.ext4 -F -q -m 0 -L smolvm-overlay overlay-template.ext4
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/smolvm "$pkgdir/usr/bin/smolvm"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    mkdir -p "$pkgdir/usr/share/smolvm"
    cp -a target/agent-rootfs "$pkgdir/usr/share/smolvm/"
    install -Dm644 storage-template.ext4 "$pkgdir/usr/share/smolvm/storage-template.ext4"
    install -Dm644 overlay-template.ext4 "$pkgdir/usr/share/smolvm/overlay-template.ext4"
    # install -Dm755  "$pkgdir/usr/share/smolvm/init.krun" /usr/share/libkrun/init.krun
}

# vim: ts=4 sw=4 et:

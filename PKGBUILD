# Maintainer: taotieren <admin@taotieren.com>

pkgname=vnt-git
pkgver=1.1.2.r7.g565e80b
pkgrel=1
pkgdesc="A virtual network tool (or VPN),简便高效的异地组网、内网穿透工具"
arch=('any')
url="https://github.com/lbl8603/vnt"
license=(Apache-2.0)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=('cargo')
makedepends=('git' 'rust')
backup=()
options=('!strip' '!lto')
install=
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgbase%-git}/"

    git submodule update --init --recursive
    git tag --delete nightly
}

pkgver() {
    cd "${srcdir}/${pkgname%-git}/"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build -p vnt-cli --release --all-features
}

check() {
    cd "${srcdir}/${pkgname%-git}/"

    export RUSTUP_TOOLCHAIN=stable
    cargo test -p vnt-cli --all-features
}

package() {
    cd "${srcdir}/${pkgname%-git}/"

    export RUSTUP_TOOLCHAIN=stable
    cargo install --no-track --all-features --path ./vnt-cli --root "$pkgdir/usr/" --bins

    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/vnt-cli@.service" <<EOF
[Unit]
Description=VNT CLI Service for %i.
After=network.target

[Service]
Type=exec
User=%i
Restart=on-abort
ExecStart=/usr/bin/vnt-cli

[Install]
WantedBy=multi-user.target
EOF
}


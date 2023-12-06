# Maintainer: taotieren <admin@taotieren.com>

pkgname=vnt-git
pkgver=1.2.7.r0.g26d68ac
pkgrel=1
pkgdesc="A virtual network tool (or VPN),简便高效的异地组网、内网穿透工具"
arch=('any')
url="https://github.com/lbl8603/vnt"
license=(Apache-2.0)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(cargo
    systemd
    procps-ng)
makedepends=(git
    rust)
optdepends=('iptables: Linux kernel packet control tool (using legacy interface)')
backup=()
options=('!strip' '!lto')
install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}/"

    git describe --exclude=nightly --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgbase}/"

    git submodule update --init --recursive
}

build() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build -p vnt-cli --release --all-features
}

check() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    cargo test -p vnt-cli --all-features
}

package() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    cargo install --no-track --all-features --path ./vnt-cli --root "$pkgdir/usr/" --bins

    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/vnt-cli@.service" <<EOF
[Unit]
Description=VNT CLI Service for %i.
After = network.target syslog.target
Wants = network.target

[Service]
Type=forking
User=%i
Restart=on-abort
ExecStart=/usr/bin/vnt-cli
ExecStop=/usr/bin/vnt-cli --stop

[Install]
WantedBy=multi-user.target
EOF

    install -Dm644 /dev/stdin "${pkgdir}/etc/sysctl.d/80-vnt.conf" <<EOF
net.ipv4.ip_forward = 1
EOF

    install -Dm644 /dev/stdin "${pkgdir}/etc/vnt/iptables-vnt.rules" <<EOF
*nat
:POSTROUTING ACCEPT [0:0]
-A POSTROUTING ! -o vnt-tun -s 10.26.0.0/24 -j MASQUERADE
COMMIT
EOF
}


# Maintainer: Alessio Biancone <alebian1996@gmail.com>
pkgname=ra-multiplex
pkgver=0.2.0
pkgrel=1
pkgdesc="allows multiple LSP to share a single rust-analyzer instance per cargo workspace."
arch=('any')
url="https://github.com/pr2502/ra-multiplex"
license=('MIT')
makedepends=('rustup')
provides=('ra-multiplex' 'ra-multiplex-server')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
depends=('rust-analyzer')
sha256sums=('SKIP')

prepare() {
cd "${pkgname}"
cat <<EOF > ra-multiplex.service
[Unit]
Description=ra-multiplex service to keep the server alive
After=multi-user.target

[Service]
Type=simple
ExecStart=/usr/bin/ra-multiplex-server
Restart=always
RestartSec=2

[Install]
WantedBy=default.target
EOF
}

build() {
    cd ${pkgname}
    cargo build --release
}

package() {
    cd "${pkgname}"
    install -D -m755 "target/release/ra-multiplex-server" "${pkgdir}/usr/bin/ra-multiplex-server"
    install -D -m755 "target/release/ra-multiplex" "${pkgdir}/usr/bin/ra-multiplex"

    install -D -m644 ra-multiplex.service "${pkgdir}/usr/lib/systemd/user/ra-multiplex.service"
}

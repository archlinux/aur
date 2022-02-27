# Maintainer: sukanka <su975853527 [AT] gmail.com>

pkgname=rustdesk-server-demo
_pkgname=rustdesk-server
pkgver=r17.2e539cf
pkgrel=1
pkgdesc="Yet another remote desktop software, written in Rust. Works out of the box, no configuration required. Great alternative to TeamViewer and AnyDesk! "
arch=('x86_64')
url="https://github.com/rustdesk/rustdesk"
license=('GPL3')
makedepends=("cargo")
provides=(${_pkgname})
source=("git+https://github.com/rustdesk/rustdesk-server-demo.git")
sha256sums=('SKIP')
install=${pkgname}.install
backup=('usr/lib/systemd/system/rustdesk-server.service')

pkgver(){
    cd $srcdir/${pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare(){
    cd $srcdir
    echo """[Unit]
Description=RustDesk server
Requires=network.target
After=systemd-user-sessions.service

[Service]
Type=simple
Environment=\"IP=127.0.0.1\"
ExecStart=/usr/bin/rustdesk-server
PIDFile=/run/rustdesk-server.pid
KillMode=mixed
TimeoutStopSec=30
User=root
LimitNOFILE=100000

[Install]
WantedBy=multi-user.target
"""> rustdesk-server.service

}

build(){
    cd $srcdir/rustdesk-server-demo
    cargo build --release
}

package() {
     cd $srcdir
     install -Dm755 rustdesk-server-demo/target/release/rustdesk-server -t ${pkgdir}/usr/bin
     install -Dm644 rustdesk-server.service -t ${pkgdir}/usr/lib/systemd/system/
}

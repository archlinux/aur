# Maintainer: futpib <futpib@gmail.com>

_pkgname=iroh-ssh
pkgname="${_pkgname}-git"
pkgver=0.2.9.r2.g9f73ca8
pkgrel=1
pkgdesc="SSH to any machine without ip, behind a NAT/firewall without port forwarding or VPN setup"
arch=('x86_64' 'aarch64')
url="https://github.com/rustonbsd/iroh-ssh"
license=('MIT')
depends=('gcc-libs' 'openssh')
makedepends=('rust' 'cargo' 'git')
options=(!lto)
provides=('iroh-ssh')
conflicts=('iroh-ssh')
install="${pkgname}.install"
source=("git+https://github.com/rustonbsd/iroh-ssh.git"
        'iroh-ssh-server.service')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin/" "target/release/iroh-ssh"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/../iroh-ssh-server.service" "${pkgdir}/usr/lib/systemd/user/iroh-ssh-server.service"
}

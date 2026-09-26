# Maintainer: Eduard Tolosa <tolosaeduard@gmail.com>
# Contributor: K4YT3X <aur@k4yt3x.com>

pkgname=nspawn
pkgver=1.5.0
pkgrel=1
pkgdesc='Docker-like management of systemd-nspawn machines: OCI images from a hub, shared layers, a bridge network, driven over D-Bus'
arch=('x86_64' 'aarch64')
url='https://github.com/nspawn/nspawn'
license=('GPL-3.0-or-later')
depends=('systemd>=255' 'glibc' 'gcc-libs' 'iproute2' 'nftables')
makedepends=('cargo')
options=('!lto')
optdepends=('polkit: let users other than root drive nspawn'
            'mkosi: build images with nspawn build'
            'iptables-nft: keep the bridge reachable next to the forwarding rules of docker or ufw')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('496e2941cf5dc1fd7872ed6d0cac86b03fcdd99f483759d9a200c0ad1a8e7961')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --frozen
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --release --frozen
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 target/release/nspawn "${pkgdir}/usr/bin/nspawn"
  ./target/release/nspawn completions bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/nspawn"
  ./target/release/nspawn completions zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_nspawn"
  ./target/release/nspawn completions fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/nspawn.fish"
  ./target/release/nspawn manpage | install -Dm644 /dev/stdin "${pkgdir}/usr/share/man/man1/nspawn.1"
  install -Dm644 packaging/systemd/nspawn.service "${pkgdir}/usr/lib/systemd/system/nspawn.service"
  install -Dm644 packaging/dbus/org.nspawn.service "${pkgdir}/usr/share/dbus-1/system-services/org.nspawn.service"
  install -Dm644 packaging/dbus/org.nspawn.conf "${pkgdir}/usr/share/dbus-1/system.d/org.nspawn.conf"
  install -Dm644 packaging/polkit/org.nspawn.policy "${pkgdir}/usr/share/polkit-1/actions/org.nspawn.policy"
  install -Dm644 README.md docs/ARCHITECTURE.md docs/DBUS.md packaging/polkit/nspawn-wheel.rules -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -dm755 "${pkgdir}/etc/nspawn"
  install -dm711 "${pkgdir}/var/lib/nspawn"
}


# Maintainer: Eduard Tolosa <tolosaeduard@gmail.com>
# Contributor: K4YT3X <aur@k4yt3x.com>

pkgname=nspawn-git
pkgver=1.0.0.r1.gbd2c86c
pkgrel=1
pkgdesc='Docker-like management of systemd-nspawn machines: OCI images from a hub, shared layers, a bridge network, driven over D-Bus'
arch=('x86_64' 'aarch64')
url='https://github.com/nspawn/nspawn'
license=('GPL-3.0-or-later')
depends=('systemd>=255' 'glibc' 'gcc-libs' 'iproute2' 'nftables')
makedepends=('git' 'cargo')
optdepends=('polkit: let users other than root drive nspawn'
            'mkosi: build images with nspawn build'
            'iptables-nft: keep the bridge reachable next to the forwarding rules of docker or ufw')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!lto')
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  cargo build --release --frozen
}

check() {
  cd "${pkgname%-git}"
  cargo test --release --frozen
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 target/release/nspawn "${pkgdir}/usr/bin/nspawn"
  ./target/release/nspawn completions bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/nspawn"
  ./target/release/nspawn completions zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_nspawn"
  ./target/release/nspawn completions fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/nspawn.fish"
  ./target/release/nspawn manpage | install -Dm644 /dev/stdin "${pkgdir}/usr/share/man/man1/nspawn.1"
  install -Dm644 packaging/systemd/nspawn.service "${pkgdir}/usr/lib/systemd/system/nspawn.service"
  install -Dm644 packaging/dbus/org.nspawn.service "${pkgdir}/usr/share/dbus-1/system-services/org.nspawn.service"
  install -Dm644 packaging/dbus/org.nspawn.conf "${pkgdir}/usr/share/dbus-1/system.d/org.nspawn.conf"
  install -Dm644 packaging/polkit/org.nspawn.policy "${pkgdir}/usr/share/polkit-1/actions/org.nspawn.policy"
  install -Dm644 README.md docs/ARCHITECTURE.md docs/DBUS.md packaging/polkit/nspawn-wheel.rules -t "${pkgdir}/usr/share/doc/${pkgname%-git}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
  install -dm755 "${pkgdir}/etc/nspawn" "${pkgdir}/var/lib/nspawn"
}


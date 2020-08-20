# Maintainer : Ashcon Mohseninia <ashcon50@gmail.com>

pkgver=1.0.1.r61.g118726d
pkgname=razer-laptop-control-git
pkgrel=1
pkgdesc="Daemon and CLI for razer laptop's for RGB, fan and power control"
arch=(i686 x86_64)
url="https://github.com/rnd-ash/razer-laptop-control"
license=(GPL2)
depends=(razer-laptop-control-dkms-git)
makedepends=(git rust cargo)
conflicts=(openrazer-meta openrazer-driver-dkms openrazer-meta-git openrazer-daemon-git)
install=daemon.install
source=("git+https://github.com/rnd-ash/razer-laptop-control")
sha256sums=("SKIP")

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}/razer_control_gui"
  cargo build --release
}

package() {
  cd "razer-laptop-control/razer_control_gui/target/release"
  install -Dm755 razer-cli "${pkgdir}/usr/bin/razer-cli"
  install -Dm755 daemon "${pkgdir}/usr/share/razercontrol/daemon"
  install -D "../../razerdaemon.service" "${pkgdir}/etc/systemd/system/razerdaemon.service"
}

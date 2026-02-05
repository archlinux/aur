# Maintainer: ChoiHaram <altitudinem@google.com>
pkgname=snd-firewire-ctl-services-git
pkgver=0.2.0.r0.g123456
pkgrel=1
pkgdesc="ALSA FireWire control services (User space drivers) (Git version)"
arch=('x86_64')
url="https://github.com/alsa-project/snd-firewire-ctl-services"
license=('GPL3')
depends=('libhitaki' 'glib2')
makedepends=('cargo' 'git' 'clang')
provides=("snd-firewire-ctl-services")
conflicts=("snd-firewire-ctl-services")
source=("git+https://github.com/alsa-project/snd-firewire-ctl-services.git")
sha256sums=('SKIP')
options=(!lto)

pkgver() {
  cd "snd-firewire-ctl-services"
  # Parse tag format: "snd-firewire-ctl-services/v0.2.0"
  git describe --long --tags --match "snd-firewire-ctl-services/*" | sed 's#snd-firewire-ctl-services/v##;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "snd-firewire-ctl-services"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "snd-firewire-ctl-services"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --all-features
}

package() {
  cd "snd-firewire-ctl-services"
  
  # Install binaries
  find target/release/ -maxdepth 1 -type f -name "snd-*-ctl-service" -exec install -Dm755 {} -t "${pkgdir}/usr/bin" \;

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=reticulum-over-ethernet
pkgver=0.1.1
pkgrel=1
pkgdesc='Reticulum over Ethernet: carries Reticulum packets directly in Ethernet frames, without IP'
arch=('x86_64' 'aarch64')
url='https://github.com/ogarcia/roe'
license=('GPL-3.0-or-later AND MIT')
depends=('glibc' 'libcap' 'libgcc' 'python')
makedepends=('cargo' 'git')
optdepends=('python-rns: Reticulum network stack, to use RoeInterface')
install=reticulum-over-ethernet.install
# The release profile already strips the binary: no symbols for a -debug package.
options=('!debug')
source=("git+${url}.git#tag=${pkgver}")
b2sums=('3f35108a7a9c9fa6cb2014192971271db65a52688958bea65797e339e2f735c3654e05fbb074e63e31cd06ee1c55511acfbba37f140d53418c9b5ded72fbcefc')

prepare() {
  cd roe
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd roe
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd roe
  export RUSTUP_TOOLCHAIN=stable
  # Unit tests only: the end-to-end tests need Reticulum and user namespaces.
  cargo test --frozen --all-features
}

package() {
  cd roe
  install -Dm755 target/release/roe "${pkgdir}/usr/bin/roe"

  # Reticulum interface module. Reticulum loads interface modules from the
  # "interfaces" directory of its config directory, following symlinks, so
  # each config directory links to this copy and gets every update.
  install -Dm644 dist-files/RoeInterface.py "${pkgdir}/usr/share/roe/RoeInterface.py"

  # System-wide config: only read by Reticulum when /etc/reticulum/config
  # exists, so it does not affect per-user setups.
  install -dm755 "${pkgdir}/etc/reticulum/interfaces"
  ln -s /usr/share/roe/RoeInterface.py "${pkgdir}/etc/reticulum/interfaces/RoeInterface.py"

  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md README.es.md
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/docs" docs/*.md

  # RoeInterface.py is MIT licensed and carries its own notice.
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /usr/share/roe/RoeInterface.py "${pkgdir}/usr/share/licenses/${pkgname}/RoeInterface.py"
}

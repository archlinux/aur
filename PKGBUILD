# Maintainer: Briar Campbell <nex@nexusxe.com>
_basename=fw-ec-utils
_pkgname=fw-fanctrl-rs
pkgname=${_pkgname}-git
pkgver=r106.g20b84a6
pkgrel=1
pkgdesc="A lightweight daemon for custom fan control on Framework laptops"
arch=('x86_64')
url="https://github.com/NexusXe/fw-ec-utils"
license=('AGPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'systemd')
backup=('etc/fw-fanctrl-rs/config.toml')
makedepends=('cargo-nightly' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

install="${_pkgname}.install"

source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${_basename}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_basename}"
  export RUSTUP_TOOLCHAIN=nightly
  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
  cd "${_basename}"
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features -p "${_pkgname}"
}

check() {
  cd "${_basename}"
  export RUSTUP_TOOLCHAIN=nightly
  cargo test --frozen --all-features -p "${_pkgname}"
}

package() {
  cd "${_basename}"

  # install binary
  install -Dm755 "target/release/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"

  # install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${_pkgname}"

  # install systemd service
  install -Dm644 fw-fanctrl.service "$pkgdir/usr/lib/systemd/system/fw-fanctrl@.service"
  # fix path to binary
  sed -i "s|/usr/local/bin/${_pkgname}|/usr/bin/${_pkgname}|g" "$pkgdir/usr/lib/systemd/system/fw-fanctrl@.service"

  # install default external curves
  install -d "$pkgdir/etc/${_pkgname}/curves"
  install -Dm644 curves/* "$pkgdir/etc/${_pkgname}/curves/"

  # install default config file
  install -Dm644 config.toml "$pkgdir/etc/${_pkgname}/config.toml"

  # install the header
  install -Dm644 include/fw-fanctrl-rs.h "$pkgdir/usr/include/${_pkgname}.h"

  # install the examples
  install -d "$pkgdir/usr/share/doc/${_pkgname}/examples"
  install -Dm644 examples/* "$pkgdir/usr/share/doc/${_pkgname}/examples/"
}

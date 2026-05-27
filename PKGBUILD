# Maintainer: Edu4rdSHL <edu4rdshl@protonmail.com>

pkgbase=strata
pkgname=('strata-daemon' 'gnome-shell-extension-strata')
_uuid='strata@edu4rdshl.dev'
pkgver=0.8.0
pkgrel=1
pkgdesc='A fast, stutter-free clipboard manager'
arch=('x86_64' 'aarch64')
url='https://github.com/Edu4rdSHL/Strata'
license=('GPL-3.0-or-later')
makedepends=('cargo' 'glib2')
options=(!lto)
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/Edu4rdSHL/Strata/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('b4967921ef08a73830eb707772cf94d3bef70fa88d6b105002a39c8e30421c9cbeb6f29a322b13b6213ce0c2d8ae7a5c2ca96c2cc9928d0c5fb81c4b402d51ac')

prepare() {
  cd "Strata-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')" \
    --manifest-path strata-daemon/Cargo.toml
}

build() {
  cd "Strata-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features --manifest-path strata-daemon/Cargo.toml
  glib-compile-schemas "${_uuid}/schemas"
}

check() {
  cd "Strata-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --all-features --manifest-path strata-daemon/Cargo.toml
}

package_strata-daemon() {
  pkgdesc='Strata clipboard manager backend daemon'
  depends=('dbus' 'wayland')
  conflicts=('strata-daemon-git')
  provides=('strata-daemon')

  cd "Strata-${pkgver}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/strata-daemon"
  install -Dm 644 contrib/systemd/strata-daemon.service \
    "${pkgdir}/usr/lib/systemd/user/strata-daemon.service"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

package_gnome-shell-extension-strata() {
  pkgdesc='Strata clipboard manager GNOME Shell extension'
  arch=('any')
  depends=('gnome-shell>=45' 'strata-daemon')
  conflicts=('gnome-shell-extension-strata-git')
  provides=('gnome-shell-extension-strata')

  cd "Strata-${pkgver}"
  local _extdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -d "${_extdir}/schemas" "${_extdir}/ui"
  install -m 644 -t "${_extdir}" \
    "${_uuid}"/*.js "${_uuid}"/*.css "${_uuid}/metadata.json"
  install -m 644 -t "${_extdir}/ui" "${_uuid}/ui"/*.js
  install -m 644 -t "${_extdir}/schemas" \
    "${_uuid}/schemas"/*.gschema.xml \
    "${_uuid}/schemas/gschemas.compiled"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}


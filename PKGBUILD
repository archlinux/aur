# Maintainer: Edu4rdSHL <edu4rdshl@protonmail.com>

pkgbase=strata-git
pkgname=('strata-daemon-git' 'gnome-shell-extension-strata-git')
_uuid='strata@edu4rdshl.dev'
pkgver=r1.4e3e434
pkgrel=1
pkgdesc='A fast, stutter-free clipboard manager'
arch=('x86_64' 'aarch64')
url='https://github.com/Edu4rdSHL/Strata'
license=('GPL-3.0-or-later')
makedepends=('cargo' 'git' 'glib2')
options=(!lto)
source=("git+https://github.com/Edu4rdSHL/Strata.git")
b2sums=('SKIP')

pkgver() {
  cd "Strata"

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "Strata"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')" \
    --manifest-path strata-daemon/Cargo.toml
}

build() {
  cd "Strata"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features --manifest-path strata-daemon/Cargo.toml
  glib-compile-schemas "${_uuid}/schemas"
}

check() {
  cd "Strata"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --all-features --manifest-path strata-daemon/Cargo.toml
}

package_strata-daemon-git() {
  pkgdesc='Strata clipboard manager backend daemon (git)'
  depends=('dbus' 'wayland')
  conflicts=('strata-daemon')
  provides=('strata-daemon')

  cd "Strata"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/strata-daemon"
  install -Dm 644 contrib/systemd/strata-daemon.service \
    "${pkgdir}/usr/lib/systemd/user/strata-daemon.service"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

package_gnome-shell-extension-strata-git() {
  pkgdesc='Strata clipboard manager GNOME Shell extension (git)'
  arch=('any')
  depends=('gnome-shell>=45' 'strata-daemon')
  conflicts=('gnome-shell-extension-strata')
  provides=('gnome-shell-extension-strata')

  cd "Strata"
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


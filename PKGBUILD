# Maintainer: lyokha113 <lyokha113@users.noreply.github.com>

pkgname=lcfibe
pkgver=0.1.0
pkgrel=1
pkgdesc="Offline-first desktop workbench for building, sending, and inspecting FIX traffic"
arch=('x86_64')
url="https://github.com/lyokha113/lcfibe"
license=('Apache-2.0')
options=('!debug' '!lto')
depends=(
  'gtk3'
  'hicolor-icon-theme'
  'webkit2gtk-4.1'
)
makedepends=(
  'nodejs-lts-krypton'
  'patchelf'
  'pnpm'
  'rustup'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('13ced9209dd1725517a8f9f2e9d2151c80b1a1d9c4112cc4c274ca2e46f6756d')

prepare() {
  cd "${pkgname}-${pkgver}"

  export CARGO_HOME="${srcdir}/cargo-home"
  export RUSTUP_HOME="${srcdir}/rustup-home"

  rustup toolchain install 1.95.0 --profile minimal
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
  pnpm install --frozen-lockfile
}

build() {
  cd "${pkgname}-${pkgver}"

  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_NET_OFFLINE=true
  export RUSTUP_HOME="${srcdir}/rustup-home"
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=${srcdir}=/usr/src/debug/${pkgname}"

  pnpm tauri build --bundles deb
}

package() {
  cd "${pkgname}-${pkgver}"

  local deb_path data_archive
  deb_path="$(find target/release/bundle/deb -type f -name '*.deb' -print -quit)"
  [[ -n "${deb_path}" ]] || return 1

  data_archive="$(ar t "${deb_path}" | awk '/^data\.tar/{ print; exit }')"
  [[ -n "${data_archive}" ]] || return 1
  ar p "${deb_path}" "${data_archive}" | bsdtar -xf - -C "${pkgdir}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -s lcfibe-desktop "${pkgdir}/usr/bin/lcfibe"
}

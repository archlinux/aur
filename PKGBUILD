# Maintainer: ArcticLampyrid <ArcticLampyrid@outlook.com>

pkgname=paseo-tray-git
_pkgname=paseo-tray
pkgver=0.1.0.r2.g82ec9fb
pkgrel=1
pkgdesc='System tray controller for the Paseo daemon'
arch=('x86_64')
url='https://github.com/ArcticLampyrid/paseo-tray'
license=('GPL-3.0-only')
depends=('fontconfig'
         'glibc'
         'hicolor-icon-theme'
         'libgcc'
         'libxkbcommon')
makedepends=('cargo'
             'git')
optdepends=('paseo: the CLI the tray controls (not needed if configured to use another path)')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  local version revision
  version=$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml | head -n1)
  revision=$(git rev-list --count HEAD)
  printf '%s.r%s.g%s' "$version" "$revision" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  CARGO_TARGET_DIR=target cargo build --frozen --release
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 target/release/paseo-tray "${pkgdir}/usr/bin/paseo-tray"
  install -Dm644 "packaging/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 assets/paseo-logo.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
  # The bundled logo is Apache-2.0; NOTICE records its provenance.
  install -Dm644 assets/NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}

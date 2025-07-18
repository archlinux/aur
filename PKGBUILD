# Maintainer: bcoiner <x6ji7ar9 at anonaddy dot me>

pkgbase=asusctl-nosystemd
pkgname=(asusctl-nosystemd rog-control-center-nosystemd)
pkgver=6.1.12
pkgrel=1
pkgdesc="A control daemon, CLI tools, and a collection of crates for interacting with ASUS ROG laptops (with no SystemD)"
arch=('x86_64')
url="https://gitlab.com/asus-linux/asusctl"
license=('MPL-2.0')
makedepends=(clang cmake fontconfig git hicolor-icon-theme libayatana-appindicator libinput libusb rust seatd)
source=("git+https://gitlab.com/asus-linux/asusctl.git#tag=$pkgver")
sha256sums=('b09f27a6d906e942f17dc537391ab209bed25e1cc3d124a2be50474cbc701368')

_PROJECT=asusctl

prepare() {
  cd "${_PROJECT}"

  # Keep rust/cargo build-dependency management inside the build directory
  export CARGO_HOME="${srcdir}/cargo"

  # Follow Rust package guidelines
  ## https://wiki.archlinux.org/title/Rust_package_guidelines
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_PROJECT}"

  # Keep rust/cargo build-dependency management inside the build directory
  export CARGO_HOME="${srcdir}/cargo"

  # Follow Rust package guidelines
  ## https://wiki.archlinux.org/title/Rust_package_guidelines
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  make build
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_asusctl-nosystemd() {
  pkgdesc="${pkgdesc/tools/CLI tools}"
  depends=(gcc-libs glibc hicolor-icon-theme libusb)
  conflicts=(gnome-shell-extension-asusctl-gnome asusctl)
  provides=(asusctl)
  install=asusctl.install
  optdepends=(
    'acpi_call: fan control'
    'supergfxctl: hybrid GPU control'
    'asusctltray: tray profile switcher'
    'rog-control-center-nosystemd: app to control asusctl'
  )

  cd "${_PROJECT}"
  export CARGO_HOME="${srcdir}/cargo"
  make DESTDIR="${pkgdir}" install

  _pick rogcc "${pkgdir}/usr/bin/rog-control-center" \
     "${pkgdir}/usr/share/applications/rog-control-center.desktop" \
     "${pkgdir}/usr/share/icons/hicolor/512x512/apps/rog-control-center.png" \
     "${pkgdir}/usr/share/rog-gui"
}

package_rog-control-center-nosystemd() {
  depends=(asusctl-nosystemd fontconfig freetype2 gcc-libs glibc hicolor-icon-theme libayatana-appindicator libinput libxkbcommon mesa seatd)
  conflicts=(rog-control-center)
  provides=(rog-control-center)
  pkgdesc="App to control asusctl"
  mv rogcc/* "${pkgdir}"
}

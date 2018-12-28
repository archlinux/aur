# Maintainer: Caleb Bassi <calebjbassi@gmail.com>

pkgname=evscript-git
_pkgname=${pkgname%-git}
pkgver=r14.de6e09b
pkgrel=1
pkgdesc="A tiny sandboxed Dyon scripting environment for evdev input devices that lets you do e.g. xcape in Wayland"
arch=("any")
url="https://github.com/myfreeweb/evscript"
license=("MIT")
makedepends=("git" "cargo")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+${url}")
md5sums=("SKIP")

# https://wiki.archlinux.org/index.php/VCS_package_guidelines
pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=loop
build() {
  cd "${_pkgname}"
  if command -v rustup > /dev/null 2>&1; then
    RUSTFLAGS="-C target-cpu=native" rustup run stable \
      cargo build --release
  elif rustc --version | grep -q nightly; then
    RUSTFLAGS="-C target-cpu=native" \
      cargo build --release
  else
    cargo build --release
  fi
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}/target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

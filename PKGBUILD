# Maintainer: Lorenzo Bodini <lorenzo.bodini.private@gmail.com>

pkgname=bodo_connect-git
_pkgname=${pkgname%-git}
pkgver=v0.6.4.r0.g6104c88
pkgrel=2
pkgdesc="A library for mapping/connecting to your hosts in the whole world wide web."
arch=("any")
url="https://github.com/topongo/bodo_connect"
license=("GPL3")
depends=("openssh")
makedepends=("git" "cargo")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+${url}")
md5sums=("SKIP")

# https://wiki.archlinux.org/index.php/VCS_package_guidelines
pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
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
  install -Dm755 "${srcdir}/${_pkgname}/target/release/bodoConnect" "${pkgdir}/usr/bin/bodoConnect"
}


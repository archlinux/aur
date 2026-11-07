# Maintainer: Frikilinux <frikilinux@gmail.com>

pkgname=aries-connect-git
_pkgname=${pkgname%-git}
pkgver=v0.4.0.r0.g544aa7f
pkgrel=1
pkgdesc="KDE Connect-compatible daemon exposing devices over D-Bus (no KDE/Qt dependencies)"
arch=('x86_64')
# url="https://github.com/Frikilinux/aries-connect"
url="https://gitlab.com/zotta/aries-connect"
license=(GPL-2.0-or-later)
depends=(
  glibc
  libgcc
)
makedepends=(
  git
  cargo
)
conflicts=(
  aries-connect
  aries-connect-bin
)
options=(!lto)
source=(${_pkgname}::git+${url}.git)
sha256sums=(SKIP)

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${_pkgname}"
  install -Dm755 target/release/aries-connect "${pkgdir}/usr/bin/aries-connect"
  install -Dm644 contrib/aries-connect.service \
    "${pkgdir}/usr/lib/systemd/user/aries-connect.service"
  for f in doc/*; do
    install -Dm 644 "$f" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "$f")"
  done
}

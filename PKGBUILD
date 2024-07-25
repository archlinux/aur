# Maintainer: Lorenzo Bodini <lorenzo.bodini.private@gmail.com>

pkgname=bodo_connect-git
_pkgname=${pkgname%-git}
pkgver=v0.7.0.r0.gfeb976e
pkgrel=1
pkgdesc="A library for mapping/connecting to your hosts in the whole world wide web."
arch=(x86_64 armv7)
url="https://github.com/topongo/bodo_connect"
license=(GPL-3.0-or-later)
depends=(openssh glibc openssl gcc-libs)
makedepends=(git cargo)
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+${url}")
md5sums=(SKIP)

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${_pkgname}"
  if command -v rustup > /dev/null 2>&1; then
    RUSTFLAGS="-C target-cpu=native" rustup run nightly \
      cargo build --release
  elif rustc --version | grep -q nightly; then
    RUSTFLAGS="-C target-cpu=native" \
      cargo +nightly build --release
  else
    cargo +nightly build --release
  fi
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}/target/release/bodoConnect" "${pkgdir}/usr/bin/bodoConnect"
}


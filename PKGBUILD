# Maintainer: zany130

pkgname=chromecast-sink-git
_pkgname=chromecast-sink
pkgver=0.0.1.r2.g0d1fdae
pkgrel=1
pkgdesc='Use Google Chromecast and Nest devices as a PipeWire audio output'
arch=('x86_64')
url='https://github.com/Nerahikada/chromecast-sink'
license=('MIT')
depends=('glibc' 'libgcc' 'libpipewire' 'opus' 'pipewire')
makedepends=('cargo' 'clang' 'git')
optdepends=('wireplumber: PipeWire session management when not provided by the desktop')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
# ring contains C objects; upstream's release profile has no split debug symbols.
options=('!lto' '!debug')
source=("${_pkgname}::git+https://github.com/Nerahikada/chromecast-sink.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags --abbrev=7 |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --bin "${_pkgname}"
}

check() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

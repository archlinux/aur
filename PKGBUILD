# Maintainer: qubidt <qubidt at gmail dot com>

pkgname=ebou
_pkgname=Ebou
pkgver=0.2.0
_pkgver=${pkgver}-742
pkgrel=1
pkgdesc="A cross platform Mastodon Client written in Rust"
arch=('i686' 'x86_64')
url="https://github.com/terhechte/Ebou"
license=('GPL3')
depends=(
    'cairo'
    'gcc-libs'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'libsoup3'
    'libxcb'
    'openssl'
    'pango'
    'webkit2gtk-4.1'
    'xdotool'
)
makedepends=('cargo' 'pandoc')
source=("${pkgname}-${_pkgver}.tar.gz::${url}/archive/${_pkgver}.tar.gz"
        "ebou.desktop"
        # fixing linux build
        "PR-10.patch::${url}/pull/10.patch")
sha256sums=('d542299a1e7f1202f5373195af504881b7a6331bb09cb05699632b1531017659'
            '0aebcda5635ec1982ca2dbd3455744f4d1b053418c1afe5b651dc69f6b9a4379'
            '98e0cf0416d0677309ad2647a7e5baec4101dbbdf64615987f565eddd103a335')
# https://github.com/briansmith/ring/issues/1444
options=('!lto')

prepare() {
  cd "${_pkgname}-${_pkgver}"
  patch -Np1 -i "${srcdir}/PR-10.patch"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${_pkgname}-${_pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "${_pkgname}-${_pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --release --frozen
}

build() {
  cd "${_pkgname}-${_pkgver}"
  cargo build --release
}

package() {
  install -Dm644 "ebou.desktop" "${pkgdir}/usr/share/applications/ebou.desktop"
  cd "${_pkgname}-${_pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  for i in 16 32 128 256 512; do
    install -Dm644 "icons/Icon.iconset/icon-${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/ebou.png"
  done
}

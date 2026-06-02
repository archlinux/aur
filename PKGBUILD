pkgname=dcr-dev-git
pkgver=r154.6885a82
pkgrel=1
pkgdesc="Cargo-like utility to manage C/C++ projects (development branch VCS)"
arch=('x86_64' 'aarch64')
url="https://github.com/dexoron/dcr"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'git')
provides=('dcr')
conflicts=('dcr')
optdepends=(
  'gcc: build C/C++ projects with GCC'
  'clang: build C/C++ projects with Clang'
)
source=("${pkgname}::git+${url}.git#branch=dev")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  unset CFLAGS CXXFLAGS LDFLAGS
  export RUSTFLAGS="-C linker=cc"
  
  cargo build --release --locked
}

package() {
  cd "${pkgname}"
  install -Dm755 "target/release/dcr" "${pkgdir}/usr/bin/dcr"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

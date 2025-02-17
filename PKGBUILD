
# Maintainer:  Daniel Fichtinger <daniel@ficd.ca>

_pkgname="iwe"
pkgname="${_pkgname}-git"
pkgver=iwes.0.0.20.r0.gf8da9b9
pkgrel=1
pkgdesc="Text editor extension for markdown notes taking"
arch=('x86_64' 'aarch64')
url="https://github.com/iwe-org/${_pkgname}"
license=("Apache-2.0")
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
provides=('iwe' 'iwes')
conflicts=('iwe' 'iwes')

source=($pkgname::git+https://github.com/iwe-org/iwe.git)

sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname
  cargo build --release
}

package() {
  cd $pkgname
  install -Dm 755 "${srcdir}/${pkgname}/target/release/iwe" -t "${pkgdir}/usr/bin/"
  install -Dm 755 "${srcdir}/${pkgname}/target/release/iwes" -t "${pkgdir}/usr/bin/"
}


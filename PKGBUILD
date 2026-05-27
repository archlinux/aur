pkgname=aodv-git
_pkgname=aodv
_binname=aodv
pkgver=0.2.1.r0.g0000000
pkgrel=1
pkgdesc='Userspace AODV control-plane implementation based on RFC 3561'
arch=('x86_64' 'aarch64')
url='https://github.com/Fierthraix/aodv-rs'
license=('MIT OR Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd "${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked
}

build() {
  cd "${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo build --release --locked --all-features
}

package() {
  cd "${_pkgname}"
  install -Dm755 "target/release/${_binname}" "${pkgdir}/usr/bin/${_pkgname}"
}

# Maintainer: coldBug <coldbug@e.mail.de>
pkgname=rusthound-ce-git
_pkgname=${pkgname%-ce-git}
pkgver=c4e8eb3
pkgrel=1
pkgdesc="BloodHoundCE collector tool written in Rust."
arch=('any')
url="https://github.com/NH-RED-TEAM/RustHound"
license=("MIT")
makedepends=("git" "cargo" "clang" "rustup")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}::git+${url}.git#branch=v2")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo update
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  install -Dm644 "${_pkgname}/LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm755 "${_pkgname}/target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

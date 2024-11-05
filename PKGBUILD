# Maintainer: coldBug <coldbug@e.mail.de>
pkgname=rusthound-ce-git
_pkgname=${pkgname%-git}
pkgver=r10.6aacf86
pkgrel=1
pkgdesc="BloodHoundCE collector tool written in Rust."
arch=('any')
url="https://github.com/g0h4n/RustHound-CE"
license=("MIT")
makedepends=("git" "cargo" "clang" "rustup")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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

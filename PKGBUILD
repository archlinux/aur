# Maintainer: envolution
# Contributor: Jordan MacDonald <jordan(at)wastedintelligence(dot)com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# shellcheck shell=bash disable=SC2034,SC2154

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgauthor=jmacdonald
pkgname=amp
pkgver=0.7.1
pkgrel=2
pkgdesc='A modal text editor for the terminal.'
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('GPL-3.0-only')
depends=(gcc-libs glibc oniguruma libgit2)
makedepends=('cargo' 'git' 'cmake')
source=("https://github.com/${_pkgauthor}/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('21227a5212777e5687af0357eb34ca6498f47eabbc9e37d2db3fef0de65dab8daf99a6270485b551b3a2660a0aedf90b494b2ea0cfd66027815dbde369b78497')

prepare(){
  cd "$pkgname-$pkgver"
  sed -i '/^\[dependencies\.git2\]/,/^$/s/version = "0\.18"/version = "0.20.2"/' ./Cargo.toml
  export RUSTONIG_SYSTEM_LIBONIG=1  
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}
build() {
  cd "$pkgname-$pkgver"
  export RUSTONIG_SYSTEM_LIBONIG=1
  cargo build --release --all-features
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
# vim:set ts=2 sw=2 et:

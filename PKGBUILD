# Maintainer: gigas002 <gigas002@pm.me>

_pkgname="wau"
pkgname="${_pkgname}-git"
pkgver=r86.gbdcb338
pkgrel=1
pkgdesc="World of Warcraft Addon Updater"
arch=("x86_64")
url="https://github.com/Gigas002/wau"
license=('GPL-3.0-only')
depends=(git)
makedepends=(git cargo)
optdepends=('github-cli: route GitHub API requests through authenticated CLI instead of client-side API keys')
provides=(wau)
conflicts=(wau)
source=("${_pkgname}::git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  # aws-lc-sys (pulled in transitively via reqwest->rustls->aws-lc-rs) only strips -flto*
  # from CFLAGS for FIPS builds (see its cmake_builder.rs); with LTO in CFLAGS the vendored
  # BoringSSL is compiled to GIMPLE objects that rustc/lld can't resolve, breaking the link
  # with "undefined symbol: aws_lc_*" for a non-FIPS build. Strip LTO flags for this build only.
  local _strip_lto='s/-flto[^ ]*//g; s/-f(no-)?fat-lto-objects//g'
  export CFLAGS=$(sed -E "$_strip_lto" <<< "$CFLAGS")
  export CXXFLAGS=$(sed -E "$_strip_lto" <<< "$CXXFLAGS")
  export LDFLAGS=$(sed -E "$_strip_lto" <<< "$LDFLAGS")
  cargo build --release --all-features
}

package() {
  cd "${_pkgname}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/wau"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

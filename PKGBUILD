# Maintainer: MithicSpirit <rpc01234 at gmail dot com>
# Based on ruff PKGBUILD
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Leonidas Spyropoulos <artafinde@archlinux.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgbase=uv
pkgname=($pkgbase python-$pkgbase)
pkgver=0.1.0
pkgrel=1
pkgdesc='An extremely fast Python package installer and resolver, written in Rust'
arch=(x86_64)
url="https://github.com/astral-sh/$pkgbase"
license=(MIT Apache)
depends=(
  gcc-libs
  glibc
)
makedepends=(
  cargo
  maturin
  python-installer
  cmake
)
options=(!lto)
_archive="$pkgbase-$pkgver"
source=($url/archive/refs/tags/$pkgver/$_archive.tar.gz)
sha512sums=('77e345f90af2e50158b7def786469602316128124bedd10e98bab9494985402114d3415eeefeb2b6c2059d1f97f4e89cde033c787228d1eba5434277d99dffc8')
b2sums=('1aefb4d2e53e07f10829c50c31d7837d2f809feb323e3c128af66eb679d7a0ed04a0ba91fac2e529c5502ee621ce039d2ae96a1f6a41828b3154492eee9b6d65')

prepare() {
  cd "$_archive"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_archive"
  maturin build --locked --release --all-features --target "$(rustc -vV | sed -n 's/host: //p')" --strip
}

check() {
  # disable for now since it requires python3.12
  return 0
  cd "$_archive"
  cargo test -p uv --frozen --all-features
}

_package_common() {
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-*
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

package_uv() {
  cd "$_archive"
  _package_common
  local _target="target/$(rustc -vV | sed -n 's/host: //p')/release/uv"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$_target"
}

package_python-uv() {
  cd "$_archive"
  _package_common
  depends=(python "$pkgbase")
  python -m installer -d "$pkgdir" target/wheels/*.whl
  rm -rf "$pkgdir/usr/bin"
}

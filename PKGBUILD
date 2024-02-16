# Maintainer: MithicSpirit <rpc01234 at gmail dot com>
# Based on ruff PKGBUILD
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Leonidas Spyropoulos <artafinde@archlinux.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgbase=uv
pkgname=($pkgbase python-$pkgbase)
pkgver=0.1.2
pkgrel=1
pkgdesc='An extremely fast Python package installer and resolver, written in Rust'
arch=(x86_64 aarch64)
url="https://github.com/astral-sh/$pkgbase"
license=(MIT Apache)
depends=(gcc-libs glibc)
makedepends=(cargo maturin python-installer cmake)
checkdepends=(python python-zstandard libxcrypt-compat clang)
options=(!lto)
_archive="$pkgbase-$pkgver"
source=($url/archive/refs/tags/$pkgver/$_archive.tar.gz)
sha512sums=('e0fafad759f17fe7f3b11997416c01a9f03919696d4b8fe845b6f61577ad7c87e25da54c321e2e225930deea859f7d1add68dbbc9b8ca2dbe9d30b7ab98189e7')
b2sums=('807d862c322cb0cc226b3683e2fe6592c2cbf52b031036be05ff3b1298fca404066e1b032fa0dfa480ad80bb964f0082430ac4392d3f76dc15c73612e5b9ec9f')

prepare() {
  cd "$_archive"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_archive"
  maturin build --locked --release --all-features --target "$(rustc -vV | sed -n 's/host: //p')" --strip
}

check() {
  cd "$_archive"
  python3 ./scripts/bootstrap/install.py
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

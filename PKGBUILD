# Maintainer: MithicSpirit <rpc01234 at gmail dot com>
# Based on ruff PKGBUILD
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Leonidas Spyropoulos <artafinde@archlinux.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgbase=uv
pkgname=($pkgbase python-$pkgbase)
pkgver=0.1.5
pkgrel=2
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
sha512sums=('236aacb50faf140e014621e96f1ddff451c10f83f3662c9c8b40582b5959cec6e40410f4b1d84b6fe6fc10823e9b68da4278f16807359f9e52ec7bea1f425130')
b2sums=('e3d801b26c5dce5fdc2aab2d6be93f3a119f31185ba56a46d463c01fef76a04848a828e0cd2af6b6169684b565365902a293d42b0e46ce778d5282a114ad2c09')

prepare() {
  cd "$_archive"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_archive"
  export RUSTUP_TOOLCHAIN=stable
  maturin build --locked --release --all-features --target "$(rustc -vV | sed -n 's/host: //p')" --strip
}

check() {
  cd "$_archive"
  export RUSTUP_TOOLCHAIN=stable
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

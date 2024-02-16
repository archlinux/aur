# Maintainer: MithicSpirit <rpc01234 at gmail dot com>
# Based on ruff PKGBUILD
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Leonidas Spyropoulos <artafinde@archlinux.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgbase=uv
pkgname=($pkgbase python-$pkgbase)
pkgver=0.1.1
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
sha512sums=('db2d235ac9d33e69595d86bc608d99435567f149ad03493ae7a5c156bc3f395973feda4e566f9ae672fae686ea47dd967b0b9e1ec1bf1cf1fa71a9f5901939c7')
b2sums=('a929b2f3b4e504b4417d9ecc1b9d7ebc213c31c53ddf3a9cbf11ec1ddd3f928acbcbd8320dcb7e17d8700fb1015b3031765228ef9edd9552b537426952e6ea7a')

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

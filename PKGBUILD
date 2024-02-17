# Maintainer: MithicSpirit <rpc01234 at gmail dot com>
# Based on ruff PKGBUILD
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Leonidas Spyropoulos <artafinde@archlinux.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgbase=uv
pkgname=($pkgbase python-$pkgbase)
pkgver=0.1.3
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
sha512sums=('49a7ed5c86229d0314537b880227cf2344a19828fdd27e43f7da4ee0a8c7c191da4f9afbf2f9f3ca39f4a1ba24250fd4e2efbf361de53ca31011a802f9e5b59c')
b2sums=('dd7f287c9173dc352a77b70c3f759e174896425124dbdc424433d52a643bafdf7b7b2a5181577a3f1f246352564b59462855896d32ff107dd25722341b4b9155')

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

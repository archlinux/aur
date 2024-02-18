# Maintainer: MithicSpirit <rpc01234 at gmail dot com>
# Based on ruff PKGBUILD
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Leonidas Spyropoulos <artafinde@archlinux.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgbase=uv
pkgname=($pkgbase python-$pkgbase)
pkgver=0.1.4
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
sha512sums=('bb8c8ee81e6850f02169bde54ef3119510d07ddb7fbbbdc024c4883c7b0695ac2f79df7dab69e2b33ae2d1983a611efac6af3b381644c215ece5ae4be1d114f7')
b2sums=('f4faeb37c2b38386b2358e0f946fb8e4e6db207b030614f49a08304178306e0be8ef363de37a4f21339f459e3e69b12b834a8243563c15c3bfd3d88810056308')

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

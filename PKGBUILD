# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=crunch64
pkgname=(
  crunch64
  python-crunch64
)
pkgver=0.6.1
pkgrel=2
pkgdesc='A library for handling common N64 compression formats'
arch=(x86_64)
url='https://github.com/decompals/crunch64'
license=(MIT)
depends=(
  glibc
  gcc-libs
)
makedepends=(
  git
  rust
  python-build
  python-installer
  python-maturin
)
source=("$pkgbase::git+$url#tag=$pkgver")
sha512sums=('dafa3fe2abf377dd49b7b3c2cb45735d10a7b49dcb4e83685748fef1927783ea12525f6a3418b6ff3cae4a2fe30b37cece1a79304c8347cb4d2ec6f1dfc3365b')
b2sums=('c598725ec6fa0c3be65b9f150c6f4a3c9e10c49877e1befc678f61cf756a57c068b9101043bed8f5b0c2df41effc0eb3a4bd4ec6627d18bd7d6ebaba06e83c19')

prepare() {
  cd "$pkgbase"

  # download dependencies
  cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
  cd "$pkgbase"

  # cli/lib
  cargo build --frozen --release --all-features

  # wheel
  cd lib
  python -m build --wheel --no-isolation
}

package_crunch64() {
  cd "$pkgbase"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" target/release/crunch64

  # shared library
  install -vDm644 -t "$pkgdir/usr/lib" target/release/libcrunch64.so

  # headers
  install -vd "$pkgdir/usr/include"
  cp -vr c_bindings/include/* "$pkgdir/usr/include"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_python-crunch64() {
  pkgdesc+=' - Python bindings'
  depends+=(python)

  cd "$pkgbase"

  python -m installer --destdir="$pkgdir" lib/dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

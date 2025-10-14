# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgbase=minify-html
pkgname=(minify-html python-minify-html)
pkgver=0.16.4
pkgrel=1
pkgdesc="Extremely fast and smart HTML + JS + CSS minifier"
arch=(x86_64)
url="https://github.com/wilsonzlin/minify-html"
license=(MIT)
makedepends=(
  cargo
  maturin
  python-installer
)
source=(
  $pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
  Cargo.lock
  python-module-name.patch
)
b2sums=('7706d048ef9f79dc67c8dd3095f2f1d0f4f5a12351af4a53f375b72dff6e978cbfe904f017e6ef05834fda4df65c99dae36d40c62eb557d5d58dc546d212ca15'
        'a70a3f1526ca44b37dced089a02e378aaf2344e98cfe3cfdf1656c15f3f79a1f45b68817803782d1d94e5bf33fd5a0edce935c1c7d451a81e0bc67a86f6917e6'
        'd42ea6b62bf5a933443bc9d984d4e17fdacb1dc1dc0cc11704b48a4aa54cdc25457ef4ff35c1997dff24ae7a9c8d4b6f7a7100148561dd80395b454577f3b43a')

prepare() {
  cd $pkgbase-$pkgver

  # Cargo.lock is not in the repo https://github.com/wilsonzlin/minify-html/issues/255
  cp ../Cargo.lock .
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # upstream source does not have the correct name for Python module
  # https://github.com/wilsonzlin/minify-html/pull/256
  patch -np1 < ../python-module-name.patch
}

build() {
  cd "$srcdir"/$pkgbase-$pkgver/minhtml
  cargo build --frozen --release --all-features

  cd "$srcdir"/$pkgbase-$pkgver/minify-html-python
  maturin build --locked --release --target "$(rustc -vV | sed -n 's/host: //p')" --strip
}

check() {
  cd "$srcdir"/$pkgbase-$pkgver/minhtml
  cargo test --frozen --release --all-features
}

package_minify-html() {
  depends=(
    gcc-libs
    glibc
  )

  cd $pkgbase-$pkgver
  install -vDm 755 target/release/minhtml -t "$pkgdir"/usr/bin/
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

package_python-minify-html() {
  pkgdesc+=" - Python bindings"
  depends=(
    gcc-libs
    glibc
    python
  )

  cd $pkgbase-$pkgver
  python -m installer --destdir "$pkgdir" target/wheels/*.whl
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

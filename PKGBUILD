# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgbase=minify-html
pkgname=(minify-html python-minify-html)
pkgver=0.18.1
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
b2sums=('af4e2513b392757dd458dff7f67e2c1fefbe08ccf68566d8d8a58e6949d8040bde4c0207a4f85ddf7953dd18d2879eeb6692368e8b4319331ad481706fe7a2cb'
        '55ef3fd07c75c25f22da5ae43746da0d0762156f80d8ec9e115c70afba1f8b23b1e697a9e055ccdb51721716b40f6168da3f6de616729cbefd0760844e6ec0ec'
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

# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=ryaml
pkgname="python-${_pkgname}"
pkgver=0.4.0
pkgrel=1
pkgdesc="A simple yaml serializer and deserializer using Rust."
arch=(x86_64)
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python')
makedepends=('maturin' 'python-pip' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ethanhs/ryaml/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('889373d73807367e0de4cbf538cb42096fd4a7372985bc6afa354e4ded8dfda7')
b2sums=('6d2ae86ed682c25d39783dab36d4e59fbca72b26dc43d36b9b5eee219fab5adf74d5f5963b425a180628d5e303cbbbf2d84538cf355d57521e88dd3799cfc61f')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$_pkgname-$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname-$pkgver"

  maturin build --no-sdist --release --strip \
    --cargo-extra-args="--frozen --features=abi3"
}

package() {
  cd "$_pkgname-$pkgver"

  PIP_CONFIG_FILE='/dev/null'
  pip install --root="$pkgdir" --isolated --ignore-installed --no-deps \
    target/wheels/*.whl

  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=ryaml
pkgname="python-${_pkgname}"
pkgver=0.2.0.post1
pkgrel=1
pkgdesc="A simple yaml serializer and deserializer using Rust."
arch=(x86_64)
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python')
makedepends=('maturin' 'python-pip' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ethanhs/ryaml/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8ae4224ff8ea0aeabcc5090a31040b0607446ec38b8dc284ba455b0f1d3a077d')
b2sums=('76fddd9979bf7dcb3881345c5c69ec0022729b5aa72432f0db0a8da85e55b886a52ee271fb0b072bddf78322ddda44d819e310ab68bf8f15da75e9d06cb787a3')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$_pkgname-$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname-$pkgver"

  maturin build --no-sdist --release --strip
}

package() {
  cd "$_pkgname-$pkgver"

  PIP_CONFIG_FILE='/dev/null'
  pip install --root="$pkgdir" --isolated --ignore-installed --no-deps \
    target/wheels/*.whl

  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

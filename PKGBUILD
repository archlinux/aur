# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=ryaml
pkgname="python-${_pkgname}"
pkgver=0.5.1
pkgrel=1
pkgdesc="A simple yaml serializer and deserializer using Rust."
arch=(x86_64)
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python')
makedepends=('maturin' 'python-pip' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ethanhs/ryaml/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3ee8a10c7a7da52b1ce79ba795dc695aea9bc321f0ae4c247b8605d7e01cb131')
b2sums=('566a07ef4b00c497ad06a663279b34b863ea8329958fec8a1082b8bfb15fb4b81f5a270bd119d2c13e5a40febd415c5568472f482ae38f6afdd24981fd61563a')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$_pkgname-$pkgver"

  cargo fetch --locked
}

build() {
  cd "$_pkgname-$pkgver"

  maturin build --release --strip \
    --frozen --features abi3
}

package() {
  cd "$_pkgname-$pkgver"

  PIP_CONFIG_FILE='/dev/null'
  pip install --root="$pkgdir" --isolated --ignore-installed --no-deps \
    target/wheels/*.whl

  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

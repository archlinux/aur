# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-grpc-stubs
_pkgname=${pkgname#python-}
pkgver=1.53.0.6
pkgrel=1
pkgdesc='Typing stubs for gRPC'
arch=('any')
url='https://github.com/shabbyrobe/grpc-stubs'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('mypy')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f99ff314247c125ef7b15d929d1b2d97bc36178890d7a0d3b171a624463c48e4')

build() {
  python -m build -nw "$_pkgname-$pkgver"
}

check() {
  cd "$_pkgname-$pkgver"
  declare -a packages=(
    'grpc-stubs'
    'grpc_channelz-stubs'
    'grpc_health-stubs'
    'grpc_reflection-stubs'
    'grpc_status-stubs'
  )
  for package in "${packages[@]}"; do
      mypy -- "$package"
  done
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --compile-bytecode=1 --destdir=$pkgdir \
    "dist/${_pkgname/-/_}-$pkgver-py3-none-any.whl"
}

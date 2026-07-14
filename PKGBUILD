# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=vmod-k8s-endpoint
pkgver=9.0.3
pkgrel=3
_srcver=0.1.0
_srcname=vmod-k8s_endpoint
pkgdesc="Kubernetes endpoint discovery director VMOD for Varnish"
arch=('x86_64')
url="https://github.com/varnish/vmod-k8s_endpoint"
license=('MIT')
depends=("varnish=$pkgver-$pkgrel")
makedepends=('cargo' 'clang' 'openssl' 'pkg-config' 'python-docutils' 'jq')
source=("$pkgname-$_srcver.tar.gz::https://github.com/varnish/vmod-k8s_endpoint/archive/refs/tags/v${_srcver}.tar.gz")
sha512sums=('f8242b1d8ddc7b9c32a88e4e22734018f2aaa9cb325dc118a36ccacda639d305e1cbc1d3a06a0540a6c572e8b347230c5f868cfefcb9cbc60617a6e94bfef83a')
options=(!lto)

prepare() {
    cd "$_srcname-$_srcver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_srcname-$_srcver"
    cargo build --frozen --release
}

package() {
    cd "$_srcname-$_srcver"
    install -Dt "$pkgdir/$(pkg-config varnishapi --variable=vmoddir)" target/release/*.so
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=vmod-k8s-endpoint
pkgver=9.1.0
pkgrel=2
_srcver=0.1.1
_srcname=vmod-k8s_endpoint
pkgdesc="Kubernetes endpoint discovery director VMOD for Varnish"
arch=('x86_64')
url="https://github.com/varnish/vmod-k8s_endpoint"
license=('MIT')
depends=("varnish=$pkgver-$pkgrel")
makedepends=('cargo' 'clang' 'openssl' 'pkg-config' 'python-docutils' 'jq')
source=("$pkgname-$_srcver.tar.gz::https://github.com/varnish/vmod-k8s_endpoint/archive/refs/tags/v${_srcver}.tar.gz")
sha512sums=('b1f33e8c81d157be25da8eebb86c953ab93e6540c298396be943335d1db752c1655342d1ffb6c21a932c49a63ae7f695bd270334e7b62a98e8917be2ef0711cb')
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

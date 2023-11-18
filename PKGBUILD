# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kbld
pkgver=0.38.1
pkgrel=2
pkgdesc='kbld seamlessly incorporates image building and image pushing into your development and deployment workflows'
url='https://carvel.dev/kbld'
arch=(any)
license=(apache-2.0)
makedepends=(bash go)
provides=(kbld)
source=(kbld-0.38.1::https://github.com/carvel-dev/kbld/archive/v0.38.1.tar.gz)
prepare () 
{ 
    set -eo pipefail;
    cd "$pkgname-$pkgver";
    sed -i "/^LATEST_GIT_TAG=/c\\LATEST_GIT_TAG=$pkgver" ./hack/build.sh
}
build () 
{ 
    set -eo pipefail;
    cd "$pkgname-$pkgver";
    export CGO_CPPFLAGS="${CPPFLAGS}";
    export CGO_CFLAGS="${CFLAGS}";
    export CGO_CXXFLAGS="${CXXFLAGS}";
    export CGO_LDFLAGS="${LDFLAGS}";
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw";
    ./hack/build.sh "$pkgver"
}
package () 
{ 
    set -eo pipefail;
    cd "$pkgname-$pkgver";
    BIN=$pkgname;
    install -Dm755 $BIN -t "$pkgdir/usr/bin"
}
sha256sums=('26446dff410192e1a8877806d0cb52764ec59f221fd345c18bfcdc972cd5cbf4')

# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kbld
pkgver=0.47.0
pkgrel=1
pkgdesc='kbld seamlessly incorporates image building and image pushing into your development and deployment workflows'
url='https://carvel.dev/kbld'
arch=(any)
license=(apache-2.0)
install=''
makedepends=(bash go)
provides=(kbld)
source=(kbld-0.47.0::https://github.com/carvel-dev/kbld/archive/v0.47.0.tar.gz)
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
    sed -i "s/CGO_ENABLED=0/CGO_ENABLED=1/" hack/build.sh;
    hack/build.sh "$pkgver"
}
package () 
{ 
    set -eo pipefail;
    cd "$pkgname-$pkgver";
    BIN=$pkgname;
    install -Dm755 $BIN -t "$pkgdir/usr/bin"
}
sha256sums=('5f6d6c454c6005e18aae7e2a127415db22ed90f5e23849807ef32c7ece6c9164')

# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kctrl
pkgver=0.60.9
pkgrel=1
pkgdesc='Continuous delivery and package management for Kubernetes.'
url='https://carvel.dev/kapp-controller'
arch=(any)
license=(apache-2.0)
install=''
makedepends=(bash go)
provides=(kctrl)
source=(kctrl-0.60.9::https://github.com/carvel-dev/kapp-controller/archive/v0.60.9.tar.gz)
prepare () 
{ 
    set -eo pipefail;
    cd "$_z_project_name-$pkgver/cli";
    sed -i "/^VERSION=/c\\VERSION=$pkgver" ./hack/build.sh
}
build () 
{ 
    set -eo pipefail;
    cd "$_z_project_name-$pkgver/cli";
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
    cd "$_z_project_name-$pkgver/cli";
    BIN=$pkgname;
    install -Dm755 $BIN -t "$pkgdir/usr/bin"
}
sha256sums=('cd55940279b68fc03e8d4c08a5f9ee4ef56e353ea621d2151d4afcd025f5828b')


# Custom variables

_z_project_name="kapp-controller"

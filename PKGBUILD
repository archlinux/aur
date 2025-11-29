# Maintainer: George Tsiamasiotis <gtsiam@windowslive.com>
# Maintainer: German Lashevich <german.lashevich@gmail.com>
# Contributor: David Birks <david@birks.dev>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154

pkgname=kapp
pkgver=0.65.0
pkgrel=1
pkgdesc='kapp is a simple deployment tool focused on the concept of "Kubernetes application" — a set of resources with the same label'
url='https://carvel.dev/kapp'
arch=(any)
license=(apache-2.0)
install=''
makedepends=(bash go)
provides=(kapp)
source=(kapp-0.65.0::https://github.com/carvel-dev/kapp/archive/v0.65.0.tar.gz)
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
    install -Dm755 $BIN -t "$pkgdir/usr/bin";
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/";
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/";
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/";
    ./$BIN completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$BIN";
    ./$BIN completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$BIN.fish";
    ./$BIN completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$BIN"
}
sha256sums=('cfe141f6e00816e9bddaa3d32216295176386b42d9202adbb76f48b78fd5e979')

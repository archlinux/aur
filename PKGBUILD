# Maintainer: George Tsiamasiotis <gtsiam@windowslive.com>
# Maintainer: German Lashevich <german.lashevich@gmail.com>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Jean-Francois Chevrette <jfchevrette@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154

pkgname=ytt
pkgver=0.47.0
pkgrel=1
pkgdesc='YAML templating tool that works on YAML structure instead of text'
url='https://carvel.dev/ytt'
arch=(any)
license=(apache-2.0)
makedepends=(bash go zip)
provides=(ytt)
source=(ytt-0.47.0::https://github.com/carvel-dev/ytt/archive/v0.47.0.tar.gz)
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
    install -Dm755 $BIN -t "$pkgdir/usr/bin";
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/";
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/";
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/";
    ./$BIN completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$BIN";
    ./$BIN completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$BIN.fish";
    ./$BIN completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$BIN"
}
sha256sums=('71641bdc5086c97c9d8c098f5f42fc29e725b33a89488fbefcaa2dad4664dad7')

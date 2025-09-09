# Maintainer: George Tsiamasiotis <gtsiam@windowslive.com>
# Maintainer: German Lashevich <german.lashevich@gmail.com>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Jean-Francois Chevrette <jfchevrette@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154

pkgname=ytt
pkgver=0.52.1
pkgrel=1
pkgdesc='YAML templating tool that works on YAML structure instead of text'
url='https://carvel.dev/ytt'
arch=(any)
license=(apache-2.0)
install=''
makedepends=(bash go zip)
provides=(ytt)
source=(ytt-0.52.1::https://github.com/carvel-dev/ytt/archive/v0.52.1.tar.gz)
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
    install -Dm755 $BIN -t "$pkgdir/usr/bin";
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/";
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/";
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/";
    ./$BIN completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$BIN";
    ./$BIN completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$BIN.fish";
    ./$BIN completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$BIN"
}
sha256sums=('c02a8dbcff7f7cf3a92ac6a210d299dd5df13946625e092fa2da48622a8e2fec')

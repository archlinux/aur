# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=imgpkg
pkgver=0.47.2
pkgrel=1
pkgdesc='Store application configuration files in Docker/OCI registries'
url='https://carvel.dev/imgpkg'
arch=(any)
license=(apache-2.0)
install=''
makedepends=(bash go)
provides=(imgpkg)
source=(imgpkg-0.47.2::https://github.com/carvel-dev/imgpkg/archive/v0.47.2.tar.gz)
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
    BIN_SRC="$pkgname";
    BIN_DST="$pkgdir/usr/bin/$pkgname";
    install -Dm755 "$BIN_SRC" "$BIN_DST";
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/";
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/";
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/";
    "$BIN_DST" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgname";
    "$BIN_DST" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish";
    "$BIN_DST" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
sha256sums=('b9abe6e2137eb1244478ee63c21f32d4d0f764b3529cbfe5c44d2d2a1797ec07')

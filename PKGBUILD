# Maintainer: Samuel Collins <samuel.collins@live.co.uk>
# Co-Maintainer: Bradley Garrod <bradleybredgarrod@gmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=glab-git
pkgver=1.62.0.r6.gd9ebe10c
pkgrel=2
pkgdesc='Cli tool to help work seamlessly with Gitlab from the command line'
arch=(x86_64)
url="https://gitlab.com/gitlab-org/cli"
license=(MIT)
depends=(glibc)
makedepends=(git
             go)
provides=("glab=$pkgver")
conflicts=(glab)
source=("$pkgname::git+$url.git")
sha256sums=(SKIP)

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
    cd "$pkgname"
    mkdir -p build
}

build() {
    cd "$pkgname"
    export GOPATH="$srcdir"/gopath
    local _date=$(date +'%Y/%m/%d' ${SOURCE_DATE_EPOCH:+-d @$SOURCE_DATE_EPOCH})
    go build \
      -trimpath \
      -buildmode=pie \
      -modcacherw \
      -ldflags "-linkmode external -extldflags \"$LDFLAGS\" -X main.version=v$pkgver -X main.build=$_date -X main.usageMode=prod -s -w" \
      -o build \
      ./cmd/glab
}

package() {
    cd "$pkgname"
    install -Dm0755 build/glab "$pkgdir/usr/bin/glab"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE

    # Shell completions
    build/main completion -s bash | install -Dm0644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/glab"
    build/main completion -s zsh  | install -Dm0644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_glab"
    build/main completion -s fish | install -Dm0644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/glab.fish"
}

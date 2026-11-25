# Maintainer: Manish Khadka <manish.khadka@tutanota.com>

pkgname=ctfkit
pkgver=0.11.1
pkgrel=1
pkgdesc='Run the same Terraform and OpenTofu compliance checks across your pipelines'
arch=('x86_64' 'aarch64')
url='https://github.com/compliancetf/ctfkit'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
optdepends=('terraform: gate plan, verdict verify and apply'
            'opentofu: gate plan, verdict verify and apply with OpenTofu')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ad13aa0a22c5037752da3a0e38a4e5e3710c22645c049ad733517174caf9be77')

prepare() {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir/gopath" GOFLAGS='-mod=readonly -modcacherw'
    go mod download
}

build() {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir/gopath"
    export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
    # -buildvcs=false: srcdir sits inside the AUR/packaging git checkout, not upstream's repo
    export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
    go build -ldflags "-linkmode=external -X main.version=$pkgver" -o ctfkit ./cmd/ctfkit

    local _sh
    for _sh in bash zsh fish; do
        ./ctfkit completion "$_sh" > "completion.$_sh"
    done
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 ctfkit "$pkgdir/usr/bin/ctfkit"
    install -Dm644 completion.bash "$pkgdir/usr/share/bash-completion/completions/ctfkit"
    install -Dm644 completion.zsh "$pkgdir/usr/share/zsh/site-functions/_ctfkit"
    install -Dm644 completion.fish "$pkgdir/usr/share/fish/vendor_completions.d/ctfkit.fish"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md docs/*.md
}

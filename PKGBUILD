# Maintainer: Miguel Useche <migueluseche@skatox.com>

_pkgname=qrcp
pkgname="$_pkgname-git"
pkgver=r221.63dc102
pkgrel=1
pkgdesc="Transfer files over wifi from your computer to your mobile device by scanning a QR code without leaving the terminal."
arch=('any')
url="https://github.com/claudiodangelis/$_pkgname"
license=('MIT')
makedepends=('go>=1.8' 'git')
provides=("$_pkgname")
options=('!strip' '!emptydirs')
source=("git+$url.git")
sha512sums=('SKIP')


pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $_pkgname

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode=external
            -X \"github.com/claudiodangelis/qrcp/version.version=$pkgver\"
            -X \"github.com/claudiodangelis/qrcp/version.date=$(date -d@"$SOURCE_DATE_EPOCH" +%Y-%m-%dT%H:%M:%SZ)\"" \

    ./qrcp completion bash | install -Dm644 /dev/stdin share/bash-completion/completions/qrcp
    ./qrcp completion zsh | install -Dm644 /dev/stdin share/zsh/site-functions/_qrcp
    ./qrcp completion fish | install -Dm644 /dev/stdin share/fish/vendor_completions.d/qrcp.fish
}

package() {
	cd $_pkgname
    install -Dm755 $_pkgname -t "$pkgdir/usr/bin"
    cp -r share/ "$pkgdir/usr"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}

# Maintainer: ml <ml-aur@ransomware.download>
pkgname=vt-cli
_gitcommit=e671a5daf26ba5a75ea1e5c6a4cf5bd7a21a9559
epoch=1
pkgver=1.3.0
pkgrel=1
pkgdesc='VirusTotal Command Line Interface'
arch=('i686' 'x86_64')
url=https://virustotal.github.io/vt-cli/
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
#source=("https://github.com/VirusTotal/vt-cli/archive/$pkgver/$pkgname-$pkgver.tar.gz")
source=("$pkgname"::git+https://github.com/VirusTotal/vt-cli#commit="${_gitcommit}")
sha256sums=('83d9a9962d575203690d774980407ccfdf91bce234b9b539371c9751eb57f657')

build() {
    #cd "$pkgname-$pkgver"
    cd "$pkgname"
    export CGO_ENABLED=1
    export CGO_LDFLAGS="$LDFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export GOFLAGS='-buildmode=pie -trimpath -modcacherw'
    go build -o build/vt -ldflags "-linkmode=external -X github.com/VirusTotal/vt-cli/cmd.Version=$pkgver" ./vt
    build/vt completion bash >vt.bash
    build/vt completion zsh >vt.zsh
    build/vt completion fish >vt.fish
}

check() {
    cd "$pkgname"
    # yaml_test.go broken. fails upstream as well
    go test -ldflags "-linkmode=external" -short ./utils/...
}

package() {
    cd "$pkgname"
    install -Dm755 build/vt -t "$pkgdir/usr/bin"
    install -Dm644 vt.bash "$pkgdir/usr/share/bash-completion/completions/vt"
    install -Dm644 vt.zsh "$pkgdir/usr/share/zsh/site-functions/_vt"
    install -Dm644 vt.fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname".fish
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" doc/*
}

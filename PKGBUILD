# Maintainer: Matthias Lisin <ml@visu.li
pkgname=vt-cli pkgver=0.7.0
pkgrel=2
pkgdesc='VirusTotal Command Line Interface'
arch=('i686' 'x86_64')
url='https://github.com/VirusTotal/vt-cli'
license=('Apache')
makedepends=('go' 'dep')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('2064b4a34c80ae71b199c870acef4a42f64f79718bb1cd74eb00027b47f334fba23287433be8d86995a9a82fd0f1bbf8c243b6177612005eea7900cdfe3968d0')
_gopkg=gopath/src/github.com/VirusTotal/"$pkgname"

prepare() {
    export GOPATH="$srcdir/gopath"
    mkdir -p "${_gopkg%/*}"
    ln -frs "$pkgname-$pkgver" "$_gopkg"
    cd "$_gopkg"
    dep ensure
}

build() {
    export GOPATH="$srcdir/gopath"
    cd "$_gopkg"
    LDFLAGS+=" -X github.com/VirusTotal/vt-cli/cmd.Version=${pkgver}"
    go build -trimpath \
             -ldflags "-extldflags=${LDFLAGS}" \
             -buildmode=pie -o build/vt vt/main.go
}

package() {
    cd "$pkgname-$pkgver"
    install -dm755 "$pkgdir"/usr/share/{bash-completion/completions,zsh/site-functions}
    install -Dm755 build/vt "$pkgdir"/usr/bin/vt
    build/vt completion bash > "$pkgdir"/usr/share/bash-completion/completions/vt
    build/vt completion zsh > "$pkgdir"/usr/share/zsh/site-functions/_vt
}

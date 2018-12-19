# Maintainer: David Flemström <david.flemstrom@gmail.com>
pkgname=prototool-git
pkgver=1.3.0.r12.g5794c37
pkgrel=1
pkgdesc="Your Swiss Army Knife for Protocol Buffers"
arch=(x86_64)
url="https://github.com/uber/prototool"
license=('MIT')
makedepends=(dep git go-pie)
depends=(glibc)
source=("$pkgname::git+https://github.com/uber/prototool.git")
md5sums=(SKIP)

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    mkdir -p "gopath/src/github.com/uber"
    ln -rTsf "$pkgname" "gopath/src/github.com/uber/prototool"

    export GOPATH="$srcdir"/gopath
    export PATH="$GOPATH/bin:$PATH"
    cd "gopath/src/github.com/uber/prototool"

    dep ensure -v
}

build() {
    export GOPATH="$srcdir/gopath"
    export PATH="$GOPATH/bin:$PATH"
    cd "gopath/src/github.com/uber/prototool"

    go build \
        -a \
        -gcflags "all=-trimpath=${PWD}" \
        -asmflags "all=-trimpath=${PWD}" \
        -ldflags "-X 'github.com/uber/prototool/internal/vars.GitCommit=$(git rev-list -1 HEAD)' -X 'github.com/uber/prototool/internal/vars.BuiltTimestamp=$(date -u)' -extldflags ${LDFLAGS}" \
        -o prototool \
        internal/cmd/prototool/main.go

    go run internal/cmd/gen-prototool-bash-completion/main.go > prototool-bash-completion
    go run internal/cmd/gen-prototool-zsh-completion/main.go > prototool-zsh-completion
    mkdir prototool-manpages
    go run internal/cmd/gen-prototool-manpages/main.go prototool-manpages
}

package() {
    cd "$pkgname"

    mkdir -p "$pkgdir/etc/bash_completion.d"
    mkdir -p "$pkgdir/etc/zsh/site-functions"
    mkdir -p "$pkgdir/usr/share/man/man1"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"

    install -m644 prototool-bash-completion "$pkgdir/etc/bash_completion.d/prototool"
    install -m644 prototool-zsh-completion "$pkgdir/etc/zsh/site-functions/_prototool"
    cp -r prototool-manpages/. "$pkgdir/usr/share/man/man1/."
    install -Dm644 "$srcdir/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"

    install -Dm755 prototool -t "$pkgdir/usr/bin/"
}

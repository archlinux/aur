# Maintainer: taxin <unknownbrofrombd@duck.com>

pkgname=bclone
pkgver=1.75.2
pkgrel=2
pkgdesc="rclone with Alist, Alldebrid, iCloud Photos, Teldrive, Terabox, Tmpfs, and unofficial Google Photos (gotohp) support"
arch=(x86_64 aarch64 armv7h)
url="https://github.com/BenjiThatFoxGuy/bclone"
license=(MIT)
depends=(glibc)
makedepends=(go git)
optdepends=('fuse3: for rclone mount')
provides=(rclone bclone)
conflicts=(rclone bclone)
options=(!strip)
source=("git+https://github.com/BenjiThatFoxGuy/bclone.git#tag=v${pkgver}")
sha256sums=('904f79d06781a78bf572117fd693f8c53dde57560d7dc33a8628363edfc42fd3')

build() {
    cd "$srcdir/$pkgname"
    export GOPATH="$srcdir/go"
    export CGO_ENABLED=0
    go build -mod=mod -ldflags="-s -w \
        -X 'github.com/rclone/rclone/fs.VersionTag=v${pkgver}' \
        -X 'github.com/rclone/rclone/fs.VersionSuffix=' \
        " \
        -o rclone .
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 rclone "$pkgdir/usr/bin/rclone"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 rclone.1 "$pkgdir/usr/share/man/man1/rclone.1"
    install -Dm644 MANUAL.txt "$pkgdir/usr/share/doc/$pkgname/MANUAL.txt"
    install -Dm644 CONTRIBUTING.md "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"

    # Install bash/zsh/fish completions if available
    if [ -f completions/bash/rclone ]; then
        install -Dm644 completions/bash/rclone "$pkgdir/usr/share/bash-completion/completions/rclone"
    fi
    if [ -f completions/zsh/rclone ]; then
        install -Dm644 completions/zsh/rclone "$pkgdir/usr/share/zsh/site-functions/_rclone"
    fi
    if [ -f completions/fish/rclone.fish ]; then
        install -Dm644 completions/fish/rclone.fish "$pkgdir/usr/share/fish/vendor_completions.d/rclone.fish"
    fi
}

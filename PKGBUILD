# Maintainer: yobson <aur at yobson dot xyz>
# Maintainer: Noel Jacob <noeljacob 91 at gmail dot com>
# Contributor: Daniele Basso <d dot bass 05 at proton dot me>
pkgname=bun-git
pkgver=1.3.14.r2031.ga356964
pkgrel=1
pkgdesc="Incredibly fast JavaScript runtime, bundler, test runner, and package manager – all in one"
arch=(x86_64 aarch64)
url="https://github.com/oven-sh/bun"
license=('MIT')
depends=(libatomic libstdc++)
makedepends=(bun clang21 cmake git lld21 llvm21 ninja rustup nasm)
conflicts=(bun bun-bin)
provides=(bun)
source=("$pkgname::git+https://github.com/oven-sh/bun.git")
cksums=(SKIP)

pkgver() {
    cd "$pkgname"
    git describe --tags --long --abbrev=7 --match 'bun-v[0-9]*' |
        sed 's/^bun-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
    cd $pkgname
    ./build/release/bun --version
    echo 'console.log("ok")' | ./build/release/bun run -
}

build() {
    cd "$pkgname"
    bun scripts/build.ts \
        --profile=release \
        --static-libatomic=off
}

package() {
    cd $pkgname
    install -vDm755 build/release/bun "$pkgdir/usr/bin/bun"
    ln -vs /usr/bin/bun "$pkgdir/usr/bin/bunx"
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md

    install -vDm644 completions/bun.bash "$pkgdir/usr/share/bash-completion/completions/bun"
    install -vDm644 completions/bun.fish "$pkgdir/usr/share/fish/vendor_completions.d/bun.fish"
    install -vDm644 completions/bun.zsh "$pkgdir/usr/share/zsh/site-functions/_bun"
}

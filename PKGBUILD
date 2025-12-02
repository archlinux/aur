# Maintainer: Peter Damianov <peter0x44@disroot.org>
pkgname=polyfill-glibc-git
pkgver=r0
pkgrel=1
pkgdesc="Post-compilation tool to enable running binaries compiled on newer glibc systems on older ones"
arch=('x86_64' 'aarch64')
url="https://github.com/corsix/polyfill-glibc"
license=('MIT')
depends=('glibc')
makedepends=('git' 'gcc' 'ninja')
provides=('polyfill-glibc')
conflicts=('polyfill-glibc')
source=("${pkgname}::git+https://github.com/corsix/polyfill-glibc.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    ninja polyfill-glibc
}

package() {
    cd "$pkgname"
    install -Dm755 polyfill-glibc "$pkgdir/usr/bin/polyfill-glibc"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    # Install documentation
    for doc in docs/*.md; do
        install -Dm644 "$doc" "$pkgdir/usr/share/doc/$pkgname/$(basename "$doc")"
    done
}

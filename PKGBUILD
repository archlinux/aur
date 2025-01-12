# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
__pkgname=jule
_pkgname="${__pkgname}c"
pkgname="$_pkgname-git"
pkgver=0.1.2+407df725
pkgrel=1
pkgdesc='The Jule Programming Language Compiler'
arch=('x86_64' 'aarch64' 'i386')
url="https://github.com/${__pkgname}lang/$__pkgname"
license=('BSD-3-Clause')
groups=('jule')
source=("git+$url.git")
sha256sums=('SKIP')
depends=('glibc' 'gcc-libs')
makedepends=('julec' 'git')
optdepends=('clang: clang backend support'
    'gcc: gcc backend support')
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
    cd "$__pkgname"
    echo "$(git describe --tags --abbrev=0 | cut -c 5-)+$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$__pkgname"
    find ./*/* -type f -name '*.md' -exec rm -f {} +
}

build() {
    cd "$__pkgname"
    
    mkdir -p bin
    echo "Building $_pkgname for $CARCH..."
    julec --opt-deadcode -o "bin/$_pkgname" "src/$_pkgname"
}

package() {
    cd "$__pkgname"

    install -d "$pkgdir/usr/lib/$__pkgname"
    cp -R api "$pkgdir/usr/lib/$__pkgname/api"
    cp -R std "$pkgdir/usr/lib/$__pkgname/std"
    cp -R bin "$pkgdir/usr/lib/$__pkgname/bin"

    install -d "$pkgdir/usr/bin"
    ln -s "/usr/lib/$__pkgname/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

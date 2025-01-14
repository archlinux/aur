# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
__pkgname=jule
_pkgname="${__pkgname}c"
pkgname="$_pkgname-git"
pkgver=0.1.2+ba2d8067
pkgrel=1
pkgdesc='The Jule Programming Language Compiler'
arch=('x86_64' 'aarch64' 'i386')
url="https://github.com/${__pkgname}lang/$__pkgname"
_url_raw="https://raw.githubusercontent.com/$(echo "$url" | awk -F'/' '{print $4 "/" $5}')c-ir"
license=('BSD-3-Clause')
groups=('jule')
source=("git+$url.git")
source_x86_64=("$__pkgname-ir-$pkgver-$CARCH.cpp::$_url_raw/main/src/linux-amd64.cpp")
source_aarch64=("$__pkgname-ir-$pkgver-aarch64.cpp::$_url_raw/main/src/linux-arm64.cpp")
source_i386=("$__pkgname-ir-$pkgver-i386.cpp::$_url_raw/main/src/linux-i386.cpp")
sha256sums=('SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
sha256sums_i386=('SKIP')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'clang')
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
    cp "$srcdir/$__pkgname-ir-$pkgver-$CARCH.cpp" ir.cpp
    find ./*/* -type f -name '*.md' -exec rm -f {} +
    sed -i "s/^const Version.*/const Version = \`$__pkgname$pkgver\`/" "std/$__pkgname/$__pkgname.jule"
}

build() {
    cd "$__pkgname"

    mkdir -p bin
    echo "Building $_pkgname-dev for $CARCH..."
    clang++ ir.cpp \
        -O0 \
        --std=c++17 \
        -Wno-everything \
        -o "bin/$_pkgname-dev"

    echo "Building $_pkgname for $CARCH..."
    "./bin/$_pkgname-dev" -o "bin/$_pkgname" "src/$_pkgname"
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

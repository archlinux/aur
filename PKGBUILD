# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname=jule
pkgname="${_pkgname}c"
pkgver=0.1.1
_pkgver="$_pkgname$pkgver"
pkgrel=3
pkgdesc='The Jule Programming Language Compiler'
arch=('x86_64' 'aarch64' 'i386')
url="https://github.com/${_pkgname}lang/$_pkgname"
_url_raw="https://raw.githubusercontent.com/$(echo "$url" | awk -F'/' '{print $4 "/" $5}')c-ir"
license=('BSD-3-Clause')
groups=('jule')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
source_x86_64=("$_pkgname-ir-$pkgver-$CARCH.cpp::$_url_raw/9a58e198e2479d0840e3705dd4947e5006c0e44d/src/linux-amd64.cpp")
source_aarch64=("$_pkgname-ir-$pkgver-aarch64.cpp::$_url_raw/9a58e198e2479d0840e3705dd4947e5006c0e44d/src/linux-arm64.cpp")
source_i386=("$_pkgname-ir-$pkgver-i386.cpp::$_url_raw/9a58e198e2479d0840e3705dd4947e5006c0e44d/src/linux-i386.cpp")
sha256sums=('4289447fc62a4466b67b4be87614cee9f424b630164bdc7f7bc810a25431d930')
sha256sums_x86_64=('b087205f273f3308534befd47ff8f2d01241c3389141f298db3e3a3c39c9b037')
sha256sums_aarch64=('98b54385c76f1ec46f9c80429be2876f377d1128d1e90deb37f9db758c767e06')
sha256sums_i386=('d00ef98608f404a51108f4af2e18cab066306478695fe0198e52f944a216f829')
depends=('gcc-libs' 'clang')
optdepends=('gcc: g++ backend support')

prepare() {
    cd "$_pkgname-$_pkgver"
    
    cp "$srcdir/$_pkgname-ir-$pkgver-$CARCH.cpp" ir.cpp
    
    find ./*/* -type f -name '*.md' -exec rm -f {} +
}

build() {
    cd "$_pkgname-$_pkgver"
    
    mkdir -p bin
    echo "Building $pkgname for $CARCH..."
    clang++ ir.cpp \
        -O0 \
        --std=c++17 \
        -Wno-everything \
        -o "bin/$pkgname"
}

check() {
    cd "$_pkgname-$_pkgver"
    "./bin/$pkgname" -t "src/$pkgname"
}

package() {
    cd "$_pkgname-$_pkgver"

    install -d "$pkgdir/usr/lib/$_pkgname"
    cp -R api "$pkgdir/usr/lib/$_pkgname/api"
    cp -R std "$pkgdir/usr/lib/$_pkgname/std"
    cp -R bin "$pkgdir/usr/lib/$_pkgname/bin"

    install -d "$pkgdir/usr/bin"
    ln -s "/usr/lib/$_pkgname/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

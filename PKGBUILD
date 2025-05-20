# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname=jule
pkgname="${_pkgname}c"
pkgver=0.1.5
_pkgver="$_pkgname$pkgver"
_irsha='4a3bf4fc84b53aa607855df6635d95d3e310f7ad'
pkgrel=1
pkgdesc='The Jule Programming Language Compiler'
arch=('x86_64' 'aarch64' 'i386')
url="https://github.com/${_pkgname}lang/$_pkgname"
_url_raw="https://raw.githubusercontent.com/$(echo "$url" | awk -F'/' '{print $4 "/" $5}')c-ir"
license=('BSD-3-Clause')
groups=('jule')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
source_x86_64=("$_pkgname-ir-$pkgver-$CARCH.cpp::$_url_raw/$_irsha/src/linux-amd64.cpp")
source_aarch64=("$_pkgname-ir-$pkgver-aarch64.cpp::$_url_raw/$_irsha/src/linux-arm64.cpp")
source_i386=("$_pkgname-ir-$pkgver-i386.cpp::$_url_raw/$_irsha/src/linux-i386.cpp")
sha256sums=('c2f2ef08a2ca578b5e7a78387f2beae20e6eaa9faf8064b1015a16fe4bbd01ae')
sha256sums_x86_64=('a37749046c77c3ce0372a5df377a67f98e9195d8e6568f7ec192f1f13106e8d3')
sha256sums_aarch64=('acc54f624da667d63c398312fdf78790014b1898b9dce778655a2e23d8890189')
sha256sums_i386=('16e3594e4d85c4fd3596d6d954e55e05db83c7cc7b30691858cfbce545519670')
depends=('glibc' 'gcc-libs')
makedepends=('clang')
optdepends=('clang: clang backend support'
    'gcc: gcc backend support')

prepare() {
    cd "$_pkgname-$_pkgver"
    
    cp "$srcdir/$_pkgname-ir-$pkgver-$CARCH.cpp" ir.cpp
    
    find ./*/* -type f -name '*.md' -exec rm -f {} +
}

build() {
    cd "$_pkgname-$_pkgver"
    
    mkdir -p bin
    echo "Building $pkgname-dev for $CARCH..."
    clang++ ir.cpp \
        --std=c++17 \
        -Wno-everything \
        -fwrapv \
        -ffloat-store \
        -DNDEBUG \
        -fomit-frame-pointer \
        -fno-strict-aliasing \
        -o "bin/$pkgname-dev"

    echo "Building $pkgname for $CARCH..."
    "./bin/$pkgname-dev" -p --opt L2 -o "bin/$pkgname" "src/$pkgname"
}

check() {
    cd "$_pkgname-$_pkgver/tests/std"
    "../../bin/$pkgname" mod init
    "../../bin/$pkgname" -t .
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

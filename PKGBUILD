# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# Contributor: Sebaguardian <sebaguardian13@gmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname=jule
pkgname="${_pkgname}c"
pkgver=0.1.7
_pkgver="$_pkgname$pkgver"
_irsha='81ddbed06a715428a90d3645f7242fa4e522ea16'
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
sha256sums=('d6cc0ec48f35258b918718cd1766a8f9913fc536d5ddfe95e79bbc0d49d0e8ab')
sha256sums_x86_64=('39222afc208b7fe92161ef262dc0f13a972dd8e9b22f5b2f07b148529036011e')
sha256sums_aarch64=('0a232e6777a193e65de20afeacd68f76cc4eede58c1e926c101807a6170e0904')
sha256sums_i386=('5bcc7a0edd842ffe5c3ca9ccb939789252594c3f340468d6dc2d522510471cbd')
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
        -fno-fast-math \
        -fno-rounding-math \
        -ffp-contract=fast \
        -fexcess-precision=standard \
        -DNDEBUG \
        -fomit-frame-pointer \
        -fno-strict-aliasing \
        -o "bin/$pkgname-dev"

    echo "Building $pkgname for $CARCH..."
    "./bin/$pkgname-dev" build -p --opt L2 -o "bin/$pkgname" "src/$pkgname"
}

check() {
    cd "$_pkgname-$_pkgver/tests/std"
    "../../bin/$pkgname" mod init
    "../../bin/$pkgname" build -t .
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

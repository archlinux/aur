# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname=jule
pkgname="${_pkgname}c"
pkgver=0.1.6
_pkgver="$_pkgname$pkgver"
_irsha='aebbd12c0f89f6a04f856f3e23d5ea39741c3e0f'
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
sha256sums=('0fb93dc0e60ea8e5403ac3015fdcbed798525b614924b61bbe32621ce6dff5ac')
sha256sums_x86_64=('66c33a2a045dd08e2d2ef6b142729af091457ed460a3c530ad7b173ac4bfcf48')
sha256sums_aarch64=('e570d28d64c5876adaa6657a894567e0de7d73c87a806c10d6b8bea779cdb5a7')
sha256sums_i386=('13bfefaebd30f4967f25660bdeb836de2369b74a6802ea8384ff74d456b30800')
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

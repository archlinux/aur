# Maintainer: koi <me@koi.rip>
# Contributor: Sebaguardian <sebaguardian13@gmail.com>
# https://github.com/koibtw/PKGBUILDs
_pkgname=jule
pkgname="${_pkgname}c"
pkgver=0.2.0
_pkgver="$_pkgname$pkgver"
_irsha='e4134d89f34588e9fb5cc5698f27b0471918e057'
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
sha256sums=('8f810a594d9747edeca3a8890a1b701b75a05bcf2c0789d4284996e9a0fbec74')
sha256sums_x86_64=('fafc628658ec4cb585812dc167091e5e4d6801aa59daf48f192cdb05aeabe592')
sha256sums_aarch64=('a729f2bb665646be65dad66ea419839a50fd67308d36e47fa0d74d453b5fc9f7')
sha256sums_i386=('b6a189b4e8a0d8cfc35fc4ad566cb9c9d8c195cad2011e70b06022975fa67386')
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
        --std=c++20 \
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

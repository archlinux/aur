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
source_x86_64=("$_pkgname-ir-$pkgver-$CARCH.cpp::$_url_raw/338f419155ce765ab6cf4cab36901d6be7b9ae8d/src/linux-amd64.cpp")
source_aarch64=("$_pkgname-ir-$pkgver-aarch64.cpp::$_url_raw/338f419155ce765ab6cf4cab36901d6be7b9ae8d/src/linux-arm64.cpp")
source_i386=("$_pkgname-ir-$pkgver-i386.cpp::$_url_raw/338f419155ce765ab6cf4cab36901d6be7b9ae8d/src/linux-i386.cpp")
sha256sums=('4289447fc62a4466b67b4be87614cee9f424b630164bdc7f7bc810a25431d930')
sha256sums_x86_64=('8e139df60165c9ec821546a1741bd4f20262c78db62b91ac2d159ad393fa83e1')
sha256sums_aarch64=('543dcf6a6744b3bf6d21db14962e058ee186e882344a35e3068773134e68346f')
sha256sums_i386=('bab9a798e6c518f987cc33ff3427043e25ce620d21af2c3c07c2b113b380e4f1')
depends=('glibc' 'gcc-libs' 'gcc' 'clang')

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

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}

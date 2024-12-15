# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname=jule
pkgname="${_pkgname}c-git"
pkgver=jule0.1.1.r93.g5ebf615c
pkgrel=1
pkgdesc='The Jule Programming Language Compiler'
arch=('x86_64' 'aarch64' 'i386')
url="https://github.com/${_pkgname}lang/$_pkgname"
url_raw="https://raw.githubusercontent.com/$(echo "$url" | awk -F'/' '{print $4 "/" $5}')c-ir"
license=('BSD-3-Clause')
source=("git+$url.git")
source_x86_64=("$_pkgname-ir-$pkgver-x86_64.cpp::$url_raw/main/src/linux-amd64.cpp")
source_aarch64=("$_pkgname-ir-$pkgver-aarch64.cpp::$url_raw/main/src/linux-arm64.cpp")
source_i386=("$_pkgname-ir-$pkgver-i386.cpp::$url_raw/main/src/linux-i386.cpp")
sha256sums=('SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
sha256sums_i386=('SKIP')
depends=('glibc' 'gcc-libs' 'gcc' 'clang')
provides=("${_pkgname}c")
conflicts=("${_pkgname}c")

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    
    cp "$srcdir/$_pkgname-ir-$pkgver-$CARCH.cpp" ir.cpp
    
    find ./*/* -type f -name '*.md' -exec rm -f {} +
}

build() {
    cd "$_pkgname"
    
    mkdir -p bin
    echo "Building ${_pkgname}c for $CARCH..."
    clang++ ir.cpp \
        -O0 \
        --std=c++17 \
        -Wno-everything \
        -o "bin/$pkgname"
}

check() {
    cd "$_pkgname"
    
    "./bin/$pkgname" mod init
    echo 'fn main() {}' > "main.$_pkgname"
    "./bin/$pkgname" -t .
}

package() {
    cd "$_pkgname"

    install -d "$pkgdir/usr/lib/$_pkgname"
    cp -R api "$pkgdir/usr/lib/$_pkgname/api"
    cp -R std "$pkgdir/usr/lib/$_pkgname/std"
    cp -R bin "$pkgdir/usr/lib/$_pkgname/bin"

    install -d "$pkgdir/usr/bin"
    ln -s "/usr/lib/$_pkgname/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}

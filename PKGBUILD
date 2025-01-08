# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname=jule
pkgname="${_pkgname}c"
pkgver=0.1.2
_pkgver="$_pkgname$pkgver"
pkgrel=1
pkgdesc='The Jule Programming Language Compiler'
arch=('x86_64' 'aarch64' 'i386')
url="https://github.com/${_pkgname}lang/$_pkgname"
_url_raw="https://raw.githubusercontent.com/$(echo "$url" | awk -F'/' '{print $4 "/" $5}')c-ir"
license=('BSD-3-Clause')
groups=('jule')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
source_x86_64=("$_pkgname-ir-$pkgver-$CARCH.cpp::$_url_raw/03f3ebe18a79bb8dcb5440f0e6297e1d2e032e19/src/linux-amd64.cpp")
source_aarch64=("$_pkgname-ir-$pkgver-aarch64.cpp::$_url_raw/03f3ebe18a79bb8dcb5440f0e6297e1d2e032e19/src/linux-arm64.cpp")
source_i386=("$_pkgname-ir-$pkgver-i386.cpp::$_url_raw/03f3ebe18a79bb8dcb5440f0e6297e1d2e032e19/src/linux-i386.cpp")
sha256sums=('1f8bc6852669392d912ff80c6b50980ecf7a1d61af5a98ab38f559c7da533a61')
sha256sums_x86_64=('6226cd899c12d1802be30f497bae18f2ea49e481441c36365b0e9dc5a4112c3e')
sha256sums_aarch64=('2ac453e3e5e598816a158288876791d5f214aecdef224054f847b1461d17e9c8')
sha256sums_i386=('96e363a7b48d3c56c56784a3c6c483194db90d704d9dad8213b6ad240b0a44e8')
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
    echo "Building $pkgname for $CARCH..."
    clang++ ir.cpp \
        -O0 \
        --std=c++17 \
        -Wno-everything \
        -o "bin/$pkgname"
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

# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname=jule
pkgname="${_pkgname}c"
pkgver=0.1.4
_pkgver="$_pkgname$pkgver"
_irsha='2606069a208e23084667483cc822bd9ff1ec4839'
pkgrel=3
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
sha256sums=('499bf6eb7c3463a74b8ff85b961fe2630b78404a90a003236e5beb1be0631eb1')
sha256sums_x86_64=('bec3b4d22bb2da5445dd04c93f929d02cae9d08988a8e97f18a94528954a1327')
sha256sums_aarch64=('abba118ee4f4e0bb2286abb66c9efb5e88f23681ef9a9d26f44182bc1bb3dcc7')
sha256sums_i386=('013e31293f1f574c28d4e924e8440ccb6aa3372828c23c6dc0c812fdd9086bfc')
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
        -o "bin/$pkgname-dev"

    echo "Building $pkgname for $CARCH..."
    "./bin/$pkgname-dev" -t "src/$pkgname"
    # temporary solution to avoid optimization-related issues
    clang++ dist/ir.cpp \
        --std=c++17 \
        -Wno-everything \
        -O3 \
        -flto \
        -fwrapv \
        -ffloat-store \
        -fomit-frame-pointer \
        -o "bin/$pkgname"
}

check() {
    cd "$_pkgname-$_pkgver/tests/std"
    "../../bin/$pkgname" mod init
    cd -
    "./bin/$pkgname" -t tests/std
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

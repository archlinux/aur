# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname=jule
pkgname="${_pkgname}c"
pkgver=0.1.4
_pkgver="$_pkgname$pkgver"
_irsha='d3485d3edab5380d41828fe0262017765648d82d'
pkgrel=2
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
sha256sums_x86_64=('d7a2be148b189616388746b8df44c3604beb42e77374d31a1573eb49c6c6a754')
sha256sums_aarch64=('5e1fdce452c210e187c3c8aae833e393ac1da916776bb726564c6f2902bfad0f')
sha256sums_i386=('169a2f7e5dd2626f11fd5b893396919ab0a53ac7846a26f7084ae69166436d26')
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
        --std=c++17 \
        -Wno-everything \
        -O3 \
        -flto \
        -fwrapv \
        -ffloat-store \
        -DNDEBUG \
        -fomit-frame-pointer \
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

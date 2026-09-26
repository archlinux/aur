# Maintainer: kekmacska

pkgname=phichain-git
pkgver=1.0.0.beta.7.r2.geba9f70
pkgrel=1
pkgdesc="Phigros charting toolchain"
arch=('any')
url="https://phichain.rs/"
license=('LGPL-3.0')
depends=(xz bzip2 alsa-lib systemd-libs)
makedepends=('git' 'rust' 'cargo' 'clang' 'lld')
source=("git+https://github.com/Ivan-1F/phichain.git" "${pkgname%-*}.desktop" "asset-resolution.patch")
b2sums=('SKIP'
        '9248b301702818b9bac5b83375905993d0b548f00555df41789e69c401f751d10e1388394bca4a53875f59875d547f8d0299688ce37174ffa6f804bf2c9dbe88'
        '3f6b9ca2d2fde74f8ab6c91d79dc0aab140cae880df15a82d30f6493e36490c69c9f66fc65643c9cab36a66fb69657776f832d4c02d1ecacec5f2c3ac20b7aed')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

prepare() {
    cd "${pkgname%-*}"
    oxipng -o max -r -p -s -v -t "$(nproc)" -z --zi 100 --ziwi 10 --brute-level 5 --brute-lines 16 assets/respack
    patch -Np1 -i "$srcdir/asset-resolution.patch"
}

build() {
    cd "${pkgname%-*}"

    # explicitly set clang as the default compiler for c/c++ backends to prevent the infamous linker error
    export CC=clang
    export CXX=clang++
    export RUSTFLAGS="\
        -C opt-level=3 \
        -C target-cpu=native \
        -C embed-bitcode=yes \
        -C codegen-units=1 \
        -C strip=symbols \
        -C relocation-model=pic \
        -C link-arg=-fuse-ld=lld \
        -C link-arg=-Wl,--icf=safe \
        -C link-arg=-Wl,--gc-sections \
        -C link-arg=-Wl,--as-needed \
        -C link-arg=-Wl,-O3 \
        -C link-arg=-fno-plt \
    "

    cargo build --release
}


package() {
    cd "${pkgname%-*}"

    install -Dm755 "target/release/${pkgname%-*}" \
        "$pkgdir/usr/bin/${pkgname%-*}"

    install -d "$pkgdir/usr/share/${pkgname%-*}/respack"
    install -d "$pkgdir/usr/share/${pkgname%-*}/audio"

    install -Dm644 assets/respack/* \
        "$pkgdir/usr/share/${pkgname%-*}/respack/"

    install -Dm644 assets/audio/* \
        "$pkgdir/usr/share/${pkgname%-*}/audio/"

    install -Dm644 "$srcdir/${pkgname%-*}.desktop" \
        "$pkgdir/usr/share/applications/${pkgname%-*}.desktop"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE"
}

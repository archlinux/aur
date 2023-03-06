# Maintainer: oscarcl <oscar.cowderylack@gmail.com>
pkgname=casparcg-server
pkgver=2.3.3
_pkgver=$pkgver-lts-stable
_cef_version=3.3578.1870.gc974488
pkgrel=8
pkgdesc="Software used to play out professional graphics, audio and video to multiple outputs"
arch=('x86_64')
url="https://github.com/CasparCG/server"
license=('GPL3')
depends=(ffmpeg boost-libs libgl freeimage glew tbb openal sfml libxcomposite libxss pango nss at-spi2-atk ttf-liberation)
makedepends=(cmake ninja boost dos2unix)
source=("https://github.com/CasparCG/server/archive/refs/tags/v$_pkgver.tar.gz"
        "https://github.com/CasparCG/server/commit/f0e678e7cabc69d573d59f24f9fd3ceca322ab85.patch"
        "https://github.com/CasparCG/server/commit/9cafa27838039aa65af3c97fe7d0c4531a952cdc.patch"
        "https://github.com/CasparCG/server/commit/9b0990bee89b7a9fa195db75c976c2b20e33ebb5.patch"
        "https://github.com/CasparCG/server/commit/e0bbb969b171c85332e77ee8b50f29b4634b7ad7.patch"
        "https://github.com/CasparCG/server/commit/8fce42fabb67b469fe2b6fc0b22af69773b21779.patch"
        "https://github.com/CasparCG/server/commit/a1933f38a7b14fa27d8a4a496ffe84782a840830.patch"
        "https://github.com/CasparCG/server/commit/09c655313cac5951db23a90f8d8ea54c044def8e.patch"
        "https://github.com/CasparCG/server/commit/638d0def6b2bc946db34e3b74d5e4b24f70cd65d.patch"
        "https://github.com/CasparCG/server/commit/5b3a79735781b4ed6c3dd9154ab309fd5a5208a1.patch"
        "https://github.com/CasparCG/server/commit/cfb93aad41a2d78e52c7c6e0b4eb8520741a9c6e.patch"
        "https://github.com/CasparCG/server/commit/2f026f2cf149bed4f7c1ea29aa6ae1fa90bc3963.patch"
        "https://github.com/CasparCG/server/commit/f8e48f5190aabd54b94b5fa0415df33a9cb71441.patch"
        "https://patch-diff.githubusercontent.com/raw/CasparCG/server/pull/1308.patch"
        "https://patch-diff.githubusercontent.com/raw/CasparCG/server/pull/1465.patch"
        "https://patch-diff.githubusercontent.com/raw/CasparCG/server/pull/1466.patch"
        # included upstream, but doesn't apply cleaning to 2.3.3
        "ffmpeg-5.0.patch"
        # included upstream, but in larger commits that we don't want to backport
        "missing-includes.patch"
        "ffmpeg-cmake.patch"
        "https://cef-builds.spotifycdn.com/cef_binary_${_cef_version}_linux64_minimal.tar.bz2"
        casparcg)
sha256sums=('6d8e973949009e95bb5a6496e26cbe680efd77666936e131df0da569f8f7c7e1'
            '320576b7293b658166fe7e58393267a4fbfdc9802f42ae7bf95401a9cc78801f'
            'b67cd51d6b01fef1080b49cbb146e94981b1681b90aa3e5a4c28309ce1d5db1b'
            '3e9d6c96f3b196eb3104a59f99dab86a823c887a71ea09883f094003a184ad65'
            'c698a177a13a32ad2eb5e1a4ba304526cebc4b63c459893288f14147c4d83ae6'
            'd5bee5099e44de2ba0a86a6d099794a8e4be1811439c0ad0b0fb06700be47f7b'
            '30484f8a455ca5e55d758820499b9f8e275762c8004762dfd9d502a662d2e701'
            '0a811ad09fe9c7591a8cf3a158d9f10d2a951bd2fcba98cb3b87a6bacf8dfe48'
            '125635642bee7b50c7d91e33ba1d3c94d9c40e6f2c79f97eb46bc604fa187a26'
            '34c979e7a3e2309c60b13c9e8634ad2fdbef58b6c477990e4bcf713b7b26e5d5'
            'feb45001941b029b339c896d9cc708461fe9e2650b746c14e592382373d2ca7b'
            '156a477bb655b4b60402f2a99c7a893e603141175480d0149933befe55a240d0'
            'dc64e29a37b8db871cc74d9cac4e6a65a2d3ed12f51feeccef529758ebe5e23b'
            '5c6f2a3007e3a8739bc1f3eaec3c694af9836aed1943217843a92acff80950c1'
            'fb6f4412629b4d1a149b7913c152857489394118a61b5925d4cc0dbf2c9c63d7'
            'ab1091e19cd1d3948be3ca80f5a8f2718b60ead3e63ad35dcff9246f95160791'
            '74258b79273b852209f03c826cd64879514929cd222fa03c924b71444c9110a1'
            '62f98bbf454b04d99df0b385a81dc902c3b8faf2c245ebded69e8597da793717'
            'e7f0e0dd123b1cccac21611f4e32ba7d27ce24a9a0587ef6f2180fb3c63894c0'
            'b7c5401f342917ece7be583566bfc48b5cc1a8ff9f6470d396130b4aca7dfb22'
            'ce9dd83ae2ef9289e551f0a3ecbe246537195049c15f69bbfdc6c3ddd23291c2')

prepare() {
    cd "$srcdir/server-$_pkgver"

    for f in ../*.patch
    do
        patch --forward --strip=1 --input "$f"
    done

    dos2unix src/shell/casparcg.config
}

build() {
    # build libcef_dll_wrapper
    cd "$srcdir/cef_binary_${_cef_version}_linux64_minimal"

    # https://bitbucket.org/chromiumembedded/cef/commits/84a5749
    CXXFLAGS="$CXXFLAGS -Wno-attributes" \
        cmake -B build -S . -DCMAKE_BUILD_TYPE=None -G Ninja

    ninja -C build
    cp build/libcef_dll_wrapper/libcef_dll_wrapper.a Release/

    cd "$srcdir"
    cmake -B build -S "server-$_pkgver/src" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCEF_ROOT_DIR="$srcdir/cef_binary_${_cef_version}_linux64_minimal" \
        -DUSE_SYSTEM_BOOST=ON \
        -G Ninja

    ninja -C build
}

package() {
    install -d "$pkgdir/opt/casparcg/"
    cp -r "$srcdir/build/staging"/{bin,lib,casparcg.config} "$pkgdir/opt/casparcg/"

    install -Dm755 "$srcdir/casparcg" "$pkgdir/usr/bin/casparcg"

    ln -sf "/usr/share/fonts/liberation/LiberationMono-Regular.ttf" "$pkgdir/opt/casparcg/"
}

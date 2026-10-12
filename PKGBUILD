# Maintainer: Tim Ebbeke <tim 06 tr (at) gmail dot com>

pkgname=nui-sftp
pkgver=1.7.0
pkgrel=1
pkgdesc="NUI-based SFTP application"
arch=('x86_64')
url="https://github.com/5cript/nui-sftp"
license=('MIT')
depends=(
    webkitgtk-6.0
    curl
    crypto++
    libssh
    fmt
    boost
    boost-libs
    nlohmann-json
    sdbus-cpp
    zlib
    bzip2
    zstd
    xz
)
makedepends=(
    cmake
    ninja
    clang
    lld
    git
    python
    nodejs
)
options=('!debug')
source=(
    "$pkgname::git+$url.git#tag=v${pkgver//_/-}"
    "https://s3.g.s4.mega.io/jgemkib4a5fte35rktt5wxrwkw4ejk4ybemkf/nui-scp/images/NUI-SFTP_Logo-01_nopad.svg"
    "https://github.com/5cript/nui-sftp/releases/download/v${pkgver}/nui-sftp-linux-frontend_${pkgver}.tar.gz"
)
sha256sums=(
    '814c4a1bb3bfd145a182b35d98f007ab1cb9d45a6d3c1a07c7686e855362db14'
    'cf0fc442069dfd28bd8b7769da6dfdca92111044ea9817197716ed9bfada3869'
    'c80e12375fa7f9dd2597c1e14abe94d2cc4eba047887ebc43e143ede548e8291'
)

prepare() {
    cd "$pkgname"
    git submodule update --init --recursive
}

build() {
    cd "$pkgname"

    cmake -B "$srcdir/$pkgname/build" \
        -S "$srcdir/$pkgname" \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DFORCED_PROJECT_VERSION="$pkgver" \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_LINKER=lld \
        -DCMAKE_CXX_STANDARD=23 \
        -DOMIT_FRONTEND_BUILD=ON \
        -DNUI_FETCH_TRAITS=OFF

    cmake --build "$srcdir/$pkgname/build"
}

package() {
    # Create directories
    mkdir -p "$pkgdir"/usr/bin
    mkdir -p "$pkgdir"/opt/"$pkgname"
    mkdir -p "$pkgdir"/opt/"$pkgname"/bin
    mkdir -p "$pkgdir"/opt/"$pkgname"/frontend
    mkdir -p "$pkgdir"/opt/"$pkgname"/assets
    mkdir -p "$pkgdir"/opt/"$pkgname"/assets/icons
    mkdir -p "$pkgdir"/opt/"$pkgname"/themes

    # Unpack frontend tarball
    tar -xzf "$srcdir/nui-sftp-linux-frontend_${pkgver//_/-}.tar.gz" -C "$pkgdir"/opt/"$pkgname"/frontend --strip-components=1

    # Copy files
    install -m755 "$srcdir/$pkgname/build/bin/$pkgname" "$pkgdir"/opt/"$pkgname"/bin/"$pkgname"
    cp -r "$srcdir/$pkgname/static/assets" "$pkgdir"/opt/"$pkgname"/
    install -m644 "$srcdir/$pkgname/LICENSE" "$pkgdir"/opt/"$pkgname"/LICENSE
    cp -r "$srcdir/$pkgname/themes/." "$pkgdir"/opt/"$pkgname"/themes/

    # Desktop
    install -Dm644 "$srcdir/$pkgname/org.nuicpp.nui_sftp.desktop" "$pkgdir"/usr/share/applications/"$pkgname".desktop
    install -Dm644 "NUI-SFTP_Logo-01_nopad.svg" "$pkgdir"/usr/share/icons/hicolor/scalable/apps/nui_sftp.svg
    install -Dm644 "NUI-SFTP_Logo-01_nopad.svg" "$pkgdir"/opt/"$pkgname"/assets/icons/nui-sftp-logo.svg

    ln -s "/opt/$pkgname/bin/$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}
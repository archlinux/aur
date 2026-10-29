# Maintainer: Tim Ebbeke <tim 06 tr (at) gmail dot com>

pkgname=nui-sftp
pkgver=1.11.1
pkgrel=1
pkgdesc="NUI-based SFTP application"
arch=('x86_64')
url="https://github.com/5cript/nui-sftp"
license=('MIT')
# The CEF binary distribution Nui pins (cmake/dependencies/cef_version.cmake in Nui).
_cefversion=154.0.34+g14c5a08+chromium-154.0.8037.98
_cefdirectory="cef_binary_${_cefversion}_linux64_minimal"
depends=(
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
    glib2
    # Libraries of the bundled libcef.so
    alsa-lib
    at-spi2-core
    cairo
    dbus
    expat
    libcups
    libx11
    libxcb
    libxcomposite
    libxdamage
    libxext
    libxfixes
    libxkbcommon
    libxrandr
    mesa
    nspr
    nss
    pango
    systemd-libs
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
    "${_cefdirectory}.tar.bz2::https://cef-builds.spotifycdn.com/cef_binary_${_cefversion//+/%2B}_linux64_minimal.tar.bz2"
)
sha256sums=(
    '82403e98c990a51129442eb76d28d57c8d2c66bfd6c695a6f4c456b3bae42909'
    'cf0fc442069dfd28bd8b7769da6dfdca92111044ea9817197716ed9bfada3869'
    '47afeea441b474b9c12d493447d912d73cc1ac7e80738c5541df92ddfc3136db'
    'e87e2c76304372dd28b899ceb6efa4b353f52700594ddc358a8237ec07ec6492'
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
        -DNUI_FETCH_TRAITS=OFF \
        -DNUI_BROWSER_ENGINE=cef \
        -DNUI_FETCH_CEF=OFF \
        -DNUI_CEF_ROOT="$srcdir/$_cefdirectory"

    cmake --build "$srcdir/$pkgname/build"
}

package() {
    # bin/nui-sftp, CEF in lib/nui-sftp, assets and themes
    DESTDIR="$pkgdir" cmake --install "$srcdir/$pkgname/build" --prefix /opt/"$pkgname"

    # Unpack frontend tarball
    mkdir -p "$pkgdir"/opt/"$pkgname"/frontend
    tar -xzf "$srcdir/nui-sftp-linux-frontend_${pkgver//_/-}.tar.gz" -C "$pkgdir"/opt/"$pkgname"/frontend --strip-components=1

    install -m644 "$srcdir/$pkgname/LICENSE" "$pkgdir"/opt/"$pkgname"/LICENSE
    install -Dm644 "$srcdir/$_cefdirectory/LICENSE.txt" "$pkgdir"/usr/share/licenses/"$pkgname"/CEF-LICENSE.txt
    install -Dm644 "$srcdir/$_cefdirectory/CREDITS.html" "$pkgdir"/usr/share/licenses/"$pkgname"/CEF-CREDITS.html

    # Desktop
    install -Dm644 "$srcdir/$pkgname/org.nuicpp.nui_sftp.desktop" "$pkgdir"/usr/share/applications/"$pkgname".desktop
    install -Dm644 "NUI-SFTP_Logo-01_nopad.svg" "$pkgdir"/usr/share/icons/hicolor/scalable/apps/nui_sftp.svg
    install -Dm644 "NUI-SFTP_Logo-01_nopad.svg" "$pkgdir"/opt/"$pkgname"/assets/icons/nui-sftp-logo.svg

    mkdir -p "$pkgdir"/usr/bin
    ln -s "/opt/$pkgname/bin/$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}
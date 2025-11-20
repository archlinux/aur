# Maintainer: A Farzat <a@farzat.xyz>
# Contributor: Luc Khai Hai <lkh42t@gmail.com>
# Contributor: Rph <rphsoftware@gmail.com>

_name=shaka-packager
pkgname="$_name-git"
pkgver=3.4.2.r7.g5776b0b
pkgrel=1
pkgdesc='A tool and a media packaging SDK for DASH and HLS packaging and encryption.'
arch=('x86_64')
url='https://github.com/shaka-project/shaka-packager'
license=('BSD-3-Clause')
depends=('gcc-libs' 'libpsl' 'python-protobuf' 'python-numpy' 'glibc' 'libldap')
makedepends=('cmake' 'gcc' 'git' 'ninja' 'python')
provides=("$_name")
conflicts=("$_name")
replaces=("$_name")
source=("https://github.com/shaka-project/shaka-packager/raw/refs/heads/main/LICENSE"
        "git+https://github.com/shaka-project/shaka-packager.git"
        "git+https://github.com/google/googletest"
        "git+https://github.com/abseil/abseil-cpp"
        "git+https://github.com/curl/curl"
        "git+https://github.com/nlohmann/json"
        "git+https://github.com/Mbed-TLS/mbedtls"
        "git+https://github.com/madler/zlib"
        "git+https://github.com/glennrp/libpng"
        "git+https://github.com/webmproject/libwebm"
        "git+https://github.com/GNOME/libxml2"
        "git+https://github.com/protocolbuffers/protobuf"
        "git+https://github.com/cesanta/mongoose"
        "git+https://github.com/c-ares/c-ares"
        "git+https://github.com/microsoft/mimalloc")
sha256sums=('0eea5a66a8505f758fdc8710637c5b4f5f1b18b29d0f248d6e95a3cdfc8fb599'
            SKIP
            SKIP
            SKIP
            SKIP
            SKIP
            SKIP
            SKIP
            SKIP
            SKIP
            SKIP
            SKIP
            SKIP
            SKIP
            SKIP)

pkgver() {
    cd "$srcdir/$_name"
    git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_name"
    git submodule init
    git config submodule.packager/third_party/googletest/source.url "$srcdir/googletest"
    git config submodule.packager/third_party/abseil-cpp/source.url "$srcdir/abseil-cpp"
    git config submodule.packager/third_party/curl/source.url "$srcdir/curl"
    git config submodule.packager/third_party/json/source.url "$srcdir/json"
    git config submodule.packager/third_party/mbedtls/source.url "$srcdir/mbedtls"
    git config submodule.packager/third_party/zlib/source.url "$srcdir/zlib"
    git config submodule.packager/third_party/libpng/source.url "$srcdir/libpng"
    git config submodule.packager/third_party/libwebm/source.url "$srcdir/libwebm"
    git config submodule.packager/third_party/libxml2/source.url "$srcdir/libxml2"
    git config submodule.packager/third_party/protobuf/source.url "$srcdir/protobuf"
    git config submodule.packager/third_party/mongoose/source.url "$srcdir/mongoose"
    git config submodule.packager/third_party/c-ares/source.url "$srcdir/c-ares"
    git config submodule.packager/third_party/mimalloc/source.url "$srcdir/mimalloc"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$srcdir/$_name"
    cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    cmake --build build --parallel
}

package() {
    cd "$srcdir/$_name"
    DESTDIR="$pkgdir" cmake --install build/ --strip --config Release --prefix=/usr
    install -Dm644 "$srcdir/LICENSE" "$pkgdir"/usr/share/licenses/shaka-packager-git/LICENSE
}

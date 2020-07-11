# Maintainer: Viktor Schneider <aur@vjs.io>
# Contributor: Brett Cornwall <ainola@archlinux.org>

pkgname=mingw-w64-chrono-date
pkgver=3.0.0+5+g6952fb5
pkgrel=2
pkgdesc="A date and time library based on the C++11/14/17 <chrono> header (mingw-w64)"
arch=('any')
url="https://howardhinnant.github.io/date/date.html"
license=('MIT')
options=('!strip' 'staticlibs' '!buildflags')
depends=('mingw-w64-crt')
makedepends=(
    'mingw-w64-binutils'
    'mingw-w64-cmake'
    'mingw-w64-gcc'
    'git'
)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


# It's easiest to pin this commit and wait for a new release rather than patch
# as a number of issues with tests/dependent packages (e.g.
# https://github.com/Alexays/Waybar/issues/565) are present with the tagged
# stable version.
source=("$pkgname::git+https://github.com/HowardHinnant/date#commit=6952fb50a6a04c1b3682c56e1f1e26578f3bec1e"
        "538-output-date-pc-for-pkg-config.patch"
        "use-correct-path-for-cmake-files.patch")
sha256sums=('SKIP'
            'c881ae3ae08b46a2137b987e593469d030669c37c9423921a1fac7de512676f3'
            '0cf34f1c8efa949ba9d3c983d9032c114eaa99c5b5790bc9d5872aaaf0438120')

pkgver() {
    cd "$pkgname"
    git describe --always --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
    cd "$pkgname"
    # https://github.com/HowardHinnant/date/issues/537
    patch -p1 < ../538-output-date-pc-for-pkg-config.patch
    
    patch -p1 < ../use-correct-path-for-cmake-files.patch
}

build() {
    cd "$pkgname"
    for _arch in ${_architectures}; do
        mkdir -p build-${_arch} && pushd build-${_arch}
        ${_arch}-cmake .. \
            -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
            -DBUILD_TZ_LIB=true \
            -DUSE_SYSTEM_TZ_DB=true \
            -DENABLE_DATE_TESTING=false \
            -DCMAKE_CROSSCOMPILING_EMULATOR=/usr/bin/${_arch}-wine \
            -DCMAKE_CXX_FLAGS="-static"
        make
        ${_arch}-strip --strip-unneeded *.dll
        ${_arch}-strip -g *.a
        popd
    done
}

check() {
    cd "$pkgname"
    for _arch in ${_architectures}; do
        pushd build-${_arch}
        # make testit
        popd
    done
}

package() {
    cd "$pkgname"
    for _arch in ${_architectures}; do
        make -C build-${_arch} DESTDIR="$pkgdir/" install
    done
}

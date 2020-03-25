# Maintainer: Viktor Schneider <info at vjs dot io>
# Contributor: Brett Cornwall <ainola@archlinux.org>

pkgname=mingw-w64-chrono-date
pkgver=2.4.1+134+g9a0ee25
pkgrel=2
pkgdesc="A date and time library based on the C++11/14/17 <chrono> header"
arch=('any')
url="https://howardhinnant.github.io/date/date.html"
license=('MIT')
options=('!strip' 'staticlibs' '!buildflags')
makedepends=(
    'mingw-w64-cmake'
    'mingw-w64-gcc'
    'git'
)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


# It's easiest to pin this commit and wait for a new release rather than patch
# as a number of issues with tests/dependent packages (e.g.
# https://github.com/Alexays/Waybar/issues/565) are present with the tagged
# stable version.
source=("$pkgname::git+https://github.com/HowardHinnant/date#commit=9a0ee2542848ab8625984fc8cdbfb9b5414c0082"
        "538-output-date-pc-for-pkg-config.patch::https://patch-diff.githubusercontent.com/raw/HowardHinnant/date/pull/538.patch")
sha256sums=('SKIP'
            'f39ce7f1f738ebdc02948ed78be68cca10c01f9e22a4243670304eeda53a03fd')

pkgver() {
    cd "$pkgname"
    git describe --always --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
    cd "$pkgname"
    # https://github.com/HowardHinnant/date/issues/537
    patch -p1 < ../538-output-date-pc-for-pkg-config.patch
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
        ${_arch}-strip *.dll*
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
        install -d 755 "$pkgdir/usr/${_arch}/lib/cmake"
        mv "$pkgdir/usr/${_arch}/CMake" "$pkgdir/usr/${_arch}/lib/cmake/date"
    done
    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

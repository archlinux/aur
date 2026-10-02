# Maintainer: kekmacska

pkgname=gecko-git
pkgver=1.0.0.r486.g39092141b
pkgrel=1
pkgdesc='Modern cross-platform Fallout 2 map editor'
arch=('any')
license=('Apache-2.0')
url='https://github.com/JanSimek/gecko'
source=("git+$url.git")
makedepends=(cmake make svgo oxipng pkgconf git vulkan-headers catch2)
depends=(qt6-base qt6-svg sfml fmt zlib libglvnd)
provides=(gecko)
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname%-*}

    # 1. Extract the version number
    version=$(awk '/^project\(/{flag=1} flag && /VERSION/{print $2; exit}' CMakeLists.txt | tr -d ')"')

    # 2. Get git info
    commits=$(git rev-list --count HEAD)
    commit=$(git rev-parse --short=9 HEAD)

    # 3. Print result
    printf '%s.r%s.g%s\n' "$version" "$commits" "$commit"
}

prepare() {
    cd "$srcdir/${pkgname%-*}"

    git submodule update --init --recursive

    # delete unnecessary files
    rm -rf resources/{gecko.icns,Info.plist,gecko.ico,gecko.rc}

    # Patch CMakeLists.txt to remove unnecessary install targets
    # This ensures 'cmake --install' only installs Linux-relevant files
    sed -i \
        -e '/install.*Info\.plist/d' \
        -e '/install.*\.icns/d' \
        -e '/install.*\.ico/d' \
        -e '/install.*\.rc/d' \
        -e '/install.*DIRECTORY.*resources\/icons/d' \
        CMakeLists.txt

    svgo . -r --multipass || bun /usr/bin/svgo . -r --multipass
    oxipng -o max -r -p -s -v -t "$(nproc)" -z --zi 100 --ziwi 10 --brute-level 5 --brute-lines 16 resources
}

build() {
    cd ${pkgname%-*}

    BASE_CFLAGS="-O3 -march=native -mtune=native \
            -falign-functions=32 -falign-loops=32 \
            -fno-math-errno -fno-trapping-math -ffast-math \
            -fno-semantic-interposition \
            -fomit-frame-pointer -fno-plt \
            -pipe -flto -Wall -Wno-unused \
            -fstrict-aliasing \
            -fmerge-all-constants -ffunction-sections \
            -fdata-sections -fvisibility=hidden"

    BASE_CXXFLAGS="$BASE_CFLAGS"
    BASE_LDFLAGS="-Wl,--icf=safe -Wl,--gc-sections -Wl,-O3 -flto -fno-plt"

    # Clang-only flags
    CLANG_EXTRA_CFLAGS="-fstrict-vtable-pointers -fno-asynchronous-unwind-tables"
    CLANG_EXTRA_CXXFLAGS="$CLANG_EXTRA_CFLAGS"
    CLANG_EXTRA_LDFLAGS="-fuse-ld=lld"

    # Detect compiler
    if command -v clang >/dev/null 2>&1; then
        export CC=clang
        export CXX=clang++
        export CFLAGS="$BASE_CFLAGS $CLANG_EXTRA_CFLAGS"
        export CXXFLAGS="$BASE_CXXFLAGS $CLANG_EXTRA_CXXFLAGS"
        export LDFLAGS="$BASE_LDFLAGS $CLANG_EXTRA_LDFLAGS"
    else
        export CC=gcc
        export CXX=g++
        export CFLAGS="$BASE_CFLAGS"
        export CXXFLAGS="$BASE_CXXFLAGS"
        export LDFLAGS="$BASE_LDFLAGS"
    fi

    cmake -B build -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_MANDIR=share/man \
        -DCMAKE_INSTALL_DATAROOTDIR=share \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_BINDIR=bin

    cmake --build build --parallel "$(nproc)"
}

package(){
    cd "$srcdir/${pkgname%-*}"

    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

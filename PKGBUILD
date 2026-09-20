pkgname=kgb-git
pkgver=1.0b5.r0.g2dcf1fc
pkgrel=1
pkgdesc="KGB Archiver is the compression tool with unbelievable high compression rate"
arch=('any')
url="https://sourceforge.net/projects/kgbarchiver/"
license=('GPL-2.0')
depends=()
makedepends=('git' 'make')
source=("git+https://github.com/FS-make-simple/kgb.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
    cd "${pkgname%-*}"

    BASE_CFLAGS="-O3 -march=native -mtune=native \
        -falign-functions=32 -falign-loops=32 \
        -fno-math-errno -fno-trapping-math \
        -fno-semantic-interposition \
        -fomit-frame-pointer -fno-plt \
        -pipe -flto -Wall -Wno-unused \
        -fstrict-aliasing -fno-rtti -fno-exceptions \
        -fmerge-all-constants -ffunction-sections \
        -fdata-sections -fvisibility=hidden"

    CLANG_EXTRA_CFLAGS="-fstrict-vtable-pointers -fno-asynchronous-unwind-tables"

    if command -v clang >/dev/null 2>&1; then
        export CC=clang
        export CXX=clang++
        export CFLAGS="$BASE_CFLAGS $CLANG_EXTRA_CFLAGS"
        export CXXFLAGS="$BASE_CFLAGS $CLANG_EXTRA_CFLAGS"
        export LDFLAGS="-Wl,--icf=safe -Wl,--gc-sections -Wl,-O3 -flto -fno-plt -fuse-ld=lld"
    else
        export CFLAGS="$BASE_CFLAGS"
        export CXXFLAGS="$BASE_CFLAGS"
        export LDFLAGS="-Wl,--gc-sections -Wl,-O3 -flto -fno-plt"
    fi

    make -j"$(nproc)" CXXFLAGS="$CXXFLAGS -DPROGNAME='\"KGB_arch\"'" # DPROGNAME is needed and can only work from here
}

package() {
    cd "${pkgname%-*}"

    # Install binary
    install -Dm755 kgb "$pkgdir/usr/bin/kgb"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

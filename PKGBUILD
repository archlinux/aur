# Maintainer: kekmacska

pkgname=animage-git
pkgver=r0.ge06c2a0
pkgrel=1
pkgdesc='A free and opensource animation software'
arch=('any')
license=('GPL-3.0')
url='https://github.com/S-poony/Animage'
source=('git+https://github.com/S-poony/Animage.git' 'executable-name.patch')
makedepends=(cmake make svgo oxipng pkgconf git)
depends=(qt6-base libglvnd glibc)
provides=(animage)
sha256sums=('SKIP' 'b53b18e8a1b7aad2ba910169ab68e47c721ca4450162aa941e270435137af313')

pkgver() {
  cd Animage
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g;s/^latest\.//'
}

prepare() {
    cd "$srcdir/Animage"

    svgo . -r --multipass || bun /usr/bin/svgo . -r --multipass
    patch -Np1 -i "$srcdir/executable-name.patch"
}

build() {
    cd Animage

    BASE_CFLAGS="-O3 -march=native -mtune=native \
            -falign-functions=32 -falign-loops=32 \
            -fno-math-errno -fno-trapping-math \
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
        -DCMAKE_INSTALL_BINDIR=bin \
        -DQT_NO_PRIVATE_MODULE_WARNING=ON \
        -DANIMAGE_SANITIZE=OFF

    cmake --build build --parallel "$(nproc)"

}

package(){
    cd "$srcdir/Animage"

    DESTDIR="$pkgdir" cmake --install build

    # Install desktop file
    install -Dm644 "packaging/${pkgname%-*}.desktop" "$pkgdir/usr/share/applications/${pkgname%-*}.desktop"

    # Install icon
    install -Dm644 "packaging/${pkgname%-*}.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname%-*}.svg"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgname=photoslop-git
pkgver=0.1.0.r187.g8a7ad18
pkgrel=1
pkgdesc="Photoslop – a simple image editor written in Python (git version)"
arch=('any')
url="https://github.com/CryptoJones/Photoslop"
license=('Apache-2.0')
depends=('python' 'pyside6')
makedepends=('git' 'uv' 'python-installer')
source=("git+https://github.com/CryptoJones/Photoslop.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/Photoslop"
    printf "0.1.0.r%s.g%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/Photoslop"
    oxipng -o max -r -p -s -v -t $(nproc) -z --zi 100 --ziwi 10 --brute-level 5 --brute-lines 16 docs/icon.png || true
}

build() {
    cd "$srcdir/Photoslop"
    export PYTHONOPTIMIZE=1
    BASE_CFLAGS="-O3 -march=native -mtune=native \
        -falign-functions=32 -falign-loops=32 \
        -fno-math-errno -fno-trapping-math \
        -fno-semantic-interposition \
        -fomit-frame-pointer -fno-plt \
        -pipe -flto -Wall -Wno-unused \
        -fstrict-aliasing \
        -fmerge-all-constants -ffunction-sections \
        -fdata-sections"

    BASE_CXXFLAGS="$BASE_CFLAGS"
    BASE_LDFLAGS="-Wl,--icf=safe -Wl,--gc-sections -Wl,-O3 -flto -fno-plt"

    # Clang-only flags
    CLANG_EXTRA_CFLAGS="-fstrict-vtable-pointers -fno-asynchronous-unwind-tables"
    CLANG_EXTRA_CXXFLAGS="$CLANG_EXTRA_CFLAGS -fno-rtti -fno-exceptions"
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

    uv build
}

package() {
    cd "$srcdir/Photoslop/dist"

    # Install wheel into /usr
    python -m installer --destdir "$pkgdir" photoslop-*.whl

    # Install desktop entry (embedded)
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/photoslop.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=Photoslop
Comment=Photoslop image editor
Exec=photoslop
Icon=photoslop
Terminal=false
Categories=Graphics;
EOF

    # Install icon
    install -Dm644 "$srcdir/Photoslop/docs/icon.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/photoslop.png"
}

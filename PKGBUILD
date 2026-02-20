# Maintainer: your name <your@email>

pkgname=milton
pkgver=1.9.1
pkgrel=2
pkgdesc='An infinite-canvas paint program'
arch=('x86_64')
url='https://github.com/serge-rgb/milton'
license=('GPL-3.0-only')
depends=('gtk3' 'sdl2' 'libxi')
makedepends=('cmake' 'icoutils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/serge-rgb/milton/archive/v${pkgver}.tar.gz"
        'fix-deps.patch'
        'extern-c-fix.patch'
        'milton.desktop')
sha512sums=('26b531be432065ab9a683f5a015754853bdd59bdde2e034e862ada6813f6044412d11e4db6bd984693b4c00d186f11b6f3a45092255bda9ca50c5e749e647895'
            '9ef88c35fb08d8626f2f29c097bfaba60d3aedb119707fa87f3051b5ef39eb55a560cbcbb3294e97edf55257f8504ec5f681690fa696a6be48b360616b3e60ed'
            '1ca068baa60e322859b46721d035cdb350b1b4e78365eac375d8346e4ab604492ddc802dde2b05756333ee4cd512f45a456cc5b69ba00194722b4705bc5b40cf'
            'f81e8e7fc8218e9ab9f233e4526d71c78e94682570a4e7b1efd09e8343005c627c9d150933462cb7247da847b9012f8e7a602877512e2e80b65e454fc5774a77')

prepare() {
    cd "$pkgname-$pkgver"
    patch -Np1 -i ../fix-deps.patch
    patch -Np1 -i ../extern-c-fix.patch
}

build() {
    local _cxxflags="${CXXFLAGS/-Wformat /}"
    _cxxflags="${_cxxflags/-Werror=format-security/}"
    _cxxflags+=" -fdebug-prefix-map=$srcdir=."

    cmake -B "$srcdir/build" -S "$pkgname-$pkgver" \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CXX_FLAGS="$_cxxflags"
    cmake --build "$srcdir/build"
}

package() {
    # The binary looks for Carlito.ttf relative to its working directory
    # (platform_fname_at_exe is a no-op on Linux), so the binary and font
    # live together under /usr/lib/milton with a wrapper in /usr/bin.

    install -Dm755 "$srcdir/build/Milton" "$pkgdir/usr/lib/milton/Milton"

    install -Dm644 "$pkgname-$pkgver/third_party/Carlito.ttf" \
        "$pkgdir/usr/lib/milton/Carlito.ttf"
    install -Dm644 "$pkgname-$pkgver/third_party/Carlito.LICENSE" \
        "$pkgdir/usr/lib/milton/Carlito.LICENSE"

    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/milton" <<'EOF'
#!/bin/sh
cd /usr/lib/milton
exec ./Milton "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/milton"

    # Extract icon at multiple resolutions from the bundled .ico file
    cd "$srcdir/build"
    icotool -x milton_icon.ico
    for res in 16 32 48 64 128 256; do
        local f="milton_icon_*_${res}x${res}x32.png"
        if compgen -G "$f" > /dev/null; then
            install -Dm644 $f \
                "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/milton.png"
        fi
    done
    cd ..

    install -Dm644 "$srcdir/milton.desktop" \
        "$pkgdir/usr/share/applications/milton.desktop"
}

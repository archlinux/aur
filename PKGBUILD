# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=imgbrd-grabber
pkgver=7.14.0
pkgrel=2
pkgdesc="Very customizable imageboard/booru downloader with powerful filenaming features."
arch=('x86_64')
url="https://github.com/Bionus/imgbrd-grabber"
license=('Apache-2.0')
depends=('qt6-multimedia' 'qt6-declarative' 'nodejs' 'qt6-networkauth' 'hicolor-icon-theme' 'libgcc' 'glibc' 'qt6-base'
	 'qt6-webengine' 'libstdc++')
makedepends=('git' 'cmake' 'qt6-tools' 'npm' 'qt6-shadertools' 'jq' 'ninja' 'clang' 'vulkan-headers')
options=(!lto)
optdepends=('openssl: Access HTTPS sources')
conflicts=("imgbrd-grabber-git" 'imgbrd-grabber-bin' 'imgbrd-grabber-appimage')
source=("git+https://github.com/Bionus/imgbrd-grabber.git#tag=v${pkgver}"
        'git+https://github.com/LaurentGomila/qt-android-cmake.git'
        'git+https://github.com/sakra/cotire.git'
        'git+https://github.com/lexbor/lexbor.git'
	'git+https://github.com/catchorg/Catch2.git')
sha256sums=('ffe9147e942264011b08a588716f6ea47863dd421edc2ff4fb4b21cb86023da1'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "$srcdir/${pkgname}"
    git submodule init
    git config submodule.cmake/qt-android-cmake.url "$srcdir/qt-android-cmake"
    git config submodule.cmake/cotire.url "$srcdir/cotire"
    git config submodule.tests/src/vendor/catch.url "$srcdir/Catch2"
    git config submodule.lib/vendor/lexbor.url "$srcdir/lexbor"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$srcdir/${pkgname}/src/sites"

    npm install --no-optional

    cd "$srcdir" 

    cmake -S $pkgname/src -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG -flto=thin" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG -flto=thin" \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLEXBOR_BUILD_TESTS_CPP=0 \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -Wno-dev

    cmake --build build
}

package() {
    cd "$srcdir"

    DESTDIR="$pkgdir/" cmake --install build && rm -rf "$pkgdir/usr/include" "$pkgdir/usr/lib"
    cat >> "$pkgdir/usr/share/applications/org.bionus.Grabber.desktop" <<-EOF

StartupWMClass=cr.fr.bionus.Grabber
EOF
    sed -i 's/Icon=grabber/Icon=org.bionus.Grabber.png/g' "$pkgdir/usr/share/applications/org.bionus.Grabber.desktop"
    for size in {128,96,48};
    do
      cd "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
      mv grabber.png org.bionus.Grabber.png
      ln -s org.bionus.Grabber.png cr.fr.bionus.Grabber.png
    done

    touch "$pkgdir/usr/share/Grabber/settings.ini"
}

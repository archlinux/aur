# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Small_Fox <smallfox0305@gmail.com>
pkgname=mia-code-git
_pkgFullName=MiaCode
pkgver=1.0.0.r1064.g36dc7d08
pkgrel=1
epoch=
pkgdesc="A Simai editor built for professional chart creators"
arch=('x86_64')
url="https://github.com/fanfaredash/MiaCode"
license=('MIT')
groups=()
depends=(
    'ffmpeg'
    'libva'
    'qt6-base'
    'qt6-declarative'
    'qt6-multimedia'
    'qt6-quick3d'
    'qt6-shadertools'
    'libxkbcommon'
    'libglvnd'
    'libdrm'
    'libgcc'
    'libstdc++'
    'glibc'
    'hicolor-icon-theme'
)
makedepends=(
    'git'
    'cmake'
    'ninja'
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url.git#branch=dev")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd "$_pkgFullName"
    git describe --long --tags --always |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_pkgFullName"

    git submodule update --init --recursive

    sed -i '1i#include <cstdint>' \
    third_party/ScintillaQuick/third_party/scintilla/include/ScintillaTypes.h

    cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS_RELEASE="-O2 -DNDEBUG -ffile-prefix-map=$srcdir/MiaCode=." \
    -DCMAKE_BUILD_RPATH='$ORIGIN' \
    -DCMAKE_INSTALL_RPATH='$ORIGIN' \
    -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON
}

build() {
    cd "$srcdir/$_pkgFullName"
    cmake --build build --target MiaCode --parallel 4
}

package() {

	install -Dm644 "$_pkgFullName/resources/icons/app.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/MiaCode.png"

    install -Dm644 "$_pkgFullName/resources/icons/app.ico" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/MiaCode.ico"

    install -Dm644 "$_pkgFullName/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd "$_pkgFullName/build/"

    install -dm755 "$pkgdir/usr/lib/micode"

    # install -Dm755 MiaCode \
    #     "$pkgdir/usr/lib/micode/MiaCode"

    # install -Dm644 libbass.so \
    #     "$pkgdir/usr/lib/micode/libbass.so"

    # install -Dm644 libbassmix.so \
    #     "$pkgdir/usr/lib/micode/libbassmix.so"

    # install -Dm644 libbass_fx.so \
    #     "$pkgdir/usr/lib/micode/libbass_fx.so"

    # install -Dm644 libbassflac.so \
    # "$pkgdir/usr/lib/micode/libbassflac.so"

    cp -a bin "$pkgdir/usr/lib/micode/"

    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"

    cat > "$pkgdir/usr/share/applications/MiaCode.desktop" <<'EOF'
[Desktop Entry]
Name=MiaCode
Comment=MiaCode
Exec=MiaCode
Icon=MiaCode
Terminal=false
Type=Application
Categories=Game;ArcadeGame;
EOF

    cat > "$pkgdir/usr/bin/MiaCode" <<'EOF'
#!/bin/sh
exec /usr/lib/micode/bin/MiaCode "$@"
EOF

    chmod 755 "$pkgdir/usr/bin/MiaCode"
}

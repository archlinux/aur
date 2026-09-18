# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Small_Fox <smallfox0305@gmail.com>
pkgname=mia-code-git
_pkgFullName=MiaCode
pkgver=1.0.0.r889.g46e10c1e
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
source=("git+$url.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd "$_pkgFullName"
    git describe --long --tags --always |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgFullName"
	git checkout feature/qml-ui
	cmake -B build \
    -G "Ninja Multi-Config" \
    -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
    -DCMAKE_INSTALL_RPATH='$ORIGIN' \
    -DCMAKE_EXE_LINKER_FLAGS="-Wl,-z,relro,-z,now"
}

build() {
	cd "$_pkgFullName"
	cmake --build build --config Release -j$(nproc)
}

package() {

	install -Dm644 "$_pkgFullName/resources/icons/app.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/MiaCode.png"

    install -Dm644 "$_pkgFullName/resources/icons/app.ico" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/MiaCode.ico"

    install -Dm644 "$_pkgFullName/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd "$_pkgFullName/build/bin/Release"

    install -dm755 "$pkgdir/usr/lib/micode"

    install -Dm755 MiaCode \
        "$pkgdir/usr/lib/micode/MiaCode"

    install -Dm644 libbass.so \
        "$pkgdir/usr/lib/micode/libbass.so"

    install -Dm644 libbassmix.so \
        "$pkgdir/usr/lib/micode/libbassmix.so"

    install -Dm644 libbass_fx.so \
        "$pkgdir/usr/lib/micode/libbass_fx.so"

    cp -a assets "$pkgdir/usr/lib/micode/"

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
exec /usr/lib/micode/MiaCode "$@"
EOF

    chmod 755 "$pkgdir/usr/bin/MiaCode"
}

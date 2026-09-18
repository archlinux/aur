#!/usr/bin/bash

# Maintainer: Riccardo Marotti

# Downstream package tracking upstream Karere with the optional custom.css
# live-reload support from PR #183:
# https://github.com/tobagin/karere/pull/183
#
# The feature was declined upstream because it falls outside Karere's intended
# scope and would add maintenance burden as WhatsApp Web's CSS changes.

pkgname=karere-custom-css
pkgver=4.3.0
pkgrel=1
pkgdesc="Karere with optional custom.css live reload"
arch=('x86_64')
url="https://github.com/riccardomarotti/karere"
license=('GPL-3.0-or-later')
options=('!lto')
provides=("karere=$pkgver")
conflicts=('karere' 'karere-git' 'karere-custom-css-git')

_cef_ver="152.0.6"
_cef_chromium="152.0.7977.83"
_cef_hash="g708dc14"
_cef_dir="cef_binary_${_cef_ver}+${_cef_hash}+chromium-${_cef_chromium}_linux64_minimal"
_commit="b079de8bd30250ad2d10d2098fb0c7d12aa51c2f"

# libcef.so runtime libraries (readelf -d)
depends=(
    'gtk4'
    'libadwaita'
    'glib2'
    'gdk-pixbuf2'
    'libepoxy'
    'hicolor-icon-theme'

    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'dconf'
    'expat'
    'fontconfig'
    'graphene'
    'harfbuzz'
    'lcms2'
    'libcups'
    'libdrm'
    'libjpeg-turbo'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'openjpeg2'
    'pango'
    'systemd-libs'
    'wayland'
)

makedepends=(
    'git'
    'meson'
    'ninja'
    'cmake'
    'rust'
    'gettext'
    'patchelf'
    'desktop-file-utils'
    'appstream-glib'
    'appstream'
    'blueprint-compiler'
    'python-gobject'
)

optdepends=(
    'hunspell: spell checking support'
    'libappindicator-gtk3: system tray support'
)

source=(
    "karere::git+https://github.com/riccardomarotti/karere.git#commit=${_commit}"
    "cef-${_cef_ver}.zip::https://github.com/tobagin/karere/releases/download/cef-${_cef_ver}-proprietary-codecs/cef_binary_${_cef_ver}%2B${_cef_hash}%2Bchromium-${_cef_chromium}_linux64_minimal.zip"
)

sha256sums=(
    'SKIP'
    '3d64f6fac8911a368ffa415e3ee53d002cbd792866f08ed6578dae1e252cbac8'
)

prepare() {
    cd "$srcdir/karere"

    # cef-rs expects CEF_PATH to point to a flattened/exported CEF tree.
    rm -rf "$srcdir/cef-flat"
    mkdir -p "$srcdir/cef-flat"

    cp -a \
        "$srcdir/$_cef_dir/include" \
        "$srcdir/$_cef_dir/libcef_dll" \
        "$srcdir/$_cef_dir/cmake" \
        "$srcdir/$_cef_dir/CMakeLists.txt" \
        "$srcdir/cef-flat/"

    cp -a \
        "$srcdir/$_cef_dir/Release/." \
        "$srcdir/cef-flat/"

    cp -a \
        "$srcdir/$_cef_dir/Resources/." \
        "$srcdir/cef-flat/"

    # Metadata expected by cef-dll-sys when using a supplied CEF_PATH.
    cat > "$srcdir/cef-flat/archive.json" <<EOF
{"type":"minimal","name":"cef_binary_${_cef_ver}+${_cef_hash}+chromium-${_cef_chromium}_linux64_minimal.tar.bz2","sha1":"0000000000000000000000000000000000000000"}
EOF

    # build.rs adds an absolute CEF path to RUNPATH when CEF_PATH is set.
    # Keep the package relocatable and retain only the $ORIGIN entry.
    sed -i \
        '/println!("cargo:rustc-link-arg=-Wl,-rpath,{}", p\.display());/d' \
        build.rs
}

build() {
    cd "$srcdir/karere"

    export CEF_PATH="$srcdir/cef-flat"
    export RUSTFLAGS="--remap-path-prefix=$srcdir=/build"

    meson setup build \
        --prefix=/usr \
        --bindir=lib/karere/cef \
        --buildtype=release \
        -Dprofile=default

    meson compile -C build
}

package() {
    cd "$srcdir/karere"

    export RUSTFLAGS="--remap-path-prefix=$srcdir=/build"
    meson install -C build --destdir="$pkgdir"

    # CEF requires its libraries/resources beside the real executable.
    install -d "$pkgdir/usr/lib/karere/cef"

    cp -a \
        "$srcdir/$_cef_dir/Release/." \
        "$pkgdir/usr/lib/karere/cef/"

    cp -a \
        "$srcdir/$_cef_dir/Resources/." \
        "$pkgdir/usr/lib/karere/cef/"

    # Upstream expects all translations under share/karere/locale.
    if [[ -d "$pkgdir/usr/share/locale" ]]; then
        install -d "$pkgdir/usr/share/karere"
        mv \
            "$pkgdir/usr/share/locale" \
            "$pkgdir/usr/share/karere/locale"
    fi

    # Keep the actual executable beside CEF. Set cwd to /usr/share/karere
    # because native Karere resolves ./locale.
    install -d "$pkgdir/usr/bin"

    cat > "$pkgdir/usr/bin/karere" <<'EOF'
#!/bin/sh
cd /usr/share/karere || exit 1
exec /usr/lib/karere/cef/karere "$@"
EOF

    chmod 0755 "$pkgdir/usr/bin/karere"

    desktop-file-validate \
        "$pkgdir/usr/share/applications/"*.desktop

    appstream-util validate-relax --nonet \
        "$pkgdir/usr/share/metainfo/"*.xml
}

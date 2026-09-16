#!/usr/bin/bash

# Maintainer: Riccardo Marotti

# Downstream package tracking upstream Karere with the optional custom.css
# live-reload support from PR #183:
# https://github.com/tobagin/karere/pull/183
#
# The feature was declined upstream because it falls outside Karere's intended
# scope and would add maintenance burden as WhatsApp Web's CSS changes.

pkgname=karere-custom-css-git
pkgver=4.2.5.r1.g6bf8b2b
pkgrel=1
pkgdesc="Downstream Karere with optional custom.css live reload"
arch=('x86_64')
url="https://github.com/riccardomarotti/karere"
license=('GPL-3.0-or-later')
options=('!lto')
provides=('karere')
conflicts=('karere' 'karere-git')

_cef_ver="150.0.10"
_cef_chromium="150.0.7871.101"
_cef_hash="g8042e43"
_cef_dir="cef_binary_${_cef_ver}+${_cef_hash}+chromium-${_cef_chromium}_linux64_minimal"

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
    'karere::git+https://github.com/riccardomarotti/karere.git#branch=custom-css'
    "cef-${_cef_ver}.zip::https://github.com/tobagin/karere/releases/download/cef-${_cef_ver}-proprietary-codecs/cef_binary_${_cef_ver}%2B${_cef_hash}%2Bchromium-${_cef_chromium}_linux64_minimal.zip"
)

sha256sums=(
    'SKIP'
    '3bbe298368c4d87c19ad9b7ed4e8449ea91b32ffa3cefc8672791a1b96c9c3b9'
)

pkgver() {
    cd "$srcdir/karere"

    git describe \
        --long \
        --tags \
        --match 'v[0-9]*' \
        --abbrev=7 |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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

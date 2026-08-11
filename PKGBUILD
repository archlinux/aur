# Maintainer: MojArch

pkgname=opera-developer
pkgver=136.0.5981.0
pkgrel=0
pkgdesc='Fast, secure, easy-to-use web browser (Developer Stream)'
arch=('x86_64')
url='https://www.opera.com/computer'
license=('LicenseRef-opera')
options=(!strip !debug !zipman)
backup=('etc/opera-developer/default')
provides=(
    'opera-developer-browser'
)
conflicts=(
    'opera-developer-ffmpeg-codecs-bin'
)
replaces=(
    'opera-developer-ffmpeg-codecs-bin'
)

depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'cups'
    'curl'
    'dbus'
    'expat'
    'gcc-libs'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libnotify'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'libxss'
    'mesa'
    'nspr'
    'nss'
    'pango'
    'systemd-libs'
    'ttf-font'
    'xdg-utils'
)

optdepends=(
    'qt5-base: Qt5 integration'
    'qt6-base: Qt6 integration'
    'egl-gbm'
    'upower'
)

_nwjs_ffmpeg_version=0.114.1
_upstream_deb_pkg='opera-developer'
_debfile="${_upstream_deb_pkg}_${pkgver}_amd64.deb"
_deburl="https://get.opera.com/pub/opera-developer/${pkgver}/linux/${_debfile}"
_ffmpeg_zip="${_nwjs_ffmpeg_version}-linux-x64.zip"

source=(
    "${_deburl}"
    "opera"
    "default"
    "nwjs-ffmpeg-${_ffmpeg_zip}::https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt/releases/download/${_nwjs_ffmpeg_version}/${_ffmpeg_zip}"
)

sha256sums=('fe8888cf7cca3fab58a367dfde071aa172116f79524530a5e60d240feb3838d9'
            '08aceb9b2f3c3e7435333b40162c6aeae4f3aa280e2fc5b4597dddaa849f64e6'
            '99fc0d2822edd14e234d451995db47148125e4580221a292598959421d131231'
            '521e3e9c59fba536c5316cc3a9eb5ab6ac2f3cdce1051fda1a7446a4c3147bcd')

prepare() {
    sed -e 's|%pkgname%|opera-developer|g' \
        -e 's|%operabin%|opera-developer/opera-developer|g' \
        -i "$srcdir/opera"

    sed -e 's|%pkgname%|opera-developer|g' \
        -i "$srcdir/default"
}

package() {
    cd "$srcdir"

# Extract upstream package

    bsdtar -xf "$_debfile"

    bsdtar -xf data.tar.xz \
        --exclude='usr/share/lintian' \
        --exclude='usr/share/menu' \
        -C "$pkgdir"

# Normalize multiarch library layout

    local libroot="$pkgdir/usr/lib"

    local multiarch_dir
    multiarch_dir="$(find "$libroot" \
        -mindepth 1 \
        -maxdepth 1 \
        -type d \
        -name '*-linux-gnu' \
        | head -n1)"

    if [[ -z "$multiarch_dir" ]]; then
        echo 'ERROR: multiarch library directory not found'
        return 1
    fi

    local upstream_libdir
    upstream_libdir="$(find "$multiarch_dir" \
        -mindepth 1 \
        -maxdepth 1 \
        -type d \
        -name 'opera-developer' \
        | head -n1)"

    if [[ -z "$upstream_libdir" ]]; then
        echo 'ERROR: upstream Opera payload directory not found'
        return 1
    fi

    rm -rf "$libroot/opera-developer"
    mv "$upstream_libdir" \
        "$libroot/opera-developer"
    rm -rf "$multiarch_dir"

# Replace FFmpeg

    bsdtar -xf "nwjs-ffmpeg-${_ffmpeg_zip}"

    local ffmpeg_so
    ffmpeg_so="$(find "$srcdir" \
        -type f \
        -name 'libffmpeg.so' \
        | head -n1)"

    if [[ -z "$ffmpeg_so" ]]; then
        echo "ERROR: libffmpeg.so not found in $_ffmpeg_zip"
        return 1
    fi

    rm -f "$pkgdir/usr/lib/opera-developer/libffmpeg.so"

    install -Dm755 "$ffmpeg_so" \
        "$pkgdir/usr/lib/opera-developer/libffmpeg.so"

# Sandbox

    if [[ -f "$pkgdir/usr/lib/opera-developer/opera_sandbox" ]]; then
        chmod 4755 \
            "$pkgdir/usr/lib/opera-developer/opera_sandbox"
    fi

# Defaults

    install -Dm644 "$srcdir/default" \
        "$pkgdir/etc/opera-developer/default"

# Launcher

    local upstream_binary

    upstream_binary="$(find "$pkgdir/usr/lib/opera-developer" \
        -maxdepth 1 \
        -type f \
        \( -name 'opera-developer' -o -name 'opera' \) \
        | head -n1)"

    if [[ -z "$upstream_binary" ]]; then
        echo 'ERROR: upstream Opera executable not found'
        return 1
    fi

    rm -f "$pkgdir/usr/bin/opera-developer"

    install -Dm755 "$srcdir/opera" \
        "$pkgdir/usr/bin/opera-developer"

# Desktop entries

    local desktop_dir="$pkgdir/usr/share/applications"

    if [[ -d "$desktop_dir" ]]; then
        find "$desktop_dir" \
            -maxdepth 1 \
            -type f \
            -name '*.desktop' \
            -print0 |
        while IFS= read -r -d '' desktop_file; do
            if grep -qi 'opera' "$desktop_file"; then
                sed -i \
                    -e 's|^Exec=.*|Exec=opera-developer %U|' \
                    -e 's|^TryExec=.*|TryExec=opera-developer|' \
                    "$desktop_file"
            fi
        done
    fi


# License

    local copyright_file

    copyright_file="$(find "$pkgdir/usr/share/doc" \
        -type f \
        -name copyright \
        | head -n1)"

    if [[ -n "$copyright_file" ]]; then
        install -Dm644 "$copyright_file" \
            "$pkgdir/usr/share/licenses/$pkgname/copyright"
    fi
}

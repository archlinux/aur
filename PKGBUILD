# Maintainer: zedspeirs
# Co-Maintainer: 67mustard41

pkgname=opera-gx
pkgver=135.0.5973.57
pkgrel=2
pkgdesc='Opera GX The Gaming Browser'
arch=('x86_64')
url='https://www.opera.com/gx'
license=('LicenseRef-opera')
options=(!strip !zipman)
backup=('etc/opera-gx/default')

provides=('opera-gx-browser')
conflicts=(
    'opera-gx-bin'
    'opera-gx-stable'
    'opera-gx-stable-ffmpeg-codecs'
)
replaces=(
    'opera-gx-bin'
    'opera-gx-stable'
    'opera-gx-stable-ffmpeg-codecs'
)

depends=(
    'alsa-lib'
    'atk'
    'at-spi2-atk'
    'at-spi2-core'
    'cairo'
    'curl'
    'dbus'
    'expat'
    'gcc-libs'
    'glib2'
    'glibc'
    'gnupg'
    'gtk3'
    'hicolor-icon-theme'
    'libcups'
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
    'upower: battery save support'
)

_nwjs_ffmpeg_version=0.114.0

_upstream_deb_pkg='opera-gx-stable'
_debfile="${_upstream_deb_pkg}_${pkgver}_amd64.deb"
_deburl="https://get.opera.com/pub/opera_gx/${pkgver}/linux/${_debfile}"
_ffmpeg_zip="${_nwjs_ffmpeg_version}-linux-x64.zip"

source=(
    "${_deburl}"
    "opera-gx"
    "default"
    "eula.html"
    "terms.html"
    "privacy.html"
    "nwjs-ffmpeg-${_ffmpeg_zip}::https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt/releases/download/${_nwjs_ffmpeg_version}/${_ffmpeg_zip}"
)

noextract=(
    "$_debfile"
    "nwjs-ffmpeg-${_ffmpeg_zip}"
)

sha256sums=('3966a2238f60101489f7980927c62f324aa922b100871bfea26a2452ec611474'
            'baeb75b7d52f1f75ec46027b05f0df0f4a22d6c47ab5816562f6e183c3af4034'
            '99fc0d2822edd14e234d451995db47148125e4580221a292598959421d131231'
            '3c48827275d36f2a38a9ac63ce81875211f11022d390d7ada302d26e475271ea'
            'd67656e82d68ab88841b3e16a24e60aabd9f242e42b7010f9613282df57d7003'
            'cb50dfd6f03cafffbb0565f4cf6d8f943b2709dcdb30acc3d0a52c9c99af3e32'
            '521e3e9c59fba536c5316cc3a9eb5ab6ac2f3cdce1051fda1a7446a4c3147bcd')

prepare() {
    sed \
        -e 's|%pkgname%|opera-gx|g' \
        -e 's|%operabin%|opera-gx/opera|g' \
        -i "$srcdir/opera-gx"

    sed \
        -e 's|%pkgname%|opera-gx|g' \
        -i "$srcdir/default"
}

package() {
    cd "$srcdir"

    #
    # Extract Debian package container.
    #
    bsdtar -xf "$_debfile"

    #
    # Debian packages may use xz, zstd, gzip, etc.
    # Do not hard-code data.tar.xz.
    #
    local data_archive
    data_archive="$(
        find "$srcdir" \
            -maxdepth 1 \
            -type f \
            -name 'data.tar.*' \
            -print \
            -quit
    )"

    if [[ -z "$data_archive" ]]; then
        echo 'ERROR: data.tar.* not found in Opera GX Debian package'
        return 1
    fi

    echo "Extracting Debian payload: ${data_archive##*/}"

    bsdtar -xf "$data_archive" \
        --exclude='usr/share/lintian' \
        --exclude='usr/share/menu' \
        -C "$pkgdir"

    #
    # Opera's Debian package installs its libraries into a
    # Debian multiarch directory such as:
    #
    # /usr/lib/x86_64-linux-gnu/opera-gx/
    #
    # Move it to the Arch-style path:
    #
    # /usr/lib/opera-gx/
    #
    local libroot="$pkgdir/usr/lib"
    local multiarch_dir
    local upstream_libdir

    multiarch_dir="$(
        find "$libroot" \
            -mindepth 1 \
            -maxdepth 1 \
            -type d \
            -name '*-linux-gnu' \
            -print \
            -quit
    )"

    if [[ -z "$multiarch_dir" ]]; then
        echo 'ERROR: multiarch library directory not found under /usr/lib'
        return 1
    fi

    upstream_libdir="$(
        find "$multiarch_dir" \
            -mindepth 1 \
            -maxdepth 1 \
            -type d \
            \( -name 'opera-gx' -o -name 'opera-gx-stable' \) \
            -print \
            -quit
    )"

    if [[ -z "$upstream_libdir" ]]; then
        echo 'ERROR: upstream Opera GX payload directory not found'
        return 1
    fi

    rm -rf "$libroot/opera-gx"
    mv "$upstream_libdir" "$libroot/opera-gx"

    #
    # Remove the now-unused Debian multiarch directory.
    #
    rm -rf "$multiarch_dir"

    #
    # Install NW.js FFmpeg codec library.
    #
    bsdtar -xf "nwjs-ffmpeg-${_ffmpeg_zip}"

    local ffmpeg_so
    ffmpeg_so="$(
        find "$srcdir" \
            -type f \
            -name 'libffmpeg.so' \
            -print \
            -quit
    )"

    if [[ -z "$ffmpeg_so" ]]; then
        echo "ERROR: libffmpeg.so not found in $_ffmpeg_zip"
        return 1
    fi

    rm -f "$pkgdir/usr/lib/opera-gx/libffmpeg.so"

    install -Dm755 "$ffmpeg_so" \
        "$pkgdir/usr/lib/opera-gx/libffmpeg.so"

    #
    # Chromium sandbox requires setuid root when provided by upstream.
    #
    if [[ -f "$pkgdir/usr/lib/opera-gx/opera_sandbox" ]]; then
        chmod 4755 "$pkgdir/usr/lib/opera-gx/opera_sandbox"
    fi

    #
    # Install Opera GX defaults.
    #
    install -Dm644 "$srcdir/default" \
        "$pkgdir/etc/opera-gx/default"

    #
    # Replace upstream launcher with our Arch launcher.
    #
    rm -f "$pkgdir/usr/bin/opera-gx"
    rm -f "$pkgdir/usr/bin/${_upstream_deb_pkg}"

    install -Dm755 "$srcdir/opera-gx" \
        "$pkgdir/usr/bin/opera-gx"

    #
    # Keep upstream executable name as compatibility symlink.
    #
    ln -sf opera-gx \
        "$pkgdir/usr/bin/${_upstream_deb_pkg}"

    #
    # Fix desktop launcher commands.
    #
    local desktop_dir="$pkgdir/usr/share/applications"

    if [[ -d "$desktop_dir" ]]; then
        find "$desktop_dir" \
            -maxdepth 1 \
            -type f \
            -name '*.desktop' \
            -print0 |
        while IFS= read -r -d '' desktop_file; do
            if grep -qi 'opera.*gx' "$desktop_file"; then
                sed -i \
                    -e 's|^Exec=.*|Exec=opera-gx %U|' \
                    -e 's|^TryExec=.*|TryExec=opera-gx|' \
                    "$desktop_file"
            fi
        done
    fi

    #
    # Install upstream copyright/license information when present.
    #
    local copyright_file
    copyright_file="$(
        find "$pkgdir/usr/share/doc" \
            -type f \
            -name copyright \
            -print \
            -quit 2>/dev/null
    )"

    if [[ -n "$copyright_file" ]]; then
        install -Dm644 "$copyright_file" \
            "$pkgdir/usr/share/licenses/$pkgname/copyright"
    fi

    #
    # Additional Opera license documents.
    #
    install -Dm644 "$srcdir/eula.html" \
        "$pkgdir/usr/share/licenses/$pkgname/eula.html"

    install -Dm644 "$srcdir/terms.html" \
        "$pkgdir/usr/share/licenses/$pkgname/terms.html"

    install -Dm644 "$srcdir/privacy.html" \
        "$pkgdir/usr/share/licenses/$pkgname/privacy.html"
}

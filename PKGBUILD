# Maintainer: zedspeirs
# Co-Maintainer: 67mustard41

pkgname=opera-gx
pkgver=132.0.5905.43
pkgrel=2
pkgdesc='Opera GX The Gaming Browser'
arch=('x86_64')
url='https://www.opera.com/gx'
license=('LicenseRef-opera')
options=(!strip !zipman)
backup=('etc/opera-gx/default')
provides=('opera-gx-browser')
conflicts=('opera-gx-bin' 'opera-gx-stable' 'opera-gx-stable-ffmpeg-codecs')
replaces=('opera-gx-bin' 'opera-gx-stable' 'opera-gx-stable-ffmpeg-codecs')
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

_nwjs_ffmpeg_version=0.111.3

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

sha256sums=('6cff9d4bbce8a872704b918fb0a210082044cae9b6df547367002d785dd06093'
            'baeb75b7d52f1f75ec46027b05f0df0f4a22d6c47ab5816562f6e183c3af4034'
            '99fc0d2822edd14e234d451995db47148125e4580221a292598959421d131231'
            '3c48827275d36f2a38a9ac63ce81875211f11022d390d7ada302d26e475271ea'
            'd67656e82d68ab88841b3e16a24e60aabd9f242e42b7010f9613282df57d7003'
            'cb50dfd6f03cafffbb0565f4cf6d8f943b2709dcdb30acc3d0a52c9c99af3e32'
            '99a90ffe054584f88ed1aba70ed2fe04848c7ed3aa39882ca114a39735810af1')

prepare() {
    sed -e 's|%pkgname%|opera-gx|g' \
        -e 's|%operabin%|opera-gx/opera|g' \
        -i "$srcdir/opera-gx"

    sed -e 's|%pkgname%|opera-gx|g' \
        -i "$srcdir/default"
}

package() {
    cd "$srcdir"

    bsdtar -xf "$_debfile"

    tar -xf data.tar.xz \
        --exclude='usr/share/lintian' \
        --exclude='usr/share/menu' \
        -C "$pkgdir"

    local libroot="$pkgdir/usr/lib"
    local multiarch_dir
    local upstream_libdir

    multiarch_dir="$(find "$libroot" -mindepth 1 -maxdepth 1 -type d -name '*-linux-gnu' | head -n1)"
    if [[ -z "$multiarch_dir" ]]; then
        echo 'ERROR: multiarch library directory not found under /usr/lib'
        return 1
    fi

    upstream_libdir="$(find "$multiarch_dir" -mindepth 1 -maxdepth 1 -type d \( -name 'opera-gx' -o -name 'opera-gx-stable' \) | head -n1)"
    if [[ -z "$upstream_libdir" ]]; then
        echo 'ERROR: upstream Opera GX payload directory not found'
        return 1
    fi

    rm -rf "$libroot/opera-gx"
    mv "$upstream_libdir" "$libroot/opera-gx"
    rm -rf "$multiarch_dir"

    bsdtar -xf "nwjs-ffmpeg-${_ffmpeg_zip}"

    local ffmpeg_so
    ffmpeg_so="$(find "$srcdir" -type f -name 'libffmpeg.so' | head -n1)"
    if [[ -z "$ffmpeg_so" ]]; then
        echo "ERROR: libffmpeg.so not found in $_ffmpeg_zip"
        return 1
    fi

    rm -f "$pkgdir/usr/lib/opera-gx/libffmpeg.so"
    install -Dm755 "$ffmpeg_so" \
        "$pkgdir/usr/lib/opera-gx/libffmpeg.so"

    if [[ -f "$pkgdir/usr/lib/opera-gx/opera_sandbox" ]]; then
        chmod 4755 "$pkgdir/usr/lib/opera-gx/opera_sandbox"
    fi

    install -Dm644 "$srcdir/default" \
        "$pkgdir/etc/opera-gx/default"

    rm -f "$pkgdir/usr/bin/opera-gx"
    rm -f "$pkgdir/usr/bin/${_upstream_deb_pkg}"
    install -Dm755 "$srcdir/opera-gx" \
        "$pkgdir/usr/bin/opera-gx"

    ln -sf opera-gx "$pkgdir/usr/bin/${_upstream_deb_pkg}"

    local desktop_dir="$pkgdir/usr/share/applications"
    if [[ -d "$desktop_dir" ]]; then
        find "$desktop_dir" -maxdepth 1 -type f -name '*.desktop' -print0 |
        while IFS= read -r -d '' desktop_file; do
            if grep -qi 'opera.*gx' "$desktop_file"; then
                sed -i \
                    -e 's|^Exec=.*|Exec=opera-gx %U|' \
                    -e 's|^TryExec=.*|TryExec=opera-gx|' \
                    "$desktop_file"
            fi
        done
    fi

    local copyright_file
    copyright_file="$(find "$pkgdir/usr/share/doc" -type f -name copyright | head -n1)"
    if [[ -n "$copyright_file" ]]; then
        install -Dm644 "$copyright_file" \
            "$pkgdir/usr/share/licenses/$pkgname/copyright"
    fi

    install -Dm644 "$srcdir/eula.html" \
        "$pkgdir/usr/share/licenses/$pkgname/eula.html"
    install -Dm644 "$srcdir/terms.html" \
        "$pkgdir/usr/share/licenses/$pkgname/terms.html"
    install -Dm644 "$srcdir/privacy.html" \
        "$pkgdir/usr/share/licenses/$pkgname/privacy.html"
}

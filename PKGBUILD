# vim:set ft=sh:
# Maintainer: zedspeirs

pkgname=opera-gx-bin
pkgver=129.0.5823.26
pkgrel=1
pkgdesc='Opera GX The Gaming Browser'
arch=('x86_64')
url='https://www.opera.com/gx'
license=('LicenseRef-opera')
options=(!strip !zipman)
backup=('etc/opera-gx/default')
provides=('www-browser')
conflicts=('opera-gx' 'opera-gx-stable')

depends=(
    'alsa-lib'
    'atk'
    'at-spi2-atk'
    'at-spi2-core'
    'cairo'
    'cups'
    'curl'
    'dbus'
    'expat'
    'gcc-libs'
    'glib2'
    'glibc'
    'gnupg'
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
)

optdepends=(
    'qt5-base: Qt5 integration'
    'qt6-base: Qt6 integration'
    'upower: battery save support'
)

_nwjs_ffmpeg_version=0.108.0

_upstream_pkg='opera-gx-stable'
_debfile="${_upstream_pkg}_${pkgver}_amd64.deb"
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

sha256sums=('6709a02badf6f79cab01844905dfc5896f9e99f0ed1a788cef82dc5a1d241d78'
            'baeb75b7d52f1f75ec46027b05f0df0f4a22d6c47ab5816562f6e183c3af4034'
            '99fc0d2822edd14e234d451995db47148125e4580221a292598959421d131231'
            '7eeb500cd0ad552e02483dbc56bd493755254ff63a4aa1bc72a08c65e5bc152a'
            '1472b417c7a338d176984866ce775cafd8055907996010ce4a60a454bdfb18d5'
            '4c92cab6658580bcdb9ab72dd1c4262a54ffeeb799ba4339be4d201c18e882ce'
            'd46952266692504cf5283fb8dec9ae49a2ee040e0dbd3ec10477588a89215cbb')

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
    rm -f "$pkgdir/usr/bin/${_upstream_pkg}"
    install -Dm755 "$srcdir/opera-gx" \
        "$pkgdir/usr/bin/opera-gx"

    ln -sf opera-gx "$pkgdir/usr/bin/${_upstream_pkg}"

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

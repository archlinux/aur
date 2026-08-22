# Maintainer: Mathieu Grenet <mathieu@mgth.fr>
#
# mpv-omniphony — mpv built with the ad_orender spatial audio decoder
# (liborender, from the `orender` package). Replaces the stock mpv.
# Non-spatial streams still play via ad_lavc as usual.
#
# Lives in packaging/ (not the repo root) so makepkg's $srcdir/$pkgdir don't
# collide with the repo's own src/ directory.
#
# Self-contained: fetches the pinned upstream mpv release AND this repo's
# release tarball (decoder source + patches), so it builds from the AUR
# without a checkout of the mpv-omniphony repo.

pkgname=mpv-omniphony
_tag=v0.5.2              # mpv-omniphony release tag (patches + ad_orender)
_mpvver=0.41.0           # pinned upstream mpv release tag (without the 'v')
pkgver=0.5.2             # $_tag without the 'v' (hyphens, if any, become '.')
pkgrel=1
pkgdesc="mpv with the orender spatial audio decoder (object rendering via liborender)"
arch=('x86_64')
url="https://github.com/mgth/mpv-omniphony"
license=('GPL-3.0-or-later')
# ffmpeg, libass and libplacebo are declared twice on purpose: once as packages
# (so the right provider gets pulled in) and once as bare sonames. makepkg's
# find_libdepends() rewrites every bare `.so` entry into `name.so=MAJOR-64`
# read from the binaries actually built here (e.g. libavcodec.so=63-64), so a
# soname bump in ffmpeg/libass/libplacebo makes pacman refuse the upgrade until
# this package is rebuilt, instead of letting the installed mpv break.
# This is not hypothetical: 0.4.2-1 was built against ffmpeg 8 (libavcodec.so.62),
# ffmpeg 9 landed, pacman said nothing, and /usr/bin/mpv died at startup with
# "error while loading shared libraries: libavcodec.so.62".
# Deliberately no `ffmpeg>=2:9.0` floor here, unlike mpv-omniphony-fel: that
# package's floor is a *feature* floor (dovi_split BSF + DoVi stream group) and
# says nothing about ABI. mpv 0.41.0 builds against ffmpeg 8 and 9 alike, and a
# `>=` floor would not have caught this bump anyway — the next one (libavcodec.so.64)
# still satisfies `>=2:9.0`. Only the soname deps give ABI safety.
# Only mpv's mandatory libraries are listed as sonames; feature-dependent ones
# (libbluray, libcdio, lcms2...) vary with what is present at build time and
# would just warn on builds that skip them.
depends=('orender>=0.5.2' 'ffmpeg' 'libass' 'libplacebo' 'luajit' 'libx11' 'mesa'
         'libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
         'libavutil.so' 'libswresample.so' 'libswscale.so'
         'libass.so' 'libplacebo.so')
optdepends=('harletty-bridge: decode compressed/object-audio formats via the orender bridge plugin')
makedepends=('meson' 'ninja' 'python')
# Match the repo mpv's epoch (1:) so `mpv>=1:x` dependencies resolve, and
# advertise the bundled libmpv soname like the repo package does (python-mpv,
# celluloid & co depend on it).
provides=("mpv=1:$_mpvver" 'libmpv.so=2-64')
conflicts=('mpv')
source=("mpv-$_mpvver.tar.gz::https://github.com/mpv-player/mpv/archive/v$_mpvver.tar.gz"
        "mpv-omniphony-$_tag.tar.gz::https://github.com/mgth/mpv-omniphony/archive/refs/tags/$_tag.tar.gz")
sha256sums=('ee21092a5ee427353392360929dc64645c54479aefdb5babc5cfbb5fad626209'
            '88dcb0df8591f6d31a83028b91c73154e6cfa38dc1b031dffad21dd738be5072')

_repo="mpv-omniphony-${_tag#v}"   # extracted repo tarball (src/, patches/)

prepare() {
    cd "$srcdir/mpv-$_mpvver"
    # patch 0001 adds audio/decode/ad_orender.c; the rest wire it in.
    shopt -s nullglob
    local patches=("$srcdir/$_repo"/patches/*.patch)
    if [ ${#patches[@]} -eq 0 ]; then
        echo "no patches in $_repo/patches — broken release tarball?" >&2
        return 1
    fi
    for p in "${patches[@]}"; do
        echo "applying ${p##*/}"
        patch -p1 < "$p"
    done
}

build() {
    cd "$srcdir/mpv-$_mpvver"
    # --auto-features=auto: undo arch-meson's blanket `enabled`, which would
    # force platform-foreign features (e.g. win32-threads) and fail.
    arch-meson build --auto-features=auto -Dorender=enabled
    meson compile -C build
}

package() {
    cd "$srcdir/mpv-$_mpvver"
    meson install -C build --destdir="$pkgdir"

    # License + third-party notices for the combined work (GPL-3.0-or-later,
    # see the repo's README "License" section).
    install -Dm644 "$srcdir/$_repo/COPYING" \
        "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 "$srcdir/$_repo/THIRD-PARTY-NOTICES.md" \
        "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.md"
}

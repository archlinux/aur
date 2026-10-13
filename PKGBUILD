# Maintainer: Mathieu Grenet <mathieu@mgth.fr>
#
# mpv-omniphony — mpv built with the ad_orender spatial audio decoder
# (liborender, from the `orender` package). Replaces the stock mpv.
# Non-spatial streams still play via ad_lavc as usual.
#
# Lives in packaging/ (not the repo root) so makepkg's $srcdir/$pkgdir don't
# collide with the repo's own src/ directory.
#
# Self-contained: fetches the tag of the mpv fork the release was built from
# (mpv plus the orender integration, nothing to patch) and this repo's release
# tarball (licence texts), so it builds from the AUR without a checkout of the
# mpv-omniphony repo.

pkgname=mpv-omniphony
_tag=v0.7.0              # mpv-omniphony release tag
_forktag=orender-v0.7.0.1  # mgth/mpv tag that release builds: MPV_FORK_STABLE_TAG of mpv-fork.env at $_tag
_mpvver=0.41.0           # upstream mpv release the fork tag is based on (without the 'v')
pkgver=0.7.0             # $_tag without the 'v' (hyphens, if any, become '.')
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
depends=('orender>=0.7.0' 'ffmpeg' 'libass' 'libplacebo' 'luajit' 'libx11' 'mesa'
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
source=("mpv-$_forktag.tar.gz::https://github.com/mgth/mpv/archive/refs/tags/$_forktag.tar.gz"
        "mpv-omniphony-$_tag.tar.gz::https://github.com/mgth/mpv-omniphony/archive/refs/tags/$_tag.tar.gz")
# Filled in by `updpkgsums` when the AUR package is bumped, once both tags exist.
sha256sums=('0c79ade96cc497fa6bc4230e134891ddadbbd856d8876848ff8ce9c66faafc83'
            '7529a0afba63726307982410e7f5e79cdf73bf69b5d13aa9ee649992b178ad2b')

_mpv="mpv-$_forktag"              # extracted fork tarball
_repo="mpv-omniphony-${_tag#v}"   # extracted repo tarball (COPYING, notices)

build() {
    cd "$srcdir/$_mpv"
    # --auto-features=auto: undo arch-meson's blanket `enabled`, which would
    # force platform-foreign features (e.g. win32-threads) and fail.
    arch-meson build --auto-features=auto -Dorender=enabled
    meson compile -C build
}

package() {
    cd "$srcdir/$_mpv"
    meson install -C build --destdir="$pkgdir"

    # License + third-party notices for the combined work (GPL-3.0-or-later,
    # see the repo's README "License" section).
    install -Dm644 "$srcdir/$_repo/COPYING" \
        "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 "$srcdir/$_repo/THIRD-PARTY-NOTICES.md" \
        "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.md"
}

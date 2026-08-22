# Maintainer: Mathieu Grenet <mathieu@mgth.fr>
#
# mpv-omniphony-fel — mpv (pinned master snapshot) built with the ad_orender
# spatial audio decoder (liborender, from the `orender` package) AND Dolby
# Vision Profile 7 FEL playback (enhancement-layer reconstruction).
#
# Why a master snapshot instead of a release: the FEL feature merged into mpv
# master after v0.41.0 (mpv-player/mpv#17932) and needs libplacebo
# PL_API_VER >= 370, which no libplacebo release carries yet (latest is
# v7.360.1). So this package pins a known-good mpv master commit and builds a
# pinned libplacebo master as a versioned soname (libplacebo.so.371 at this
# pin) installed alongside the system libplacebo.so.360 — no file conflict, and the system
# library keeps serving every other consumer. ffmpeg needs the dovi_split BSF
# and the DoVi stream group, both shipped in Arch's ffmpeg >= 9.0.
#
# Once mpv, libplacebo and (already done) ffmpeg cut releases with the FEL
# stack, this package can fold back into a pinned-release recipe like
# `mpv-omniphony`. Install one or the other — both replace stock mpv.

pkgname=mpv-omniphony-fel
_tag=v0.5.2              # mpv-omniphony release tag (patches-master + ad_orender)
_mpvcommit=49418246f30a9c24af31ac184aa24f39755db89a   # mpv master, FEL native (local build verified 2026-08-22)
_plcommit=a7a18af88ff0a17c04840dcb3246047bb6b46df3    # libplacebo master, PL_API_VER 370
pkgver=0.5.2             # $_tag without the 'v'
pkgrel=1
pkgdesc="mpv (master snapshot) with the orender spatial audio decoder and Dolby Vision P7 FEL playback"
arch=('x86_64')
url="https://github.com/mgth/mpv-omniphony"
license=('GPL-3.0-or-later')
# ffmpeg>=2:9.0: dovi_split BSF + DoVi stream group. shaderc/lcms2/libdovi/
# vulkan-icd-loader/xxhash: runtime deps of the bundled libplacebo soname.
#
# The `>=2:9.0` above is a *feature* floor (it says "old ffmpeg lacks dovi_split"),
# not an ABI guard: a `>=` bound is satisfied by every future release, so it cannot
# catch a soname bump. The bare `.so` entries below are the ABI guard — makepkg's
# find_libdepends() rewrites each into `name.so=MAJOR-64` read from the binaries
# built here (e.g. libavcodec.so=63-64), so pacman refuses an ffmpeg upgrade until
# this package is rebuilt rather than letting the installed mpv break. The sibling
# mpv-omniphony hit exactly that: built against ffmpeg 8, ffmpeg 9 landed, pacman
# said nothing, mpv died with "cannot open shared object file: libavcodec.so.62".
#
# Deliberately NO 'libplacebo.so' here, unlike mpv-omniphony. This package ships
# its own /usr/lib/libplacebo.so.371 and mpv links that, not the system .360 —
# a bare 'libplacebo.so' would expand to `libplacebo.so=371-64`, which no package
# provides, making this package uninstallable. Do not copy that entry over from
# the sibling PKGBUILD. The pinned libplacebo is version-locked to this package
# by construction, so it needs no external guard; its own runtime deps
# (libdovi/shaderc/lcms2) do, and are listed.
depends=('orender>=0.5.2' 'ffmpeg>=2:9.0' 'libass' 'luajit' 'libx11' 'mesa'
         'shaderc' 'lcms2' 'libdovi' 'vulkan-icd-loader' 'xxhash'
         'libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
         'libavutil.so' 'libswresample.so' 'libswscale.so'
         'libass.so' 'libdovi.so' 'libshaderc_shared.so' 'liblcms2.so')
optdepends=('harletty-bridge: decode compressed/object-audio formats via the orender bridge plugin')
makedepends=('meson' 'ninja' 'python' 'git')
# Match the repo mpv's epoch (1:) and advertise the bundled libmpv soname,
# like mpv-omniphony does.
provides=("mpv=1:0.41.0" 'libmpv.so=2-64')
conflicts=('mpv' 'mpv-omniphony')
source=("mpv-omniphony-$_tag.tar.gz::https://github.com/mgth/mpv-omniphony/archive/refs/tags/$_tag.tar.gz"
        "mpv-$_mpvcommit.tar.gz::https://github.com/mpv-player/mpv/archive/$_mpvcommit.tar.gz"
        "libplacebo::git+https://code.videolan.org/videolan/libplacebo.git#commit=$_plcommit"
        "glad::git+https://github.com/Dav1dde/glad"
        "jinja::git+https://github.com/pallets/jinja"
        "markupsafe::git+https://github.com/pallets/markupsafe"
        "Vulkan-Headers::git+https://github.com/KhronosGroup/Vulkan-Headers"
        "fast_float::git+https://github.com/fastfloat/fast_float.git")
sha256sums=('88dcb0df8591f6d31a83028b91c73154e6cfa38dc1b031dffad21dd738be5072'
            '11690b2374219252c44a9ae3f14c9a5cb464def4ef0c95fa3762fa51780a5c22'
            'b7e37bb50668ba0d554a26db5ad21013c9dc3f9e84a2f8dd87a25114c73afdf8'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

_repo="mpv-omniphony-${_tag#v}"   # extracted repo tarball (src/, patches-master/)
_mpv="mpv-$_mpvcommit"

prepare() {
    # libplacebo: wire the vendored submodules to the local clones (the
    # superproject pins their commits; the URL override keeps makepkg's
    # no-network-in-build rule intact).
    cd "$srcdir/libplacebo"
    local sub
    for sub in glad jinja markupsafe Vulkan-Headers fast_float; do
        git submodule init "3rdparty/$sub"
        git config "submodule.3rdparty/$sub.url" "$srcdir/$sub"
    done
    git -c protocol.file.allow=always submodule update \
        3rdparty/glad 3rdparty/jinja 3rdparty/markupsafe \
        3rdparty/Vulkan-Headers 3rdparty/fast_float

    # Same libplacebo patch set as the shipped FEL bundle (prefer FP16 over
    # 16-bit UNORM so externally managed color does not clip).
    local p
    for p in "$srcdir/$_repo"/patches-libplacebo/*.patch; do
        echo "applying (libplacebo) ${p##*/}"
        git apply "$p"
    done

    # mpv: patch 0001 adds audio/decode/ad_orender.c; the rest wire it in.
    cd "$srcdir/$_mpv"
    local patches=("$srcdir/$_repo"/patches-master/*.patch)
    for p in "${patches[@]}"; do
        echo "applying ${p##*/}"
        patch -p1 < "$p"
    done
}

build() {
    # 1. libplacebo master into a private prefix (only the versioned soname is
    # packaged). Options mirror the repo's scripts/build-fel-deps.sh.
    meson setup "$srcdir/libplacebo/build" "$srcdir/libplacebo" \
        --prefix="$srcdir/plprefix" --libdir=lib --buildtype=release \
        -Dvulkan=enabled -Dshaderc=enabled -Dlcms=enabled \
        -Ddovi=enabled -Dlibdovi=enabled -Ddemos=false
    meson install -C "$srcdir/libplacebo/build"

    # Hard gate: the FEL reconstruction API landed at PL_API_VER 367 and the
    # bundle requires >= 370 (modversion 7.370).
    PKG_CONFIG_PATH="$srcdir/plprefix/lib/pkgconfig" \
        pkg-config --atleast-version=7.370 libplacebo || {
        echo "built libplacebo lacks the FEL API (need >= 7.370)" >&2
        return 1
    }

    # 2. mpv against the freshly built libplacebo (system everything else).
    # --auto-features=auto: undo arch-meson's blanket `enabled`, which would
    # force platform-foreign features and fail.
    cd "$srcdir/$_mpv"
    PKG_CONFIG_PATH="$srcdir/plprefix/lib/pkgconfig" \
        arch-meson build --auto-features=auto -Dorender=enabled
    meson compile -C build
}

package() {
    cd "$srcdir/$_mpv"
    meson install -C build --destdir="$pkgdir"

    # The pinned libplacebo, by versioned soname only (real file, no dev
    # symlink/headers/pc): coexists with the libplacebo package (.so.360).
    # The soname tracks PL_API_VER (.so.371 at this pin) — resolve it, don't
    # hardcode it.
    local so
    for so in "$srcdir"/plprefix/lib/libplacebo.so.[0-9]*; do
        install -Dm755 "$so" "$pkgdir/usr/lib/${so##*/}"
    done

    # License + third-party notices for the combined work.
    install -Dm644 "$srcdir/$_repo/COPYING" \
        "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 "$srcdir/$_repo/THIRD-PARTY-NOTICES.md" \
        "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.md"
}

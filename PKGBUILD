# Maintainer: mrfrok
#
# Builds the tagged release from source. `makepkg -si` in this directory;
# for the working tree instead, `makepkg -si -p PKGBUILD` after pointing
# `source` at it.
#
# Along with the program it builds libmpv with the VapourSynth filter, from
# mpv's own release and the one patch in packaging/linux/, into
# /usr/lib/anirust — Arch's mpv leaves the filter out, and frame generation
# needs it. Being built here, it always matches the system's ffmpeg and
# libplacebo; rebuild the package when those move to a new soname, as with
# anything else linked against them. On x86_64 the RIFE plugin and its two
# models go into /usr/lib/anirust/rife, and vs-mlrt — the plugins that run
# the networks on NVIDIA's, Intel's and AMD's matrix units, built by the
# release from vs-mlrt's sources, and the networks — into
# /usr/lib/anirust/mlrt; with the vapoursynth package installed, frame
# generation then works. The vendors' runtimes are fetched by the player
# when asked (TensorRT-RTX, OpenVINO) or come from ROCm (MIGraphX).

pkgname=anirust
pkgver=1.1.5
pkgrel=2
_mpv=0.41.0
_nvh=n13.0.19.0
_rife=r9_mod_v33
_riferepo=https://github.com/styler00dollar/VapourSynth-RIFE-ncnn-Vulkan
_rife_asset="$pkgname-$pkgver-rife"
pkgdesc='Desktop client for Anixart with a player of its own'
arch=('x86_64' 'aarch64')
url='https://github.com/mrfrok/AniRust'
license=('GPL-3.0-or-later')
# mpv brings every library the bundled libmpv links: ffmpeg, libplacebo,
# libass and the rest.
depends=('mpv' 'gcc-libs' 'glibc' 'fontconfig' 'freetype2' 'libxkbcommon' 'libxkbcommon-x11'
         'wayland' 'libx11' 'libxcursor' 'libxi' 'libxrandr' 'libglvnd')
optdepends=('xdg-desktop-portal: file chooser for pictures and bookmarks'
            'gnome-keyring: a place for the session token (or any Secret Service)'
            'vapoursynth: frame generation with RIFE'
            'intel-media-driver: hardware decoding on Intel GPUs'
            'intel-compute-runtime: the neural networks on Intel GPUs, through OpenVINO'
            'migraphx: the neural networks on AMD GPUs')
makedepends=('cargo' 'git' 'cmake' 'meson' 'ninja' 'vapoursynth')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "mpv-$_mpv.tar.gz::https://github.com/mpv-player/mpv/archive/refs/tags/v$_mpv.tar.gz"
        "nv-codec-headers-$_nvh.tar.gz::https://github.com/FFmpeg/nv-codec-headers/archive/refs/tags/$_nvh.tar.gz")
source_x86_64=("$_rife_asset-plugin.so::$_riferepo/releases/download/$_rife/librife_linux_x86-64.so"
               "$_rife_asset-v4.6.param::$_riferepo/raw/master/models/rife-v4.6_ensembleFalse/flownet.param"
               "$_rife_asset-v4.6.bin::$_riferepo/raw/master/models/rife-v4.6_ensembleFalse/flownet.bin"
               "$_rife_asset-v4.26.param::$_riferepo/raw/master/models/rife-v4.26_ensembleFalse/flownet.param"
               "$_rife_asset-v4.26.bin::$_riferepo/raw/master/models/rife-v4.26_ensembleFalse/flownet.bin"
               "$_rife_asset-plugin.LICENSE::$_riferepo/raw/master/LICENSE"
               "$_rife_asset-models.LICENSE::https://github.com/hzwer/Practical-RIFE/raw/main/LICENSE"
               "anirust-$pkgver-mlrt.tar.gz::$url/releases/download/v$pkgver/anirust-$pkgver-mlrt-linux-x86_64.tar.gz")

prepare() {
  cd "AniRust-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  # The script finds mpv and the codec headers already unpacked here.
  WORK_DIR="$srcdir" OUT_DIR="$srcdir/libmpv" \
    "$srcdir/AniRust-$pkgver/packaging/linux/build-libmpv.sh"

  cd "AniRust-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # The programs look in /usr/lib/anirust for libmpv before the system's.
  export RUSTFLAGS="${RUSTFLAGS:-} -C link-arg=-Wl,-rpath,/usr/lib/anirust"
  cargo build --frozen --release -p anirust-gui -p anirust-cli
}

check() {
  cd "AniRust-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release -p anirust-api
}

package() {
  install -Dm755 "$srcdir/libmpv/libmpv.so.2" "$pkgdir/usr/lib/anirust/libmpv.so.2"

  if [ "$CARCH" = x86_64 ]; then
    local rife="$pkgdir/usr/lib/anirust/rife"
    install -Dm644 "$srcdir/$_rife_asset-plugin.so" "$rife/librife.so"
    install -Dm644 "$srcdir/$_rife_asset-v4.6.param" "$rife/models/rife-v4.6_ensembleFalse/flownet.param"
    install -Dm644 "$srcdir/$_rife_asset-v4.6.bin" "$rife/models/rife-v4.6_ensembleFalse/flownet.bin"
    install -Dm644 "$srcdir/$_rife_asset-v4.26.param" "$rife/models/rife-v4.26_ensembleFalse/flownet.param"
    install -Dm644 "$srcdir/$_rife_asset-v4.26.bin" "$rife/models/rife-v4.26_ensembleFalse/flownet.bin"
    install -Dm644 "$srcdir/$_rife_asset-plugin.LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-RIFE-plugin"
    install -Dm644 "$srcdir/$_rife_asset-models.LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-RIFE"

    cp -r "$srcdir/mlrt" "$pkgdir/usr/lib/anirust/mlrt"
    chmod -R u=rwX,go=rX "$pkgdir/usr/lib/anirust/mlrt"
    for license in "$srcdir"/mlrt/LICENSE-*; do
      install -Dm644 "$license" "$pkgdir/usr/share/licenses/$pkgname/$(basename "$license")"
    done
  fi

  cd "AniRust-$pkgver"
  install -Dm755 target/release/anirust "$pkgdir/usr/bin/anirust"
  install -Dm755 target/release/anirust-cli "$pkgdir/usr/bin/anirust-cli"
  install -Dm644 packaging/linux/io.github.mrfrok.AniRust.desktop \
    "$pkgdir/usr/share/applications/io.github.mrfrok.AniRust.desktop"
  install -Dm644 packaging/linux/io.github.mrfrok.AniRust.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.github.mrfrok.AniRust.metainfo.xml"
  install -Dm644 packaging/icons/anirust.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.mrfrok.AniRust.svg"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
sha256sums=('7555637854ad504f87c164cf7bddac383146f5aa9d61281d8f4dbfe47a5699cb'
            'ee21092a5ee427353392360929dc64645c54479aefdb5babc5cfbb5fad626209'
            '86d15d1a7c0ac73a0eafdfc57bebfeba7da8264595bf531cf4d8db1c22940116')
sha256sums_x86_64=('18a00a5e3ac90a5dfcfdf85fdb81d977381a5a2560a4c45dbe9a469d007b1886'
                   'ae9b08af43fba97e27aa2c40c04c35b1a75f637b2d2b01a941fa94361ab25cbd'
                   '03393cf14fe6d0af015d24d93bae1e5925f2828cb3b6555300a132643c617aa5'
                   '79f16c28903f93f8308f0c4c947f8c7e0c17d99a57b85473e5f298dd578d137b'
                   '94d58e30b75d7c7609cfa6f3bdad524deddd14f5f75e85c36d2f827ef5c64731'
                   'd37437f9a9276c5b5f966a4a314c8b08128b06d3fa5b7b5716b8db489dc4136a'
                   '7932fb49341512b959b1744a6d9cbb39e5a1ec89da438a34d0454d5d8df9fecd'
                   '84a5b167d4fd835d03548bedb323de906a225b570b9eb1f38e886c333ed0f3c8')

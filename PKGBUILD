# Maintainer: Ingmar Steen <iksteen at gmail dot com>
#
# The whole GStreamer stack with Kahawai's patches applied, in /opt where
# nothing else on the box can see it — the Arch counterpart of the builder in
# Kahawai's Dockerfile and of HomebrewFormula/kahawai-gstreamer.rb. The
# patches, their reports and reproducers: https://github.com/iksteen/kahawai/tree/master/patches
#
# WHY A WHOLE GSTREAMER: patches/gstreamer/0004 changes the size of a public
# struct in codecparsers, so every binary holding one must be built against
# the same header, and nothing built against Arch's headers may be loaded
# beside it. One tree, one version, one ABI.
#
# WHY IT CANNOT LEAK, in either direction:
#   - Nothing but a license file goes in /usr, and nothing in
#     /etc/ld.so.conf.d or the linker cache. Every ELF
#     here carries a DT_RPATH relative to itself ($ORIGIN), and kahawai an
#     absolute one, so they find these libraries and nothing else does.
#     DT_RPATH, not DT_RUNPATH: the loader searches RPATH before
#     LD_LIBRARY_PATH, so an exported path cannot swap a library in.
#   - kahawai-isolate.patch: GST_PLUGIN_PATH, GST_PLUGIN_SYSTEM_PATH,
#     GST_REGISTRY and GST_PLUGIN_SCANNER are ignored (KAHAWAI_GST_*
#     replace them), the per-user plugin directory is not scanned, and the
#     registry cache is its own file. Forgetting to set a variable is the
#     safe default instead of a disaster.
#
# The patches come from the kahawai release named by _kahawai, not from
# copies beside this file, so the recipe and the patch set cannot come from
# different versions. Bump pkgrel when only _kahawai changes.

pkgname=kahawai-gstreamer
pkgver=1.28.7
pkgrel=2
_kahawai=0.0.21-rc.2
_prefix=/opt/kahawai-gstreamer
pkgdesc="GStreamer with Kahawai's patches, isolated in /opt/kahawai-gstreamer"
arch=(x86_64 aarch64)
url="https://github.com/iksteen/kahawai"
# GStreamer (with -Dgpl), and the gst-plugins-rs crates: isobmff and hlssink3
# are MPL-2.0, dav1d is MIT OR Apache-2.0.
license=(LGPL-2.1-or-later GPL-2.0-or-later MPL-2.0 'MIT OR Apache-2.0')
# Arch's own gstreamer makedepends, less what this build turns off — Qt, GTK,
# WPE, OpenCV, ONNX, GES, gst-python, devtools and the docs toolchain — and
# less what depends already brings. With auto_features=enabled (see build())
# these two lists ARE the plugin set: a missing one fails configure instead
# of silently dropping a plugin.
makedepends=(
  bluez-libs git glib2-devel gobject-introspection iso-codes jack ladspa
  libcap libsoup3 libxrandr lv2 meson nasm patchelf python rust sdl2 shaderc
  systemd-libs vulkan-headers wayland-protocols
)
# The patch reproducers drive pipelines through PyGObject and build their
# fixtures with ffmpeg.
checkdepends=(python-gobject ffmpeg)
optdepends=(
  'intel-media-driver: VA-API / Quick Sync on Intel Gen8+'
  'libva-intel-driver: VA-API on older Intel'
  'nvidia-utils: NVENC / NVDEC'
)
# Derived, not maintained: check() fails when this stops matching what the
# build links. See _runtime_depends.
depends=(
  a52dec aalib alsa-lib aom bzip2 cairo cdparanoia chromaprint curl dav1d
  faac faad2 ffmpeg flac fluidsynth gdk-pixbuf2 glib2 glibc graphene gsm
  imath json-glib lame lcms2 libass libavc1394 libavtp libbs2b libcaca
  libcdio libdc1394 libdca libde265 libdrm libdv libdvdnav libdvdread libelf
  libfdk-aac libfreeaptx libgcc libglvnd libgme libgudev libiec61883
  libjpeg-turbo liblc3 libldac liblrdf libltc libmicrodns libmodplug
  libmpcdec libmpeg2 libnice libogg libopenmpt libpng libpulse libraw1394
  librsvg libshout libsndfile libsrtp libstdc++ libtheora libunwind libusb
  libva libvorbis libvpx libwebp libx11 libxcb libxdamage libxext
  libxfixes libxi libxkbcommon libxkbcommon-x11 libxml2 libxtst libxv lilv
  mesa mjpegtools mpg123 neon nettle openal opencore-amr openexr openh264
  openjpeg2 openssl opus orc pango qrencode rtmpdump sbc soundtouch spandsp
  speex srt svt-av1 taglib twolame v4l-utils vmaf vulkan-icd-loader
  wavpack wayland webrtc-audio-processing-1 wildmidi x264 x265 zbar zlib zvbi
  zxing-cpp
)
depends_x86_64=(libvpl svt-hevc)
options=(!emptydirs)
source=(
  "https://gitlab.freedesktop.org/gstreamer/gstreamer/-/archive/$pkgver/gstreamer-$pkgver.tar.bz2"
  "https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs/-/archive/gstreamer-$pkgver/gst-plugins-rs-gstreamer-$pkgver.tar.bz2"
  "https://github.com/iksteen/kahawai/releases/download/v$_kahawai/kahawai-$_kahawai-source.tar.gz"
  kahawai-isolate.patch
  # Arch's: faac 2.x dropped the faacEnc* API. From
  # https://gitlab.archlinux.org/archlinux/packaging/packages/gstreamer
  arch-faac-2.0.patch
)
sha256sums=('4aabbbf88837a592d425c592c852c577359df65f62c2f58d57db7695d6ebbaa8'
            'd5acc3e2cd92f09ccfefa357905758274b205ce9b3521ab1d88dbb4072a25f21'
            '664f0aa523f673da1944773a49728be70ca5b95dcebe5f7364cffb3b002daf1c'
            'ae3fa961395406d8309f7d493a28c084e6350e639b009203d8bee59ef02f2086'
            'a7ca7bc1b9d22296991f993d45a10b0789cb26ed0809a4f9c32c80f044fc83b8')

die() { error "$*"; exit 1; }

prepare() {
  # Each tree gets a repository of its own. `git apply` run inside some
  # other repository — this PKGBUILD's own, for one — applies paths
  # relative to THAT one's root and skips the rest without a word.
  local p
  cd "$srcdir/gstreamer-$pkgver"
  git init -q
  # A patch that stops applying must FAIL the build, as in kahawai's Dockerfile:
  # skipping it ships a GStreamer that looks right and is missing a fix.
  for p in "$srcdir/kahawai-$_kahawai"/patches/gstreamer/*.patch \
           "$srcdir"/arch-faac-2.0.patch "$srcdir"/kahawai-isolate.patch; do
    echo "  -> applying ${p##*/}"
    git apply "$p" || die "FAILED to apply ${p##*/}"
  done

  # The gst-plugins-rs patches are classified, not assumed — some are
  # already in the tag — by the same function the dev box uses.
  cd "$srcdir/gst-plugins-rs-gstreamer-$pkgver"
  git init -q
  . "$srcdir/kahawai-$_kahawai/scripts/kahawai-gst-rs.sh"
  [[ $RS_TAG = "gstreamer-$pkgver" ]] ||
    die "kahawai $_kahawai builds hlssink3 from $RS_TAG, this package from gstreamer-$pkgver"
  apply_rs_patches "$PWD" "$srcdir/kahawai-$_kahawai/patches/gst-plugins-rs"
}

build() {
  local stage="$srcdir/stage"
  # Intel's oneVPL and SVT-HEVC exist for x86_64 only.
  local x86=disabled
  [[ $CARCH = x86_64 ]] && x86=enabled

  # Every plugin is built, as in kahawai's Dockerfile, because what will be
  # asked to play is not knowable from here. auto_features=enabled, as in
  # Arch's own gstreamer, makes that "every plugin makedepends provides for"
  # rather than "every plugin this builder happened to have libraries for",
  # so the result, and depends, are the same on every machine. The
  # disables below are Arch's own, plus the GUI stacks. The plugins kahawai
  # cannot work without are named anyway, so dropping one by mistake fails
  # loudly.
  meson setup build "gstreamer-$pkgver" \
    --prefix="$_prefix" --libdir=lib --libexecdir=lib \
    --buildtype=plain --wrap-mode=nodownload -D b_pie=true \
    --auto-features=enabled \
    -D gpl=enabled \
    -D package-name="Kahawai GStreamer $pkgver-$pkgrel (kahawai $_kahawai)" \
    -D package-origin="$url" \
    -D orc-source=system \
    -D benchmarks=disabled -D examples=disabled -D tests=disabled \
    -D doc=disabled -D nls=disabled -D glib_debug=disabled \
    -D devtools=disabled -D ges=disabled -D rtsp_server=disabled \
    -D python=disabled -D sharp=disabled -D rs=disabled \
    -D gst-examples=disabled -D libnice=disabled \
    -D qt5=disabled -D qt6=disabled \
    -D gstreamer:ptp-helper=disabled \
    -D gstreamer:bash-completion=disabled \
    -D gstreamer:dbghelp=disabled \
    -D gst-plugins-base:libvisual=disabled \
    -D gst-plugins-base:tremor=disabled \
    -D gst-plugins-good:gtk3=disabled \
    -D gst-plugins-bad:gtk3=disabled \
    -D gst-plugins-good:rpicamsrc=disabled \
    -D gst-plugins-ugly:sidplay=disabled \
    -D gst-plugins-bad:aja=disabled \
    -D gst-plugins-bad:amfcodec=disabled \
    -D gst-plugins-bad:androidmedia=disabled \
    -D gst-plugins-bad:cuda-nvmm=disabled \
    -D gst-plugins-bad:directfb=disabled \
    -D gst-plugins-bad:directshow=disabled \
    -D gst-plugins-bad:flite=disabled \
    -D gst-plugins-bad:gs=disabled \
    -D gst-plugins-bad:iqa=disabled \
    -D gst-plugins-bad:isac=disabled \
    -D gst-plugins-bad:lcevcdecoder=disabled \
    -D gst-plugins-bad:lcevcencoder=disabled \
    -D gst-plugins-bad:magicleap=disabled \
    -D gst-plugins-bad:mfx_api=oneVPL \
    -D gst-plugins-bad:mpeghdec=disabled \
    -D gst-plugins-bad:nvcomp=disabled \
    -D gst-plugins-bad:nvdswrapper=disabled \
    -D gst-plugins-bad:onnx=disabled \
    -D gst-plugins-bad:opencv=disabled \
    -D gst-plugins-bad:openni2=disabled \
    -D gst-plugins-bad:opensles=disabled \
    -D gst-plugins-bad:qt6d3d11=disabled \
    -D gst-plugins-bad:svtjpegxs=disabled \
    -D gst-plugins-bad:tflite=disabled \
    -D gst-plugins-bad:tinyalsa=disabled \
    -D gst-plugins-bad:voaacenc=disabled \
    -D gst-plugins-bad:voamrwbenc=disabled \
    -D gst-plugins-bad:wasapi2=disabled \
    -D gst-plugins-bad:wasapi=disabled \
    -D gst-plugins-bad:wpe=disabled \
    -D gst-plugins-bad:wpe2=disabled \
    -D gst-plugins-bad:svthevcenc=$x86 \
    -D gst-plugins-bad:msdk=$x86 \
    -D introspection=enabled \
    -D gst-plugins-good:avi=enabled -D gst-plugins-good:matroska=enabled \
    -D gst-plugins-good:isomp4=enabled -D gst-plugins-good:flac=enabled \
    -D gst-plugins-good:audioparsers=enabled \
    -D gst-plugins-bad:hls=enabled \
    -D gst-plugins-bad:videoparsers=enabled \
    -D gst-plugins-bad:codectimestamper=enabled \
    -D gst-plugins-bad:mpegtsdemux=enabled -D gst-plugins-bad:mpegtsmux=enabled \
    -D gst-plugins-bad:assrender=enabled -D gst-plugins-bad:nvcodec=enabled \
    -D gst-plugins-bad:va=enabled -D gst-plugins-bad:qsv=$x86 \
    -D gst-plugins-bad:v4l2codecs=enabled \
    -D gst-plugins-ugly:x264=enabled -D gst-plugins-ugly:a52dec=enabled \
    -D gst-plugins-ugly:mpeg2dec=enabled -D gst-plugins-ugly:dvdread=enabled \
    -D libav=enabled
  meson compile -C build
  rm -rf "$stage"
  meson install -C build --destdir "$stage" --no-rebuild

  # Three plugins out of gst-plugins-rs, as in kahawai's Dockerfile: isobmff
  # (the CMAF muxer), hlssink3 (the HLS sink) and dav1d (AV1 decoding,
  # first in kahawai's ladder). They must link the GStreamer staged above,
  # so pkg-config reads its .pc files with the prefix pointed at the stage.
  local pc="$srcdir/pkgconfig" f
  rm -rf "$pc"; mkdir -p "$pc"
  for f in "$stage$_prefix"/lib/pkgconfig/*.pc; do
    sed "s|^prefix=.*|prefix=$stage$_prefix|" "$f" > "$pc/${f##*/}"
  done
  (
    cd "$srcdir/gst-plugins-rs-gstreamer-$pkgver"
    export PKG_CONFIG_PATH="$pc" CARGO_TARGET_DIR="$srcdir/rs-target"
    cargo build --locked --release \
      -p gst-plugin-isobmff -p gst-plugin-hlssink3 -p gst-plugin-dav1d
  )
  for f in isobmff hlssink3 dav1d; do
    install -Dm755 "$srcdir/rs-target/release/libgst$f.so" \
      "$stage$_prefix/lib/gstreamer-1.0/libgst$f.so"
  done

  # Every ELF gets a DT_RPATH to the library directory, relative to where
  # it sits, so the staged tree under check() and the installed tree in
  # /opt each resolve to themselves. --force-rpath writes DT_RPATH rather
  # than DT_RUNPATH; see the top of this file.
  local elf rel
  while IFS= read -r -d '' elf; do
    [[ $(head -c4 "$elf" | od -An -c | tr -d ' ') = 177ELF ]] || continue
    rel=$(realpath --relative-to="$(dirname "$elf")" "$stage$_prefix/lib")
    [[ $rel = . ]] && rel=
    patchelf --remove-rpath "$elf"
    patchelf --force-rpath --set-rpath "\$ORIGIN${rel:+/$rel}" "$elf"
  done < <(find "$stage$_prefix" -type f \( -name '*.so*' -o -perm -u+x \) -print0)
}

# The packages owning every shared object outside this tree that something
# in it links directly (DT_NEEDED, not ldd's transitive closure) — how
# kahawai's Dockerfile derives its runtime packages. A plugin gained or lost upstream
# changes this set; check() fails until depends matches it, rather than
# shipping a list that quietly went stale.
_runtime_depends() {
  local elf needed libs=() resolved
  while IFS= read -r -d '' elf; do
    [[ $(head -c4 "$elf" | od -An -c | tr -d ' ') = 177ELF ]] || continue
    resolved=$(ldd "$elf" 2>/dev/null)
    for needed in $(readelf -d "$elf" | sed -n 's/.*(NEEDED).*\[\(.*\)\]/\1/p'); do
      libs+=($(awk -v n="$needed" -v s="$srcdir/" \
                 '$1 == n && index($3, s) != 1 {print $3}' <<<"$resolved"))
    done
  done < <(find "$srcdir/stage$_prefix" -type f \( -name '*.so*' -o -perm -u+x \) -print0)
  (( ${#libs[@]} )) || die "found no external libraries at all"
  printf '%s\n' "${libs[@]}" | sort -u | xargs pacman -Qqo | sort -u
}

check() {
  local stage="$srcdir/stage$_prefix" elf bad=0

  local derived declared
  derived=$(_runtime_depends) || die "could not derive runtime dependencies"
  local arch_depends="depends_$CARCH[@]"
  declared=$(printf '%s\n' "${depends[@]}" "${!arch_depends}" | sort -u)
  if [[ $derived != "$declared" ]]; then
    diff <(echo "$declared") <(echo "$derived") | sed -n 's/^[<>]/  &/p' >&2
    echo "derived set, for depends=():" >&2
    echo "$derived" | xargs echo >&2
    die "depends does not match what the build links (< declared, > derived)"
  fi

  # The isolation, checked rather than trusted: DT_RPATH everywhere and no
  # DT_RUNPATH anywhere.
  while IFS= read -r -d '' elf; do
    [[ $(head -c4 "$elf" | od -An -c | tr -d ' ') = 177ELF ]] || continue
    if readelf -d "$elf" | grep -q '(RUNPATH)' || ! readelf -d "$elf" | grep -q '(RPATH)'; then
      echo "not DT_RPATH-only: $elf" >&2
      bad=1
    fi
  done < <(find "$stage" -type f \( -name '*.so*' -o -perm -u+x \) -print0)
  (( ! bad )) || die "ELF files without a DT_RPATH"

  # Every patch's reproducer, against the staged tree. libgstreamer finds its
  # plugins and scanner beside itself; the other variables point PyGObject
  # (which loads libgstreamer by soname) and the reproducers' gst-launch at it.
  local registry="$srcdir/check-registry"
  rm -rf "$registry"; mkdir -p "$registry"
  export KAHAWAI_GST_REGISTRY="$registry/registry.bin"
  export PATH="$stage/bin:$PATH"
  export LD_LIBRARY_PATH="$stage/lib"
  export GI_TYPELIB_PATH="$stage/lib/girepository-1.0"
  export PKG_CONFIG_PATH="$srcdir/pkgconfig"
  export XDG_RUNTIME_DIR="$srcdir/check-runtime"
  mkdir -p -m 700 "$XDG_RUNTIME_DIR"

  # Nothing from Arch's GStreamer may answer for this one.
  [[ $(gst-inspect-1.0 --version | sed -n 's/.*version //p' | head -1) = "$pkgver" ]] ||
    die "gst-inspect-1.0 is not the staged one"
  local where
  where=$(gst-inspect-1.0 avidemux | sed -n 's/^ *Filename *//p')
  [[ $where = "$stage/lib/gstreamer-1.0/"* ]] ||
    die "avidemux loads from $where, not the staged tree"

  "$srcdir/kahawai-$_kahawai/scripts/kahawai-gst-plugins.sh" verify \
    --library-dir "$stage/lib" --plugin-dir "$stage/lib/gstreamer-1.0" --exclusive
}

package() {
  cp -a "$srcdir/stage/." "$pkgdir/"

  # gdb's pretty-printers, installed to an auto-load path under /opt that
  # gdb never reads, and the plugin-docs cache generator: neither is of use
  # here, and both would make python an undeclared dependency.
  rm -r "$pkgdir$_prefix/share/gdb" "$pkgdir$_prefix/share/gstreamer-1.0/gdb"
  rm "$pkgdir$_prefix/lib/gstreamer-1.0/gst-plugins-doc-cache-generator"
  # Manual pages under /opt are on nobody's MANPATH.
  rm -r "$pkgdir$_prefix/share/man"

  install -Dm644 "$srcdir/gst-plugins-rs-gstreamer-$pkgver/LICENSE-MIT" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}

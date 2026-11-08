# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgbase=sdrmm
pkgname=(sdrmm sdrmm-app)
pkgver=2.4.3
pkgrel=2
pkgdesc="Modular, client-server software-defined radio receiver"
arch=('x86_64' 'aarch64')
url="https://sdrmm.com"
license=('AGPL-3.0-or-later')
# rust: 1.99 per rust-toolchain.toml; clang/libclang: bindgen for ffmpeg-sys and webkit;
# nasm: FFmpeg's x86 kernels; cmake: fdk-aac and opusic-sys (vendored libopus);
# python: scripts/build-media.py; the GTK stack is for the Tauri desktop app only.
makedepends=('rust' 'clang' 'cmake' 'nasm' 'pkgconf' 'python'
             'cairo' 'gdk-pixbuf2' 'gtk3' 'librsvg' 'libsoup3' 'pango' 'webkit2gtk-4.1')
# namcap reports "Dependency ffmpeg detected and not included" for the media libraries in
# /usr/lib/sdrmm: they carry the upstream FFmpeg sonames and are resolved through the binary's
# DT_RPATH, so nothing needs the system ffmpeg. The same goes for the "lacks FULL RELRO" and
# "may not be needed ('gcc-libs')" warnings.
#
# aws-lc-sys (rustls' provider, through the server's TLS and reqwest) builds a C archive, and
# GCC -flto=auto from makepkg's lto option puts GCC bytecode in it, which rust-lld cannot read:
# the link then fails with undefined aws_lc_* symbols. Rustc's own thin LTO is unaffected.
options=('!lto')
_ffmpegver=9.0.2
_fdkver=2.0.3
# Packaged releases leave out cr8 (see upstream docs/src/development/building.md).
_features="soapy,sdrplay,rtlsdr,hackrf,airspy,airspyhf,funcube,espsdr,ad936x,net-client,gpu-fft"
case "$CARCH" in
    x86_64)  _target="x86_64-unknown-linux-gnu" ;;
    aarch64) _target="aarch64-unknown-linux-gnu" ;;
esac

# Upstream's -src tarball is the git tree plus the built web interface, which the server
# embeds, so nodejs/pnpm are not build dependencies here.
#
# ffmpeg.org drops connections often enough to make the lilac runs fail, and the tarball is
# only ever checked against the checksum below, so the file comes from the Fossies release
# mirror, which serves the same bytes (sha256 8c3850283eb25fa026482078a04051e0be17347b09ef81a0849bec15a96e002e).
source=("$pkgbase-$pkgver-src.tar.gz::https://github.com/Newspicel/sdrmm/releases/download/v$pkgver/$pkgbase-$pkgver-src.tar.gz"
        "ffmpeg-$_ffmpegver.tar.xz::https://fossies.org/linux/misc/ffmpeg-$_ffmpegver.tar.xz"
        "fdk-aac-$_fdkver.tar.gz::https://github.com/mstorsjo/fdk-aac/archive/refs/tags/v$_fdkver.tar.gz"
        'sdrmm.service')
sha256sums=('393c0ca6659a89812b992547406994bbb2b3caed48113de389e4b42344737c03'
            '8c3850283eb25fa026482078a04051e0be17347b09ef81a0849bec15a96e002e'
            'e25671cd96b10bad896aa42ab91a695a9e573395262baed4e4a2ff178d6a3a78'
            'e98577de4b5d4112fd2de527c73467efe6733b3dbca8f3195df239897b4070ae')

prepare() {
    cd "$pkgbase-$pkgver-src"

    # scripts/build-media.py builds the minimal FFmpeg (9.0.2) plus fdk-aac (2.0.3, xHE-AAC)
    # that SDRmm links privately, exactly as upstream's own .deb/.rpm/AppImage do: no system
    # FFmpeg, no conflict, and fdk-aac cannot be bolted onto a system FFmpeg afterwards
    # because libavcodec has to be configured with it. The script downloads both tarballs;
    # they come from source=() instead, and fdk-aac is picked up from .media-build/<target>/
    # when it is already there.
    mkdir -p ".media-build/$_target"
    cp "$srcdir/fdk-aac-$_fdkver.tar.gz" ".media-build/$_target/"
    python3 scripts/build-media.py --target "$_target" \
        --archive "$srcdir/ffmpeg-$_ffmpegver.tar.xz" --prefix "$srcdir/media"

    # The server crate embeds web/dist and only warns when it is missing, which would ship a
    # placeholder page. Fail here instead.
    test -f web/dist/index.html

    # Network: crates.io. There is no vendored crate tree upstream, and the lockfile is
    # complete, so fetch now and build --offline below.
    cargo fetch --locked
}

build() {
    cd "$pkgbase-$pkgver-src"
    # FFMPEG_DIR is what links the private media libraries and, through apps/bundled_rpath.rs,
    # gives both binaries the DT_RPATH they need to find them under /usr/lib/{sdrmm,sdrmm-app}.
    export FFMPEG_DIR="$srcdir/media"
    export LD_LIBRARY_PATH="$srcdir/media/lib"
    local flags=(--release --locked --offline --no-default-features --features "$_features")
    cargo build "${flags[@]}" -p sdrmm
    # SDRMM_RELEASE deliberately unset: it is upstream's release-tag marker, and with it set the
    # desktop app replaces itself through its own updater. A packaged build must be updated by
    # pacman instead.
    cargo build "${flags[@]}" -p sdrmm-desktop
}

check() {
    cd "$pkgbase-$pkgver-src"
    # The media libraries must resolve through the binary's own RPATH, from the directory this
    # package installs, and not from anything else on the build host.
    local tree; tree=$(mktemp -d)
    install -Dm755 target/release/sdrmm "$tree/usr/bin/sdrmm"
    install -d "$tree/usr/lib/sdrmm"
    cp -a "$srcdir/media/lib/"*.so* "$tree/usr/lib/sdrmm/"
    local resolved missing
    resolved=$(ldd "$tree/usr/bin/sdrmm" | grep -E 'lib(avcodec|avformat|swresample|swscale)\.so')
    missing=$(ldd "$tree/usr/bin/sdrmm" | grep 'not found' || true)
    rm -rf "$tree"
    if [[ -n $missing ]]; then
        printf '%s\n' "unresolved shared libraries:" "$missing" >&2
        return 1
    fi
    if ! grep -q "lib/sdrmm/libavcodec" <<< "$resolved"; then
        printf '%s\n' "the media libraries did not resolve from /usr/lib/sdrmm:" "$resolved" >&2
        return 1
    fi
}

package_sdrmm() {
    pkgdesc="Modular, client-server software-defined radio receiver (headless server)"
    depends=('gcc-libs' 'glibc')
    optdepends=('soapysdr: radios through SoapySDR modules'
                'libsdrplay: SDRplay radios (SDRplay API, dlopened)'
                'vulkan-icd-loader: GPU FFT (dlopened)')
    conflicts=('sdrmm-bin')

    cd "$pkgbase-$pkgver-src"
    install -Dm755 target/release/sdrmm "$pkgdir/usr/bin/sdrmm"
    install -d "$pkgdir/usr/lib/sdrmm"
    cp -a "$srcdir/media/lib/"*.so* "$pkgdir/usr/lib/sdrmm/"
    install -Dm644 "$srcdir/sdrmm.service" -t "$pkgdir/usr/lib/systemd/user/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/sdrmm/"
    install -Dm644 LICENSE THIRD_PARTY_NOTICES.md -t "$pkgdir/usr/share/licenses/sdrmm/"
}

package_sdrmm-app() {
    pkgdesc="Modular, client-server software-defined radio receiver (desktop app)"
    depends=('cairo' 'dbus' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libsoup3' 'webkit2gtk-4.1')
    optdepends=('soapysdr: radios through SoapySDR modules'
                'libsdrplay: SDRplay radios (SDRplay API, dlopened)'
                'vulkan-icd-loader: GPU FFT (dlopened)')
    conflicts=('sdrmm-app-bin' 'sdrminusminus')

    cd "$pkgbase-$pkgver-src"
    install -Dm755 target/release/sdrmm-desktop "$pkgdir/usr/bin/sdrmm-app"
    install -d "$pkgdir/usr/lib/sdrmm-app"
    cp -a "$srcdir/media/lib/"*.so* "$pkgdir/usr/lib/sdrmm-app/"
    install -Dm644 apps/desktop/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/dev.newspicel.sdrmm.png"
    install -Dm644 apps/desktop/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/dev.newspicel.sdrmm.png"
    install -d "$pkgdir/usr/share/applications"
    sed -e 's|{{exec}}|sdrmm-app|g' -e 's|{{icon}}|dev.newspicel.sdrmm|g' \
        packaging/linux/sdrmm-app.desktop > "$pkgdir/usr/share/applications/sdrmm-app.desktop"
    install -Dm644 LICENSE THIRD_PARTY_NOTICES.md -t "$pkgdir/usr/share/licenses/sdrmm-app/"
}

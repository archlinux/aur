# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgbase=sdrmm
pkgname=(sdrmm sdrmm-app)
pkgver=2.5.1
pkgrel=1
pkgdesc="Modular, client-server software-defined radio receiver"
arch=('x86_64' 'aarch64')
url="https://sdrmm.com"
license=('AGPL-3.0-or-later')
# rust: 1.99 per rust-toolchain.toml; clang/libclang: bindgen for ffmpeg-sys;
# nasm: FFmpeg's x86 kernels; cmake+ninja: fdk-aac, opusic-sys (vendored libopus) and
# cef-dll-sys's libcef_dll_wrapper (its cmake generator is Ninja); python:
# scripts/build-media.py. The GTK/WebKit stack that 2.4.3 needed for Tauri is gone in
# 2.4.4 (the desktop app is CEF now, Cargo.lock has no tauri/gtk/webkit2gtk crate).
makedepends=('rust' 'clang' 'cmake' 'ninja' 'nasm' 'pkgconf' 'python')
# check() runs ldd on the desktop binary, whose vendored libcef.so links the system Chromium
# runtime (see package_sdrmm-app). makepkg --syncdeps only installs the global depends and
# makedepends/checkdepends, never the per-package depends of a split package, so without this
# the check runs on a chroot that has none of those libraries.
checkdepends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2'
              'libcups' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext'
              'libxfixes' 'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango'
              'systemd-libs')
# The private media libraries ship once, in sdrmm, and sdrmm-app depends on it: both binaries
# carry $ORIGIN/../lib/sdrmm in their DT_RPATH, so one directory serves both and the desktop
# package does not duplicate 11 MB of FFmpeg.
#
# namcap reports "Dependency ffmpeg detected and not included" for those libraries: they carry
# the upstream FFmpeg sonames and are resolved through DT_RPATH, so nothing needs the system
# ffmpeg. The same goes for the "lacks FULL RELRO" and "may not be needed ('gcc-libs')" warnings.
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
sha256sums=('3ef1e14488d184e8341efc0cba28e723c661b4b49d89a93da964f51c0c1a9fd5'
            '8c3850283eb25fa026482078a04051e0be17347b09ef81a0849bec15a96e002e'
            'e25671cd96b10bad896aa42ab91a695a9e573395262baed4e4a2ff178d6a3a78'
            'e98577de4b5d4112fd2de527c73467efe6733b3dbca8f3195df239897b4070ae')

# cef-dll-sys copies the fetched CEF runtime (libcef.so, *.pak, icudtl.dat, locales/) into what
# it takes to be the target directory: its build script walks three levels up from OUT_DIR,
# which under cargo's current layout (build/<pkg>/<hash>/out) resolves to target/release/build
# instead of target/release (the crate still assumes the older build/<pkg>-<hash>/out). Probe
# both, keyed on the icudtl.dat marker that apps/desktop/src/paths.rs itself uses.
cef_runtime_dir() {
    local cand
    for cand in target/release target/release/build; do
        if [[ -f $cand/icudtl.dat ]]; then
            printf '%s\n' "$cand"
            return 0
        fi
    done
    return 1
}

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
    # Both binaries must resolve the media libraries through their own DT_RPATH, out of the one
    # directory the sdrmm package installs, and not from anything else on the build host.
    local tree; tree=$(mktemp -d)
    local bin
    for bin in sdrmm sdrmm-desktop; do
        install -Dm755 "target/release/$bin" "$tree/usr/bin/$bin"
    done
    install -d "$tree/usr/lib/sdrmm"
    cp -a "$srcdir/media/lib/"*.so* "$tree/usr/lib/sdrmm/"
    # The desktop app also links vendored Chromium: cef-dll-sys copies the whole CEF runtime
    # next to the "main binary", but the directory it computes is OUT_DIR/../../.. and under
    # cargo's current layout (build/<pkg>/<hash>/out) that is target/release/build, not
    # target/release — the crate still assumes the older build/<pkg>-<hash>/out. Probe both,
    # keyed on the icudtl.dat marker the app itself looks for, and stage it exactly like
    # package_sdrmm-app installs it, or ldd cannot resolve libcef.so out of
    # /usr/lib/sdrmm-app (DT_RPATH $ORIGIN/../lib/sdrmm-app). The file filter mirrors
    # upstream's xtask/release/src/desktop/stage.rs is_runtime(): *.pak/*.dat/*.bin,
    # *.json (vk_swiftshader_icd.json), CREDITS.html and the .so files, but neither
    # archive.json (bookkeeping) nor chrome-sandbox (upstream excludes it too).
    local cef; cef=$(cef_runtime_dir) || {
        echo 'sdrmm: the CEF runtime (icudtl.dat) is not under target/release[-/build]' >&2
        rm -rf "$tree"
        return 1
    }
    install -d "$tree/usr/lib/sdrmm-app"
    cp -a "$cef/locales" "$tree/usr/lib/sdrmm-app/"
    local cef_path cef_name
    for cef_path in "$cef"/*; do
        cef_name=${cef_path##*/}
        [[ -f $cef_path ]] || continue
        case $cef_name in
            archive.json) continue ;; # cef-dll-sys bookkeeping, not a runtime file
            *.pak|*.dat|*.bin|*.json|CREDITS.html|*.so|*.so.*)
                cp -a "$cef_path" "$tree/usr/lib/sdrmm-app/" ;;
        esac
    done
    install -Dm755 target/release/sdrmm-desktop-helper "$tree/usr/lib/sdrmm-app/sdrmm-desktop-helper"
    local resolved missing resolved_cef
    for bin in sdrmm sdrmm-desktop; do
        resolved=$(ldd "$tree/usr/bin/$bin" | grep -E 'lib(avcodec|avformat|swresample|swscale)\.so')
        missing=$(ldd "$tree/usr/bin/$bin" | grep 'not found' || true)
        if [[ -n $missing ]]; then
            printf '%s\n' "unresolved shared libraries in $bin:" "$missing" >&2
            rm -rf "$tree"
            return 1
        fi
        if ! grep -q "lib/sdrmm/libavcodec" <<< "$resolved"; then
            printf '%s\n' "the media libraries of $bin did not resolve from /usr/lib/sdrmm:" "$resolved" >&2
            rm -rf "$tree"
            return 1
        fi
        if [[ $bin == sdrmm-desktop ]]; then
            resolved_cef=$(ldd "$tree/usr/bin/$bin" | grep 'libcef\.so' || true)
            if ! grep -q "lib/sdrmm-app/libcef" <<< "$resolved_cef"; then
                printf '%s\n' "libcef of $bin did not resolve from /usr/lib/sdrmm-app:" "$resolved_cef" >&2
                rm -rf "$tree"
                return 1
            fi
        fi
    done
    rm -rf "$tree"
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
    # libcef.so is vendored but links the system Chromium runtime deps (readelf -d on CEF
    # 156.0.26): nss/nspr, at-spi2-core, libcups, the X libraries, libgbm, libxkbcommon,
    # libudev (systemd-libs), alsa-lib and expat. They must be declared, or the app fails
    # at start-up and check()'s ldd assertion trips on a headless build host.
    depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2' 'glibc'
             'libcups' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes'
             'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango' 'sdrmm' 'systemd-libs')
    optdepends=('soapysdr: radios through SoapySDR modules'
                'libsdrplay: SDRplay radios (SDRplay API, dlopened)'
                'vulkan-icd-loader: GPU FFT (dlopened)')
    conflicts=('sdrmm-app-bin' 'sdrminusminus')

    cd "$pkgbase-$pkgver-src"
    install -Dm755 target/release/sdrmm-desktop "$pkgdir/usr/bin/sdrmm-app"
    install -Dm644 apps/desktop/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/dev.newspicel.sdrmm.png"
    install -Dm644 apps/desktop/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/dev.newspicel.sdrmm.png"
    install -d "$pkgdir/usr/share/applications"
    sed -e 's|{{exec}}|sdrmm-app|g' -e 's|{{icon}}|dev.newspicel.sdrmm|g' \
        packaging/linux/sdrmm-app.desktop > "$pkgdir/usr/share/applications/sdrmm-app.desktop"
    # Vendored Chromium runtime: cef-dll-sys downloads CEF at build time and copies the runtime
    # files into the directory it computes for the main binary (with cargo's current layout that
    # is target/release/build, see cef_runtime_dir). The desktop binary locates them through
    # DT_RPATH $ORIGIN/../lib/sdrmm-app — upstream's build.rs and src/paths.rs explicitly expect
    # Linux packages to install the runtime there (found by the icudtl.dat marker, with locales/
    # and the subprocess helper inside), the same set its own staging
    # (xtask/release/src/desktop/stage.rs) ships. Without this the app fails to start:
    # libcef.so => not found.
    local cef; cef=$(cef_runtime_dir) || {
        echo 'sdrmm: the CEF runtime (icudtl.dat) is not under target/release[-/build]' >&2
        return 1
    }
    install -d "$pkgdir/usr/lib/sdrmm-app"
    cp -a "$cef/locales" "$pkgdir/usr/lib/sdrmm-app/"
    local cef_path cef_name
    for cef_path in "$cef"/*; do
        cef_name=${cef_path##*/}
        [[ -f $cef_path ]] || continue
        case $cef_name in
            archive.json) continue ;; # cef-dll-sys bookkeeping, not a runtime file
            *.pak|*.dat|*.bin|*.json|CREDITS.html|*.so|*.so.*)
                cp -a "$cef_path" "$pkgdir/usr/lib/sdrmm-app/" ;;
        esac
    done
    install -Dm755 target/release/sdrmm-desktop-helper "$pkgdir/usr/lib/sdrmm-app/sdrmm-desktop-helper"
    install -Dm644 "$cef/CREDITS.html" -t "$pkgdir/usr/share/licenses/sdrmm-app/"
    install -Dm644 LICENSE THIRD_PARTY_NOTICES.md -t "$pkgdir/usr/share/licenses/sdrmm-app/"
}


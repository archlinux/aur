# Maintainer: kappy <kappy777@proton.me>
# Contributor: kappy <kappy777@proton.me>
#
# kappastream-git: builds the latest kappastream from the git tip.
# A native (non-AppImage) build. The frontend is built with Vite, then
# `cargo build --release` embeds it into the Rust binary via tauri-build.
#
# Submission notes: see packaging/aur/README.md

_pkgname=kappastream
_repo="https://github.com/kappy7777/kappastream"

pkgname=${_pkgname}-git
pkgver=0.2.1.r0.gad8375ba
pkgrel=1
pkgdesc="A lightweight, account-free Twitch viewer (live stream, chat, favorites) for Linux"
arch=('x86_64')
url="${_repo}"
license=('GPL-3.0-only')
groups=()
depends=(
  'streamlink'        # runtime: resolves HLS playlist URLs (host binary)
  'webkit2gtk-4.1'    # Tauri WebView (links webkit2gtk-4.1 API)
  'gtk3'
  # WebKitGTK plays media via GStreamer. webkit2gtk-4.1 pulls only
  # gst-plugins-base-libs (the libs), not the plugin packages — so the
  # runtime media pipeline must be declared explicitly, else audio init
  # fails with "autoaudiosink not found" and streams never start.
  'gst-libav'           # avdec_h264 / avdec_aac — Twitch is H.264 + AAC
  'gst-plugins-base'    # autoaudiosink/alsasink + audioconvert/resample + videoconvert
  'gst-plugins-good'    # pulsesink — audio out to PulseAudio/PipeWire (KDE Wayland)
  'hicolor-icon-theme'
)
makedepends=(
  'rust'
  'cargo'
  'nodejs'
  'npm'
  'git'
  'cmake'   # aws-lc-sys (rustls' crypto backend via reqwest) falls back to CMake if its cc-builder deps aren't met
  'perl'    # AWS-LC's perl-based code generators (pre-generated fallbacks ship; kept for safety)
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("kappastream::git+${_repo}")
sha256sums=('SKIP')  # -git package; integrity comes from the git transport

pkgver() {
  cd "${_pkgname}"
  # Release tags exist (v0.1.x) → git describe (v0.1.2-3-gabcdef → 0.1.2.r3.gabcdef).
  # Fallback to commit-count only if, somehow, no tag is reachable from HEAD.
  git describe --long --tags 2>/dev/null \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"

  # Keep the cargo cache inside $srcdir so makepkg cleans it up and the
  # build is hermetic to $pkgdir/src.
  export CARGO_HOME="${srcdir}/.cargo-home"

  # 1) Frontend → dist/ (Vite production build).
  npm ci --no-audit --no-fund
  npm run build

  # 2) Rust host. tauri-build (build-dependency) reads tauri.conf.json and
  #    embeds ../dist into the binary, so the result is self-contained.
  #    --locked pins to the committed src-tauri/Cargo.lock for reproducibility.
  cd src-tauri
  # Drop /etc/makepkg.conf's hardened toolchain flags. makepkg exports
  # CFLAGS/CXXFLAGS/LDFLAGS/RUSTFLAGS (Arch's defaults include `-fuse-ld=lld`
  # and `-Wl,-z,pack-relative-relocs`) into build(). That combination breaks
  # aws-lc-sys's static-archive resolution at the final link: the archive is
  # built correctly (~3600 `aws_lc_0_42_0_*` symbols present) yet the linker
  # reports them all undefined. cargo's own defaults link cleanly (verified by
  # building this exact tree in a flag-free env), so unset them here.
  unset CFLAGS CXXFLAGS LDFLAGS RUSTFLAGS
  # Force aws-lc-sys to build AWS-LC from its bundled source (never auto-link a
  # host install, which would lack the `aws_lc_0_42_0_` symbol prefix the
  # pre-generated bindings expect) and keep the build hermetic to the builder's
  # system crypto libs.
  export AWS_LC_SYS_USE_SYSTEM=0
  # `--features tauri/custom-protocol` is mandatory for a launchable binary.
  # Plain `cargo build --release` leaves it off, so the native binary does not
  # use the embedded custom-protocol frontend from dist/. `tauri build` would
  # set this for us; since we build with cargo directly, enable it here.
  # (Additive feature; does not touch Cargo.lock, so --locked still holds.)
  cargo build --release --locked --features tauri/custom-protocol
}

package() {
  cd "${_pkgname}"

  # Real binary → /usr/lib (kept out of $PATH). A thin launcher wrapper →
  # /usr/bin execs it; NVIDIA EGL-Wayland explicit-sync compat (needed to avoid
  # "Error 71 dispatching to Wayland display" on NVIDIA Wayland) is applied
  # inside the binary at startup (src/compat.rs), so AMD/Intel/X11 are untouched.
  install -Dm755 "src-tauri/target/release/${_pkgname}" \
    "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}"
  # Assets under packaging/shared/ are reused by the Debian and Fedora packages
  # too — edit them there, not in this directory.
  install -Dm755 "packaging/shared/${_pkgname}.sh" \
    "${pkgdir}/usr/bin/${_pkgname}"

  # Icons (hicolor theme, base name matches the desktop file's Icon=).
  install -Dm644 "src-tauri/icons/32x32.png" \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png"
  install -Dm644 "src-tauri/icons/64x64.png" \
    "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_pkgname}.png"
  install -Dm644 "src-tauri/icons/128x128.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
  install -Dm644 "src-tauri/icons/128x128@2x.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
  install -Dm644 "src-tauri/icons/icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

  # Desktop entry + AppStream metainfo.
  install -Dm644 "packaging/shared/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "packaging/shared/dev.kappy.kappastream.metainfo.xml" \
    "${pkgdir}/usr/share/metainfo/dev.kappy.kappastream.metainfo.xml"
}

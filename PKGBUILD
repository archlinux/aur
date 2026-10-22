# Maintainer: Novaturiente
pkgname=novabrowser
pkgver=0.1.7
pkgrel=1
pkgdesc="AVX2-optimized keyboard-driven web browser on Chromium (CEF), configured in TypeScript"
arch=(x86_64)
url="https://github.com/Novaturiente/nova-browser"
license=(GPL-3.0-or-later)
# libcef.so's runtime deps (same set Arch's cef/electron packages pull in)
depends=(sqlite gtk3 nss alsa-lib libxss libxkbcommon libdrm mesa libcups at-spi2-core)
makedepends=(cargo cmake ninja)
optdepends=('wl-clipboard: primary selection and paste on Wayland'
            'xclip: primary selection and paste on X11'
            'xdg-utils: download-open and default-browser setup'
            'aria2: faster downloads (8 connections), resume after restart, magnet links and torrents'
            'rbw: Bitwarden passwords'
            'pass: password-store passwords')
conflicts=(novabrowser-bin novabrowser-git)
# libcef.so ships with debug info; strip keeps ~280 MB
options=(strip !lto !debug)
# Our CEF build (packaging/cef-patches: H.264/AAC, privacy patch, PartitionAlloc), x86-64-v3
_cef=cef-154.0.34-novabrowser-x86_64-v3
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$_cef.tar.zst::$url/releases/download/cef-154.0.34-nova1/$_cef.tar.zst")
sha256sums=('4ca5fda6d90f8c2c9b2c96e3065d3e72cf9050b1d70a984d689f51b4637b3e10'
            'a88ace6b3f2857e28a9ca9446c041a5cd729a15aa2e838caa7e3d8f9906e285f')
_src=nova-browser-$pkgver

prepare() {
  /lib/ld-linux-x86-64.so.2 --help 2>/dev/null | grep -q 'x86-64-v3 (supported' || {
    error "novabrowser needs an x86-64-v3 CPU (AVX2: Intel Haswell / AMD Excavator or newer)"
    return 1
  }
  cd "$_src"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

_env() {
  export CARGO_HOME="$srcdir/cargo-home" CEF_PATH="$srcdir/cef-own"
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/build"  # no build paths in panic messages
  export CFLAGS="${CFLAGS:-} -ffile-prefix-map=$srcdir=/build"  # QuickJS C sources use __FILE__
}

build() {
  cd "$_src"
  _env
  cargo build --release --frozen
}

check() {
  cd "$_src"
  _env
  cargo test --release --frozen
}

package() {
  cd "$_src"
  local lib="$pkgdir/usr/lib/novabrowser" r=target/release
  install -Dm755 $r/novabrowser "$lib/novabrowser"
  install -m755 $r/libcef.so $r/libvk_swiftshader.so $r/libvulkan.so.1 "$lib/"
  install -m644 $r/{icudtl.dat,v8_context_snapshot.bin,resources.pak,chrome_100_percent.pak,chrome_200_percent.pak,vk_swiftshader_icd.json} "$lib/"
  cp -r $r/locales "$lib/"
  chmod 644 "$lib"/locales/*
  # binary has RUNPATH $ORIGIN, so a symlink is the whole launcher
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/novabrowser/novabrowser "$pkgdir/usr/bin/novabrowser"
  install -Dm644 packaging/novabrowser.desktop "$pkgdir/usr/share/applications/novabrowser.desktop"
  install -Dm644 packaging/novabrowser.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/novabrowser.svg"
  for s in 16 32 48 64 128 256 512; do
    install -Dm644 packaging/icons/novabrowser-$s.png "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/novabrowser.png"
  done
  install -Dm644 README.md "$pkgdir/usr/share/doc/novabrowser/README.md"
  install -Dm644 docs/*.md -t "$pkgdir/usr/share/doc/novabrowser/docs/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/novabrowser/LICENSE"
  install -Dm644 $r/CREDITS.html "$pkgdir/usr/share/licenses/novabrowser/CEF-CREDITS.html"
}

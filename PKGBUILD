# Maintainer: Adam Delman <adam at delman dot cc>

pkgname=aptx-adaptive-linux-git
pkgver=0.1.0.r181.f21ecec
pkgrel=1
pkgdesc='aptX Adaptive Bluetooth codec plugin for PipeWire (Low Latency and adaptive modes)'
arch=('x86_64')
url='https://github.com/AKS-Logic/aptx-adaptive-linux'
license=('MIT')
depends=('pipewire>=1:1.6' 'pipewire-audio' 'wireplumber' 'bluez' 'gcc-libs' 'glibc')
makedepends=('cargo' 'git' 'pkgconf')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=$pkgname.install
source=("$pkgname::git+https://github.com/AKS-Logic/aptx-adaptive-linux.git"
        'pipewire-1.6-codec-abi-16.patch')
sha256sums=('SKIP'
            '398e3d1b950c0cd79daeba28280a0e72eddc174c804a670403ede41693757569')

_plugindir=/usr/lib/aptx-adaptive/spa-0.2

pkgver() {
  cd "$pkgname"
  printf '%s.r%s.%s' \
    "$(sed -n 's/^version = "\(.*\)"/\1/p' crates/spa-codec-aptx-adaptive/Cargo.toml | head -1)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$pkgname"
  # Upstream targets the PipeWire 1.7 codec ABI (17). Until Arch ships 1.7, build
  # against 1.6's ABI (16); PipeWire refuses a plugin with the wrong ABI, and with it
  # the stock aptX / aptX HD this plugin passes through.
  if (( $(vercmp "$(pkg-config --modversion libpipewire-0.3)" 1.7.0) < 0 )); then
    git apply "$srcdir/pipewire-1.6-codec-abi-16.patch"
    grep -q 'SPA_VERSION_BLUEZ5_CODEC_MEDIA: u32 = 16;' crates/spa-codec-aptx-adaptive/src/ffi.rs
  fi
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # APTX_ADAPTIVE_SO unset: use the bundled codec tables, no vendor library needed.
  unset APTX_ADAPTIVE_SO
  cargo build --frozen --release -p spa-codec-aptx-adaptive
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen -p spa-codec-aptx-adaptive --lib
}

package() {
  cd "$pkgname"
  # Own directory: /usr/lib/spa-0.2/bluez5/libspa-codec-bluez5-aptx.so belongs to
  # pipewire-audio. SPA_PLUGIN_DIR below puts this one first.
  install -Dm644 target/release/libspa_codec_aptx_adaptive.so \
    "$pkgdir$_plugindir/bluez5/libspa-codec-bluez5-aptx.so"

  install -Dm644 wireplumber/aptx-adaptive-guard.lua \
    "$pkgdir/usr/share/wireplumber/scripts/aptx-linux/aptx-adaptive-guard.lua"
  install -Dm644 wireplumber/90-aptx-adaptive-guard.conf \
    "$pkgdir/usr/share/wireplumber/wireplumber.conf.d/90-aptx-adaptive-guard.conf"

  # scripts/install-plugin.sh's settings for stock PipeWire, with Low Latency on
  # connect. Left out: APTX_ADAPTIVE_THREE_PROFILES (needs upstream's PipeWire patch)
  # and APTX_ADAPTIVE_ST0 (source-timed; see the install message).
  local unit
  for unit in pipewire wireplumber; do
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/$unit.service.d/aptx-adaptive.conf" <<EOF
[Service]
Environment="SPA_PLUGIN_DIR=$_plugindir:/usr/lib/spa-0.2"
Environment="APTX_ADAPTIVE_SLOT=aptx"
Environment="APTX_ADAPTIVE_DEFAULT_MODE=ll"
Environment="APTX_ADAPTIVE_START_LOW=1"
Environment="APTX_ADAPTIVE_HEADROOM_DB=1"
MemoryDenyWriteExecute=no
EOF
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

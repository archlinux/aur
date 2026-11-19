# Maintainer: Local PKGBUILD draft

pkgname=strom
pkgver=0.8.3
pkgrel=5
pkgdesc='Visual GStreamer pipeline editor and media pipeline engine'
arch=('x86_64' 'aarch64')
url='https://github.com/Eyevinn/strom'
license=('MIT' 'Apache-2.0')

# ring's bundled C/ASM objects are incompatible with the GCC LTO flags
# injected by makepkg when linked into Rust proc-macro libraries.
options=('!lto')

_trunkver=0.22.1

# Strom loads GStreamer plugins at runtime. The full plugin set is intentional;
# gst-libav and NVIDIA support are optional extras.
depends=(
  'systemd'
  'cairo'
  'graphviz'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-plugins-bad'
  'gst-plugins-ugly'
  'libnice'
  'libunwind'
)
optdepends=(
  'gst-libav: additional FFmpeg-backed GStreamer codecs'
  'nvidia-utils: NVIDIA NVML support for GPU monitoring'
)

makedepends=(
  'binaryen'
  'cairo'
  'clang'
  'cmake'
  'git'
  'gstreamer'
  'gst-plugins-base-libs'
  'gst-plugins-bad-libs'
  'libunwind'
  'openssl'
  'pkgconf'
  'rustup'
)

source=("${pkgname}::git+https://github.com/Eyevinn/strom.git#tag=v${pkgver}")
source_x86_64=(
  "trunk.tar.gz::https://github.com/trunk-rs/trunk/releases/download/v${_trunkver}/trunk-x86_64-unknown-linux-gnu.tar.gz"
)
source_aarch64=(
  "trunk.tar.gz::https://github.com/trunk-rs/trunk/releases/download/v${_trunkver}/trunk-aarch64-unknown-linux-gnu.tar.gz"
)
noextract=('trunk.tar.gz')
sha256sums=('SKIP')
sha256sums_x86_64=('2ab8d548fd5ed9cda50906f61fd8654204e7893bd52ebbfd90533862b7d71ee1')
sha256sums_aarch64=('b4017d1e0bfcffb4f4bee2be37c48def21e6e6896c3d0f503c43c42f714e57ea')

prepare() {
  cd "${srcdir}/${pkgname}"

  export RUSTUP_HOME="${srcdir}/rustup-home"
  export CARGO_HOME="${srcdir}/cargo-home"

  # Use Strom's pinned Rust toolchain (rust-toolchain.toml).
  rustup toolchain install 1.98.1 --profile minimal \
    --component rustfmt --component clippy \
    --target wasm32-unknown-unknown

  # Use Trunk's upstream prebuilt release binary. Building Trunk itself with
  # `cargo install trunk` pulls in a vendored libdeflate-sys build that fails
  # with some current compiler/toolchain combinations on Arch Linux.
  install -d "${srcdir}/build-tools/bin"
  tar -xzf "${srcdir}/trunk.tar.gz" -C "${srcdir}/build-tools/bin" trunk
  chmod 755 "${srcdir}/build-tools/bin/trunk"

  # Fetch the workspace crates now so the main build can run Cargo offline.
  export PATH="${srcdir}/build-tools/bin:${PATH}"
  cargo fetch --locked
}

build() {
  cd "${srcdir}/${pkgname}"

  export RUSTUP_HOME="${srcdir}/rustup-home"
  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_TARGET_DIR="${srcdir}/${pkgname}/target"
  export CARGO_NET_OFFLINE=true
  export CARGO_INCREMENTAL=0
  export PATH="${srcdir}/build-tools/bin:${PATH}"

  # backend/build.rs invokes Trunk to compile the WASM frontend and embeds it
  # into the backend binary. This matches Strom's Linux build feature set.
  cargo build --frozen --release --package strom --features efp
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm755 "${srcdir}/${pkgname}/target/release/strom" \
    "${pkgdir}/usr/bin/strom"

  install -Dm644 LICENSE-MIT \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"

  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 .strom.toml.example \
    "${pkgdir}/usr/share/doc/${pkgname}/strom.toml.example"

  # Dedicated unprivileged account for the system service.
  install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/strom.conf" <<'EOF'
u strom - "Strom service" /var/lib/strom
EOF

  # Headless web service. StateDirectory creates /var/lib/strom and assigns it
  # to the strom service account at startup.
  install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/strom.service" <<'EOF'
[Unit]
Description=Strom GStreamer Flow Engine
Wants=network-online.target
After=network-online.target

[Service]
Type=simple
User=strom
Group=strom
WorkingDirectory=/var/lib/strom
StateDirectory=strom
StateDirectoryMode=0750
SupplementaryGroups=render video
Environment=GST_GL_PLATFORM=egl
Environment=GST_GL_WINDOW=surfaceless
Environment=RUST_LOG=info
ExecStart=/usr/bin/strom --headless --data-dir=/var/lib/strom
Restart=on-failure
RestartSec=5s
TimeoutStopSec=20s
UMask=0027

# Basic service hardening; media/network and device access remain available.
NoNewPrivileges=true
PrivateTmp=true
ProtectSystem=full
ProtectKernelTunables=true
ProtectKernelModules=true
ProtectControlGroups=true
RestrictSUIDSGID=true
LockPersonality=true

[Install]
WantedBy=multi-user.target
EOF

}

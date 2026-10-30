# Maintainer: Finn Künstner <finn dot kuenstner at gmail dot com>

pkgname=cinnabar
pkgver=0.1.31
pkgrel=1
pkgdesc='Unofficial client compatible with Minecraft: Bedrock Edition, written in Rust'
arch=('x86_64')
url='https://github.com/cinnabar-mc/cinnabar'
license=('PolyForm-Noncommercial-1.0.0')
depends=(
  'alsa-lib'
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libglvnd'
  'libx11'
  'libxcursor'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11'
  'systemd-libs'
  'vulkan-driver'
  'vulkan-icd-loader'
  'wayland'
)
makedepends=('cargo' 'git' 'go')
optdepends=(
  'kdialog: file picker and dialogs without an XDG portal'
  'pipewire-alsa: sound on PipeWire'
  'pulseaudio-alsa: sound on PulseAudio'
  'xdg-utils: open links and accept Discord invites'
  'zenity: file picker and dialogs without an XDG portal'
)
options=('!debug' '!lto' '!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f04219c90ab15e6c99a2c88852c00caa95012a960e79018ef0d11574afbbef55')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"

  export GOPATH="$srcdir/go"
  go mod download -modcacherw
  (cd tools/localserver && GOWORK=off go mod download -modcacherw)
}

build() {
  cd "$pkgname-$pkgver"

  export CINNABAR_BUILD_COMMIT=$(gzip -dc "$srcdir/$pkgname-$pkgver.tar.gz" | git get-tar-commit-id)

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="$PWD/target"
  export CARGO_BUILD_BUILD_DIR="$CARGO_TARGET_DIR"
  export CARGO_PROFILE_RELEASE_DEBUG=false
  export RUSTFLAGS+=" --remap-path-prefix=$srcdir=/build --remap-path-prefix=${CARGO_HOME:-$HOME/.cargo}=/cargo"
  cargo build --frozen --release --no-default-features \
    $(awk '$2 != "-" {printf "-p %s --bin %s ", $2, $1}' packaging/common/runtime-binaries.txt) \
    -p asset-compiler --bin assetc

  export GOPATH="$srcdir/go"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  go build -ldflags "-linkmode=external -s -w $(bash packaging/common/core-ldflags.sh)" \
    -o "$CARGO_TARGET_DIR/release/bedrock-core" ./core/cmd/bedrock-core
  cd tools/localserver
  GOWORK=off go build -ldflags '-linkmode=external -s -w' \
    -o "$CARGO_TARGET_DIR/release/bedrock-local-server" .
}

package() {
  cd "$pkgname-$pkgver"

  (
    source packaging/common/stage-payload.sh
    stage_runtime_binaries "$pkgdir/usr/lib/$pkgname/bin"
    stage_resources "$pkgdir/usr/lib/$pkgname/share/$pkgname" target/release/assetc
  )
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "packaging/linux/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "packaging/icons/$pkgname.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 LICENSE THIRD_PARTY_NOTICES.md -t "$pkgdir/usr/share/licenses/$pkgname"
}

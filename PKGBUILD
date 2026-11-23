# Maintainer: Finn Künstner <finn dot kuenstner at gmail dot com>

_pkgname=cinnabar
pkgname=$_pkgname-git
pkgver=0.2.1.r293.gce130a4
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
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!debug' '!lto' '!strip')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 --match 'v[0-9]*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"

  export GOPATH="$srcdir/go"
  go mod download -modcacherw
}

build() {
  cd "$_pkgname"

  export CINNABAR_BUILD_COMMIT=$(git rev-parse HEAD)

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
}

package() {
  cd "$_pkgname"

  (
    source packaging/common/stage-payload.sh
    stage_runtime_binaries "$pkgdir/usr/lib/$_pkgname/bin"
    stage_resources "$pkgdir/usr/lib/$_pkgname/share/$_pkgname" target/release/assetc
  )
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$_pkgname/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "packaging/linux/$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "packaging/icons/$_pkgname.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 LICENSE THIRD_PARTY_NOTICES.md -t "$pkgdir/usr/share/licenses/$pkgname"
}

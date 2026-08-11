# Maintainer: gaoxiaobei <99178334+gaoxiaobei at users dot noreply dot github dot com>

pkgname=deeix-chat-desktop-git
pkgver=0.3.4.r973.gd2fdd59
pkgrel=1
pkgdesc="Community-maintained native desktop build of DEEIX Chat"
arch=('x86_64')
url="https://github.com/gaoxiaobei/DEEIX-Chat"
license=('Apache-2.0')
depends=(
  'ca-certificates'
  'cairo'
  'dbus'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'libsoup3'
  'webkit2gtk-4.1'
)
makedepends=(
  'git'
  'go'
  'nodejs'
  'pnpm'
  'rust'
)
provides=('deeix-chat-desktop')
conflicts=('deeix-chat-desktop')
options=('!debug' '!lto')
source=('git+https://github.com/gaoxiaobei/DEEIX-Chat.git#branch=arch-desktop')
sha256sums=('SKIP')

pkgver() {
  cd DEEIX-Chat
  local _version
  _version=$(<VERSION)
  printf '%s.r%s.g%s' \
    "$_version" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/DEEIX-Chat"

  export PNPM_HOME="$srcdir/pnpm-home"
  export XDG_CACHE_HOME="$srcdir/xdg-cache"
  export XDG_DATA_HOME="$srcdir/xdg-data"
  pnpm install --frozen-lockfile --prefer-offline \
    --store-dir "$srcdir/pnpm-store" --filter @deeix/web
  NEXT_PUBLIC_DESKTOP_SAME_ORIGIN=true pnpm --filter @deeix/web build

  mkdir -p build
  local _version _commit _build_time
  _version=$(<VERSION)
  _commit=$(git rev-parse --short=12 HEAD)
  _build_time=$(git show -s --format=%cI HEAD)

  cd backend
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  CGO_ENABLED=1 \
  GOCACHE="$srcdir/go-cache" \
  GOMODCACHE="$srcdir/go-mod-cache" \
  GOFLAGS="-modcacherw" \
  go build -buildmode=pie -buildvcs=false -trimpath \
    -ldflags="-linkmode=external -extldflags '${LDFLAGS}' -s -w -X github.com/DEEIX-AI/DEEIX-Chat/backend/internal/shared/buildinfo.Version=${_version} -X github.com/DEEIX-AI/DEEIX-Chat/backend/internal/shared/buildinfo.Commit=${_commit} -X github.com/DEEIX-AI/DEEIX-Chat/backend/internal/shared/buildinfo.BuildTime=${_build_time}" \
    -o ../build/deeix-chat-server ./cmd/server
  cd ..

  RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/usr/src/debug/$pkgname" \
    CARGO_HOME="$srcdir/cargo-home" \
    CARGO_TARGET_DIR="$srcdir/cargo-target" \
    cargo build --locked --release --manifest-path desktop/src-tauri/Cargo.toml
}

package() {
  cd "$srcdir/DEEIX-Chat"

  install -Dm755 "$srcdir/cargo-target/release/deeix-chat-desktop" \
    "$pkgdir/usr/bin/deeix-chat-desktop"
  install -Dm755 build/deeix-chat-server \
    "$pkgdir/usr/lib/deeix-chat/deeix-chat-server"

  install -d "$pkgdir/usr/share/deeix-chat/frontend"
  cp -r frontend/out/. "$pkgdir/usr/share/deeix-chat/frontend/"

  install -Dm644 packaging/arch/deeix-chat.desktop \
    "$pkgdir/usr/share/applications/deeix-chat.desktop"
  install -Dm644 frontend/public/pwa/icon-512.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/deeix-chat.png"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 NOTICE \
    "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}

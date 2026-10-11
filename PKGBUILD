# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Chinmay Dalal <TILDE chinmay SLASH public-inbox AT lists.sr.ht>

pkgbase=montray
pkgname=('montray-server' 'montray-ui')
pkgver=2.1.0
pkgrel=1
arch=('x86_64')
url='https://github.com/dimonomid/montray'
license=('BSD-2-Clause')
makedepends=('git' 'go' 'cargo' 'fontconfig')
source=("$pkgbase::git+$url.git#tag=v$pkgver")
sha256sums=('2eefe0cede597cc6499acf188e8abbc3655c219d3824040d1c19b4eaef533426')

prepare() {
  cd "$pkgbase"

  export GOPATH="$srcdir/gopath"
  export GOFLAGS='-modcacherw'
  go mod download

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --manifest-path cmd/montray-ui/Cargo.toml \
    --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgbase"

  export GOPATH="$srcdir/gopath"
  export GOFLAGS='-modcacherw'
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_NET_OFFLINE=true
  # fixes "package contains reference to $srcdir"
  export RUSTFLAGS+=" --remap-path-prefix=$srcdir=/usr/src/debug/$pkgbase"

  make montray-server montray-ui \
    MONTRAY_BUILD_PACKAGED=1 \
    DATE="$(date -u -d "@$SOURCE_DATE_EPOCH" +%Y-%m-%dT%H:%M:%SZ)"
}

check() {
  cd "$pkgbase"

  export GOPATH="$srcdir/gopath"
  export GOFLAGS='-modcacherw'
  go test -tags packaged ./cmd/montray-server

  bin/montray-ui --version
}

package_montray-server() {
  pkgdesc='Monitor system health and publish its status'
  depends=('systemd')
  backup=('etc/montray-server.yml')
  install=montray-server.install

  cd "$pkgbase"

  install -Dm755 bin/montray-server "$pkgdir/usr/bin/montray-server"
  install -Dm644 packaging/montray-server/montray-server.service \
    "$pkgdir/usr/lib/systemd/system/montray-server.service"
  install -Dm644 packaging/montray-server/montray-server.sysusers \
    "$pkgdir/usr/lib/sysusers.d/montray.conf"
  install -Dm644 packaging/montray-server/montray-server.yml \
    "$pkgdir/etc/montray-server.yml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_montray-ui() {
  pkgdesc='Show Montray status in the desktop tray'
  depends=('glibc' 'gcc-libs' 'fontconfig' 'wayland' 'libx11' 'libxcb'
           'libxext' 'libxfixes' 'libxi' 'libxinerama' 'libxrandr' 'libxrender'
           'libxcursor' 'libxkbcommon' 'libxkbcommon-x11' 'hicolor-icon-theme')
  install=montray-ui.install

  cd "$pkgbase"

  install -Dm755 bin/montray-ui "$pkgdir/usr/bin/montray-ui"
  install -Dm644 packaging/montray-ui/montray-ui.desktop \
    "$pkgdir/usr/share/applications/montray-ui.desktop"
  install -Dm644 packaging/montray-ui/montray-ui.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/montray-ui.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: asafelobotomy <213836723+asafelobotomy@users.noreply.github.com>
#
# The AUR package: hauler built from a tagged release's source. The Packages
# workflow writes the published copy (version and checksum filled in, plus
# .SRCINFO) into its `aur` artifact; dist/arch/PKGBUILD builds from a
# checkout instead.

pkgname=hauler
pkgver=0.2.3
pkgrel=1
pkgdesc='Fast, resumable download manager: segmented engine, systemd daemon and Kirigami app'
arch=('x86_64')
url='https://github.com/asafelobotomy/hauler'
license=('GPL-3.0-or-later' 'MIT OR Apache-2.0')
depends=('libgcc' 'libstdc++' 'glibc' 'qt6-base' 'qt6-declarative'
         'kirigami' 'kitemmodels' 'qqc2-desktop-style')
makedepends=('cargo' 'cmake')
optdepends=('uq: Downloads widget in the bar, "Download with hauler" in look=see>do_ and the Downloads page in Settings')
# Rust links its own LTO; makepkg's C/C++ LTO flags break the cxx-qt objects.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('af7f5b76a95490da8e7bac0680f920bd584cfbb89298fe7aefc7961ac9742ced')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --release --frozen -p hauler-cli -p hauler-daemon -p hauler-desktop
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 -t "$pkgdir/usr/bin" \
    target/release/hauler target/release/haulerd target/release/hauler-desktop
  install -Dm644 dist/systemd/hauler.socket "$pkgdir/usr/lib/systemd/user/hauler.socket"
  sed 's|@BINDIR@|/usr/bin|' dist/systemd/hauler.service |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/hauler.service"
  install -Dm644 dist/hauler.desktop "$pkgdir/usr/share/applications/hauler.desktop"
  install -Dm644 -t "$pkgdir/usr/share/metainfo" dist/io.github.asafelobotomy.hauler.metainfo.xml
  # uQ integration (uq/README.md): inert without uQ; the D-Bus service file
  # lets the session bus start haulerd through hauler.service.
  install -Dm644 -t "$pkgdir/usr/share/uq/shell/widgets/hauler" uq/widgets/hauler/widget.toml uq/widgets/hauler/Widget.qml
  install -Dm644 -t "$pkgdir/usr/share/uq/launcher" uq/launcher/hauler.provider
  install -Dm644 -t "$pkgdir/usr/share/uq/settings/pages/hauler" uq/pages/hauler/*
  install -Dm644 -t "$pkgdir/usr/share/dbus-1/services" uq/dbus/org.hauler.Hauler1.service
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING LICENSE-MIT LICENSE-APACHE
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

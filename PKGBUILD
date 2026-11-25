# Maintainer: asafelobotomy <213836723+asafelobotomy@users.noreply.github.com>
#
# The AUR package: emobie built from a tagged release's source. The release
# workflow writes the published copy (version and checksum filled in, plus
# .SRCINFO and emobie.install) into its `aur` artifact. For a local build, run
# scripts/aur-files.sh vX.Y.Z in an Arch container, or makepkg from a copy.

pkgname=emobie
pkgver=0.9.6
pkgrel=1
pkgdesc="Compact emoji palette with macros and optional text expansion"
arch=('x86_64')
url="https://github.com/asafelobotomy/emobie"
license=('MIT')
depends=(
  'webkit2gtk-4.1'
  'libayatana-appindicator'
  'gtk3'
  'libxkbcommon'
)
install=emobie.install
# Rust does its own LTO; makepkg's C flags for it break bundled C code.
options=('!lto')
makedepends=('cargo' 'nodejs' 'npm' 'clang' 'lld')
optdepends=(
  'wl-clipboard: externally-verified Wayland clipboard for reliable Expand paste; copying emoji from uQ'"'"'s look=see>do_'
  'uq: emoji search in uQ'"'"'s look=see>do_ (type :) and following uQ'"'"'s theme'
  'acl: setfacl for instant keyboard access after Grant without logout'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f89450f66dba9b000598724f17c56993d573291d2190c627e4589fb51f1f6e4a')

prepare() {
  cd "$pkgname-$pkgver"
  npm ci --legacy-peer-deps
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR="$srcdir/target"
  npm run tauri build -- --no-bundle
  cargo build --release --manifest-path crates/emobie-inputd/Cargo.toml
  cargo build --release --manifest-path crates/emobie-provider/Cargo.toml
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$srcdir/target/release/emobie" "$pkgdir/usr/bin/emobie"
  install -Dm755 "$srcdir/target/release/emobie-inputd" \
    "$pkgdir/usr/bin/emobie-inputd"
  # uQ integration (inert without uQ): the launcher provider, its data and its files.
  install -Dm755 "$srcdir/target/release/emobie-provider" \
    "$pkgdir/usr/bin/emobie-provider"
  install -Dm644 src/data/emoji.json "$pkgdir/usr/share/emobie/emoji.json"
  install -Dm644 uq/launcher/emobie.provider \
    "$pkgdir/usr/share/uq/launcher/emobie.provider"
  install -Dm644 uq/dbus/org.emobie.Provider.service \
    "$pkgdir/usr/share/dbus-1/services/org.emobie.Provider.service"
  install -Dm644 -t "$pkgdir/usr/share/uq/settings/pages/emobie" uq/pages/emobie/*
  install -Dm644 uq/diag/emobie.toml "$pkgdir/usr/share/uq/diag/emobie.toml"
  install -Dm644 packaging/systemd/emobie-inputd.service \
    "$pkgdir/usr/lib/systemd/user/emobie-inputd.service"
  install -Dm755 packaging/setup-input-access.sh \
    "$pkgdir/usr/share/emobie/setup-input-access.sh"
  install -Dm755 packaging/bootstrap-inputd-host.sh \
    "$pkgdir/usr/share/emobie/bootstrap-inputd-host.sh"
  install -Dm644 packaging/udev/99-emobie-input.rules \
    "$pkgdir/usr/share/emobie/99-emobie-input.rules"
  install -Dm644 packaging/udev/98-emobie-keyboard-read.rules \
    "$pkgdir/usr/share/emobie/98-emobie-keyboard-read.rules"
  install -Dm644 packaging/polkit/io.github.asafelobotomy.emobie.inputd.policy \
    "$pkgdir/usr/share/polkit-1/actions/io.github.asafelobotomy.emobie.inputd.policy"
  install -Dm644 packaging/selinux/emobie-inputd.te \
    "$pkgdir/usr/share/emobie/selinux/emobie-inputd.te"
  install -Dm644 flatpak/io.github.asafelobotomy.emobie.desktop \
    "$pkgdir/usr/share/applications/io.github.asafelobotomy.emobie.desktop"
  ln -s io.github.asafelobotomy.emobie.desktop \
    "$pkgdir/usr/share/applications/emobie.desktop"
  for pair in \
    "16:16x16.png" "22:22x22.png" "24:24x24.png" "32:32x32.png" \
    "48:48x48.png" "64:64x64.png" "128:128x128.png" "256:256x256.png" \
    "512:icon.png"; do
    size="${pair%%:*}"
    file="${pair##*:}"
    install -Dm644 "src-tauri/icons/$file" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/io.github.asafelobotomy.emobie.png"
  done
  install -Dm644 flatpak/io.github.asafelobotomy.emobie.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.github.asafelobotomy.emobie.metainfo.xml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

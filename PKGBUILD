# Maintainer: dekart811 <mail@dekart811.net>

pkgname=arkha
pkgver=1.0.1
pkgrel=1
pkgdesc='A fast graphical file manager'
arch=('x86_64' 'aarch64')
url='https://github.com/dekart811/arkha'
license=('GPL-3.0-or-later')
depends=(
  'at-spi2-core'
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'gvfs'
  'hicolor-icon-theme'
  'libgcc'
  'pango'
)
makedepends=('cargo' 'gettext')
optdepends=(
  'ffmpegthumbnailer: video thumbnails'
  'ffmpeg: video thumbnails without ffmpegthumbnailer'
  'mediainfo: the Media Info tab in Properties'
  'gvfs-mtp: phones and media players over MTP'
  'gvfs-gphoto2: cameras'
  'gvfs-smb: Windows and Samba network shares'
  'engrampa: creating and extracting archives'
  'file-roller: creating and extracting archives'
  'xarchiver: creating and extracting archives'
  'xterm: Open in Terminal, if no other terminal is installed'
)
# Cargo strips the program: there's nothing for a -debug package.
options=('!debug')
# The release's sources, as GitHub packs the tag v$pkgver. The checksum is
# set for each release (updpkgsums, then makepkg --printsrcinfo > .SRCINFO).
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('19ae1baebe8df4d1c727b7d2725755ded8e934e791e9c7f638bc658c5a3e1958')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/arkha "$pkgdir/usr/bin/arkha"
  install -Dm644 arkha.desktop "$pkgdir/usr/share/applications/arkha.desktop"
  install -Dm644 data/arkha.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/arkha.svg"
  install -Dm644 data/io.github.dekart811.Arkha.metainfo.xml "$pkgdir/usr/share/metainfo/io.github.dekart811.Arkha.metainfo.xml"
  # The translations build.rs made from po/*.po.
  for mo in target/release/locale/*/LC_MESSAGES/arkha.mo; do
    install -Dm644 "$mo" "$pkgdir/usr/share/locale/${mo#target/release/locale/}"
  done
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

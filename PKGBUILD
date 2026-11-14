# Maintainer: dekart811 <mail@dekart811.net>

pkgname=arkha-git
_pkgname=arkha
pkgver=1.0.0dev.r146.ged117ec
pkgrel=1
pkgdesc='A fast graphical file manager (development version from master)'
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
makedepends=('cargo' 'git' 'gettext')
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
provides=("$_pkgname")
conflicts=("$_pkgname")
# Cargo strips the program: there's nothing for a -debug package.
options=('!debug')
source=("$_pkgname::git+$url.git#branch=master")
sha256sums=('SKIP')

# Cargo.toml's version as pacman sorts it: a build towards 1.0.0 ("1.0.0-dev"
# there) is 1.0.0dev.r<commits>.g<commit>, older than 1.0.0; a build after
# the release, 1.0.0.r<commits>.g<commit>.
pkgver() {
  cd "$_pkgname"
  local version base pre
  version="$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml | head -n1)"
  base="${version%%-*}"
  pre="${version#"$base"}"
  pre="${pre#-}"
  printf '%s%s.r%s.g%s' "$base" "$pre" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "$_pkgname"
  install -Dm755 target/release/arkha "$pkgdir/usr/bin/arkha"
  install -Dm644 arkha.desktop "$pkgdir/usr/share/applications/arkha.desktop"
  install -Dm644 data/arkha.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/arkha.svg"
  install -Dm644 data/io.github.dekart811.Arkha.metainfo.xml "$pkgdir/usr/share/metainfo/io.github.dekart811.Arkha.metainfo.xml"
  # The translations build.rs made from po/*.po.
  for mo in target/release/locale/*/LC_MESSAGES/arkha.mo; do
    install -Dm644 "$mo" "$pkgdir/usr/share/locale/${mo#target/release/locale/}"
  done
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}

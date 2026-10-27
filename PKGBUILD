pkgname=ezoo-download-git
pkgver=1.x.x
pkgrel=1
pkgdesc="A fast, modern open-source alternative to Internet Download Manager (IDM) for Linux"
arch=('x86_64')
url="https://github.com/kerlif/ezoo-download"
license=('custom')
options=(!lto)
depends=(
  'gcc-libs'
  'glibc'
  'fontconfig'
  'freetype2'
  'libglvnd'
  'libxkbcommon'
  'libxkbcommon-x11'
  'wayland'
  'xdg-desktop-portal'
  'yt-dlp'
  'ffmpeg'
)
makedepends=(
  'git'
  'cargo'
  'cmake'
  'pkgconf'
  'clang'
)
provides=('ezoo-download')
conflicts=('ezoo-download')
source=("git+https://github.com/kerlif/ezoo-download.git#branch=main")
sha256sums=('SKIP')

# Version is generated automatically from the latest git tag on every makepkg run
pkgver() {
  cd "$srcdir/ezoo-download"
  if v=$(git describe --long --tags --match 'v[0-9]*' 2>/dev/null); then
    printf '%s' "$v" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "$srcdir/ezoo-download"
  export RUSTUP_TOOLCHAIN=stable

  # Fix deprecated properties in the Slint UI
  find crates/app/ui -name "*.slint" -exec sed -i 's/viewport-width/content-width/g' {} +
  find crates/app/ui -name "*.slint" -exec sed -i 's/viewport-x/content-x/g' {} +
}

build() {
  cd "$srcdir/ezoo-download"
  export RUSTUP_TOOLCHAIN=stable

  # Make sure C code (e.g. from the ring crate) is not built as LTO bitcode,
  # and strip the build directory path from the compiled binary
  export CFLAGS="${CFLAGS/-flto=auto/} -fno-lto -ffile-prefix-map=$srcdir=src"
  export CXXFLAGS="${CXXFLAGS/-flto=auto/} -fno-lto -ffile-prefix-map=$srcdir=src"
  export RUSTFLAGS="${RUSTFLAGS/-Clink-arg=-fuse-ld=lld/} --remap-path-prefix=$srcdir=src"

  cargo build --release --locked
}

package() {
  cd "$srcdir/ezoo-download"
  install -Dm755 "target/release/EzooDownload" "$pkgdir/usr/bin/EzooDownload"
  install -dm755 "$pkgdir/usr/share/ezoo-download"
  cp -r "extension" "$pkgdir/usr/share/ezoo-download/"
  rm -rf "$pkgdir/usr/share/ezoo-download/extension/test"
  cp -r "extension" "$pkgdir/usr/share/ezoo-download/extension-firefox"
  if [ -f "$pkgdir/usr/share/ezoo-download/extension-firefox/manifest.firefox.json" ]; then
    mv "$pkgdir/usr/share/ezoo-download/extension-firefox/manifest.firefox.json" \
       "$pkgdir/usr/share/ezoo-download/extension-firefox/manifest.json"
  fi
  rm -rf "$pkgdir/usr/share/ezoo-download/extension-firefox/test"
  install -Dm644 "packaging/linux/ezoo-download.desktop" "$pkgdir/usr/share/applications/ezoo-download.desktop"
  if [ -d "packaging/linux/hicolor" ]; then
    install -dm755 "$pkgdir/usr/share/icons"
    cp -r "packaging/linux/hicolor" "$pkgdir/usr/share/icons/hicolor"
  fi
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/ezoo-download/README.md"
  if [ -f "THIRD-PARTY-NOTICES.txt" ]; then
    install -Dm644 "THIRD-PARTY-NOTICES.txt" "$pkgdir/usr/share/doc/ezoo-download/THIRD-PARTY-NOTICES.txt"
  fi
}

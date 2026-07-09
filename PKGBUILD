# Maintainer: kekmacska <kekmacska2@proton.me>
pkgname=saber-git
pkgver=1.35.0.r1.gg4af5d81a
pkgrel=1
pkgdesc="Saber Notes – A Flutter-based desktop note-taking app"
arch=('x86_64')
url="https://github.com/saber-notes/saber"
license=('GPL-3.0')
depends=(
  'gtk3' 'libx11' 'libxcomposite' 'libxrandr' 'libxdamage' 'libxext' 'libxfixes'
  'glib2' 'pango' 'cairo' 'fontconfig' 'freetype2' 'wmctrl' 'webkit2gtk-4.1' 'libjxl'
)
makedepends=(
  'git' 'flutter' 'svgo' 'oxipng'
  # AUR: minify
)
provides=('saber')
conflicts=('saber')
conflicts=('saber-bin')
source=("git+https://github.com/saber-notes/saber.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/saber"
  git describe --tags --long 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/.g/'
}

prepare() {
    cd "$srcdir/saber"

    svgo . -r --multipass
    oxipng -o max -r -p -s -v -t 4 --timeout 150 ./{.github,assets,assets_raw,lib,linux,metadata,packages,submodules,test}

    mkdir -p "$srcdir/fake-libjxl"
    ln -sf /usr/lib/libjxl.so.0.13 "$srcdir/fake-libjxl/libjxl.so.0.11"
    ln -sf /usr/lib/libjxl_threads.so.0.13 "$srcdir/fake-libjxl/libjxl_threads.so.0.11" 2>/dev/null || true
    ln -sf /usr/lib/libjxl_cms.so.0.13 "$srcdir/fake-libjxl/libjxl_cms.so.0.11" 2>/dev/null || true
    sed -i 's|^Icon=.*|Icon=saber|' flatpak/com.adilhanney.saber.desktop
}

build() {
  cd "$srcdir/saber"
  export LDFLAGS="$LDFLAGS -Wl,-rpath-link,$srcdir/fake-libjxl"
  sh patches/pre/remove_proprietary_dependencies.sh

  flutter build linux --release
}

package() {
  local _libdir="/usr/lib/saber"
  local _bindir="/usr/bin"
  local _bundle="$srcdir/saber/build/linux/x64/release/bundle"

  strip "$_bundle/saber" || true
  strip "$_bundle/lib/"* || true

  install -dm755 "$pkgdir$_libdir"
  install -dm755 "$pkgdir$_bindir"

  cp -a "$_bundle/." "$pkgdir$_libdir/"

  ln -s "../lib/saber/saber" "$pkgdir$_bindir/saber"

  sed -i 's|^Icon=.*|Icon=saber|' "$srcdir/saber/flatpak/com.adilhanney.saber.desktop"

  install -Dm644 "$srcdir/saber/flatpak/com.adilhanney.saber.desktop" \
    "$pkgdir/usr/share/applications/saber.desktop"

  install -Dm644 "$_bundle/data/flutter_assets/assets/icon/icon.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/saber.svg"
}

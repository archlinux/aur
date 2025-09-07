# Maintainer: kekmacska <kekmacska2@proton.me>
pkgname=saber-git
pkgver=0.26.6.r0.gg107426ff
pkgrel=1
pkgdesc="Saber Notes – A Flutter-based desktop note-taking app"
arch=('x86_64')
url="https://github.com/saber-notes/saber"
license=('GPL-3.0')
depends=(
  'gtk3' 'libx11' 'libxcomposite' 'libxrandr' 'libxdamage' 'libxext' 'libxfixes'
  'glib2' 'pango' 'cairo' 'fontconfig' 'freetype2' 'wmctrl'
)
makedepends=(
  'git' 'flutter' 'nodejs-svgo-git' 'oxipng'
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

build() {
  cd "$srcdir/saber"

  find . -type f \( -name "*.json" -o -name "*.xml" -o -name "*.js" -o -name "*.css" -o -name "*.html" \) -exec sh -c '
  for f; do
    echo "Minifying: $f"
    original_size=$(stat -c%s "$f")
    if minify "$f" > "$f.tmp"; then
      minified_size=$(stat -c%s "$f.tmp")
      mv "$f.tmp" "$f"
      saved=$((original_size - minified_size))
      percent=$((100 * saved / original_size))
      printf "Original: %d bytes, Minified: %d bytes, Saved: \033[0;32m%d%%\033[0m\n" "$original_size" "$minified_size" "$percent"
    else
      echo "Failed: $f"
      rm -f "$f.tmp"
    fi
  done
  ' sh {} +

  svgo . -r --multipass
  oxipng -o max -r -p -s -v -t 4 --timeout 150 ./{.github,assets,assets_raw,lib,linux,metadata,packages,submodules,test}

  sh patches/remove_proprietary_dependencies.sh

  flutter build linux --release

  #sed -i 's|^Exec=.*|Exec=sh -c '\''saber \& while ! wmctrl -l \| grep -i saber; do sleep 0.5; done; wmctrl -r saber -b add,maximized_vert,maximized_horz'\''|' flatpak/com.adilhanney.saber.desktop
  sed -i 's|^Icon=.*|Icon=saber|' flatpak/com.adilhanney.saber.desktop
}

package() {
  local _libdir="/usr/lib/saber"
  local _bindir="/usr/bin"
  local _bundle="$srcdir/saber/build/linux/x64/release/bundle"

  strip "$_bundle/saber"
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
# shellcheck shell=bash disable=SC2034,SC2154

# Maintainer: Damien Flament <damien dot flament at zoho dot com>

pkgname='tine-outliner-git'
pkgver=0.7.3.r2.g9c1f92d
pkgrel=1
pkgdesc="A fast, local, Logseq-compatible outliner (latest git version)"
url='https://tine.page/'
license=('AGPL-3.0-only')

arch=('x86_64')
makedepends=('git' 'rustup' 'npm')
depends=('gtk3' 'gdk-pixbuf2' 'libgcc' 'libsoup3' 'webkit2gtk-4.1' 'dbus' 'libx11' 'glib2' 'cairo' 'hicolor-icon-theme')

conficts=('tine-outliner' 'tine-outliner-bin')
provides=("tine-outliner=${pkgver}")

source=("${pkgname}::git+https://github.com/martinkoutecky/tine.git")
sha256sums=('SKIP')

function pkgver {
  cd "$pkgname" || return

  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

function prepare {
  cd "$pkgname" || return

  rustup toolchain install --no-self-update

  npm ci
}

function build {
  cd "$pkgname" || return

  export CFLAGS

  # Le drapeau `-flto=auto` dans les options de GCC semble générer une erreur
  # lors de la création des liens dynamiques avec la bilbiothèque SQLite3. Il
  # est donc supprimé.
  CFLAGS=$(echo "$CFLAGS" | sed -E 's/-flto=auto//g')

  npx tauri build --no-bundle -- --features custom-protocol
}

function package {
  cd "$pkgname" || return

  # L'exécutable principal est installé.
  install -Dt "$pkgdir/usr/bin" "target/release/tine"

  # Le fichier Desktop du Flatpak est utilisé.
  install -Dt "$pkgdir/usr/share/applications" "flatpak/page.tine.Tine.desktop"

  # Les icônes sont installées.
  install -D  "src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/page.tine.Tine.png"
  install -D  "src-tauri/icons/64x64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/page.tine.Tine.png"
  install -D  "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/page.tine.Tine.png"
  install -D  "src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/128x128@2/apps/page.tine.Tine.png"
  install -D  "src-tauri/icons/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/page.tine.Tine.png"
  install -D  "docs/app-icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/page.tine.Tine.svg"

  # Les fichiers de manuel sont compressés et installés.
  install -d "$pkgdir/usr/share/man/man1"

  for page in tine-capture tine-doctor tine-export-live tine-export-static tine-export tine-open tine-version tine
  do
    gzip -c "docs/${page}.1" > "$pkgdir/usr/share/man/man1/${page}.1.gz"
  done
}

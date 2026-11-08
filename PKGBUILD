# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=skykeep
pkgver=0.1.15
pkgrel=1
pkgdesc="Native iCloud apps: Notes, Reminders, Calendar, Contacts, Drive and Photos, offline and in sync"
arch=('x86_64')
url="https://github.com/YashwanthKamireddi/Skykeep"
license=('GPL-3.0-only')
# What the binary links (readelf -d), plus the GStreamer plugins it loads for
# videos: base and good for the elements, libav for H.264 and HEVC.
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gst-libav'
         'gst-plugins-base' 'gst-plugins-base-libs' 'gst-plugins-good' 'gstreamer'
         'gtk3' 'hicolor-icon-theme' 'libgcc' 'libheif' 'libsoup3' 'webkit2gtk-4.1')
makedepends=('rust' 'nodejs' 'npm' 'pkgconf')
# The keyring is spoken to over D-Bus, so it needs a Secret Service, not libsecret.
optdepends=('org.freedesktop.secrets: stay signed in'
            'fuse3: iCloud Drive and Photos as folders in the file manager')
# !lto: makepkg's -flto=auto turns the C and assembly in ring and sqlite into
# bitcode that links to nothing. !debug: the release profile strips symbols.
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4e020bee301d336b59900482f785fbae5bc23952931fdaccc6471420818f10b2')

prepare() {
  cd "Skykeep-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
  npm ci --no-audit --no-fund
}

build() {
  cd "Skykeep-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # the web front end first, cargo builds it into the binary
  npm run build
  cargo build --release --frozen -p quince-app
}

package() {
  cd "Skykeep-${pkgver}"
  local _id=io.github.yashwanthkamireddi.Skykeep size

  # The same files as upstream's packaging/arch/PKGBUILD, with the launcher
  # named after the app ID.
  install -Dm755 target/release/quince-app "$pkgdir/usr/bin/skykeep"

  sed -e 's/{{name}}/Skykeep/' \
      -e 's/{{comment}}/Your iCloud, on this computer/' \
      -e 's/{{exec}}/skykeep/g' \
      -e "s/{{icon}}/$_id/" \
      -e 's/{{categories}}/Office;Calendar;ContactManagement;/' \
      "packaging/$_id.desktop.in" > "$srcdir/$_id.desktop"
  install -Dm644 "$srcdir/$_id.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 packaging/apps/*.desktop -t "$pkgdir/usr/share/applications"

  sed "s|>Skykeep.desktop<|>$_id.desktop<|" "packaging/$_id.metainfo.xml" \
    > "$srcdir/$_id.metainfo.xml"
  install -Dm644 "$srcdir/$_id.metainfo.xml" -t "$pkgdir/usr/share/metainfo"

  for size in 16x16:16x16 24x24:24x24 32x32:32x32 48x48:48x48 64x64:64x64 \
              128x128:128x128 256x256:128x128@2x 512x512:icon; do
    install -Dm644 "src-tauri/icons/${size#*:}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size%%:*}/apps/$_id.png"
  done

  # search results in GNOME Shell and KRunner
  sed "s|^DesktopId=Skykeep.desktop$|DesktopId=$_id.desktop|" \
    "packaging/$_id.search-provider.ini" > "$srcdir/$_id.search-provider.ini"
  install -Dm644 "$srcdir/$_id.search-provider.ini" \
    -t "$pkgdir/usr/share/gnome-shell/search-providers"
  install -Dm644 "packaging/$_id.SearchProvider.service" \
    -t "$pkgdir/usr/share/dbus-1/services"
  install -Dm644 "packaging/$_id.krunner.desktop" \
    -t "$pkgdir/usr/share/krunner/dbusplugins"
}

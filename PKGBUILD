# Maintainer: Your Name <your-email@example.com>
pkgname=shortwave-artix-native
pkgver=5.1.0
pkgrel=1
pkgdesc="Shortwave 5.1.0 natively built for Artix (Systemd-free & CPU Optimized)"
arch=('x86_64')
url="https://gitlab.gnome.org/World/Shortwave"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'libshumate' 'libpeas-2' 'glycin-gtk4' 'sqlite' 'gst-plugins-bad' 'desktop-file-utils')
makedepends=('git' 'meson' 'ninja' 'cargo' 'gettext')
provides=('shortwave')
conflicts=('shortwave' 'shortwave-git')
source=("git+https://gitlab.gnome.org/World/Shortwave.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "Shortwave"

  # Generic but high-performance optimizations (v3 = AVX2/FMA)
  export CFLAGS="-march=x86-64-v3 -O3 -pipe"
  export CXXFLAGS="-march=x86-64-v3 -O3 -pipe"
  # Rust equivalent for x86-64-v3
  export RUSTFLAGS="-C target-cpu=x86-64-v3"

  arch-meson . builddir --buildtype=release
  meson compile -C builddir
}

package() {
  cd "Shortwave"
  DESTDIR="$pkgdir" meson install -C builddir

  # Phase 4 of your guide: Artix/Systemd-free Fixes
  # Fix GSettings schema path in the .desktop file
  sed -i "s|^Exec=.*|Exec=env GSETTINGS_SCHEMA_DIR=/usr/share/glib-2.0/schemas/ shortwave %U|" \
      "$pkgdir/usr/share/applications/de.haeckerfelix.Shortwave.desktop"

  # Fix the D-Bus service for non-systemd environments
  sed -i 's|^Exec=.*|Exec=/usr/bin/shortwave --gapplication-service|' \
      "$pkgdir/usr/share/dbus-1/services/de.haeckerfelix.Shortwave.service"
}

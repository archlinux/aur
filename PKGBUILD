# Maintainer: sigmasd

pkgname=shortwave-bin-hack
pkgver=1570577
pkgrel=4
pkgdesc="Find and listen to internet radio stations.
This pkg uses the flatpak version and intercepts libc functions to make it work"
arch=(any)
url="https://gitlab.gnome.org/World/Shortwave/"
license=(GPL)
provides=("shortwave")
conflicts=("shortwave")
makedepends=(cargo ostree)
depends=('gst-plugins-bad' 'libadwaita' 'libsoup')
source=("$url-/jobs/$pkgver/artifacts/download?file_type=archive" "fix_flatpak.rs" "shortwave")
sha256sums=('fefe532b4896b7d03ed0b2d2bab3aa429af19944ef4fb105490b8a0345cafbd9'
            'c9f1bc05e916ab429ffa2b18cca2f63e7cad4ce2a5dfa9c99d19c6db3d4fb4de'
            'bdd3140b737646d38e801d7cfa2092e47126b968e32ffe32250c9046ddc76a6a')

prepare() {
    # Build flatpak-fix dylib
    rustc --crate-type dylib fix_flatpak.rs
}

package() {
  # Extract flatpak
  ostree init --repo=shortwave_repo
  ostree --repo=shortwave_repo config set core.min-free-space-percent 0
  ostree static-delta apply-offline --repo=shortwave_repo shortwave-dev.flatpak
  commit=$(find -name "*commit" | cut -d/ --output-delimiter= -f4- | tr -d '\0' | xargs -i basename {} .commit)
  ostree --repo=shortwave_repo checkout -U $commit shortwave_build

  # Entry point
  install -Dm755 "$srcdir/shortwave_build/files/bin/shortwave" "$pkgdir/usr/share/shortwave/shortwave"

  # Extra (desktop,icons)
  rm -rf "$srcdir/shortwave_build/export/share/dbus-1"
  sed -i "s/DBusActivatable=true//" "$srcdir/shortwave_build/export/share/applications/de.haeckerfelix.Shortwave.Devel.desktop"
  cp -r "$srcdir/shortwave_build/export/share/" "$pkgdir/usr/"

  # Actual program
  install -m755 "$srcdir/shortwave_build/files/share/shortwave/de.haeckerfelix.Shortwave.Devel.gresource" "$pkgdir/usr/share/shortwave/"
  install -m755 "$srcdir/libfix_flatpak.so" "$pkgdir/usr/share/shortwave/"
  install -Dm755 "$srcdir/shortwave" "$pkgdir/usr/bin/shortwave"

  # Gschema
  install -Dm755 "$srcdir/shortwave_build/files/share/glib-2.0/schemas/de.haeckerfelix.Shortwave.gschema.xml" "$pkgdir/usr/share/glib-2.0/schemas/de.haeckerfelix.Shortwave.gschema.xml"
}

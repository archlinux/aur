# Maintainer: sigmasd

pkgname=shortwave-bin-hack
pkgver=1570577
pkgrel=1
pkgdesc="Find and listen to internet radio stations."
arch=(any)
url="https://gitlab.gnome.org/World/Shortwave/"
license=(GPL)
makedepends=(cargo ostree)
depends=('gst-plugins-bad' 'libadwaita' 'libsoup')
source=("$url-/jobs/$pkgver/artifacts/download?file_type=archive" "fix_flatpak.rs" "shortwave")
sha256sums=('889a9c1da5eb508996e7593d0bcb7f21365ec1db56420b671bf2c53d1693ebdc'
            'f51670378a964043ad835ee0c6fba088056c111762831e320fbfe5093a307aae'
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

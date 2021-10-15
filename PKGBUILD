# Maintainer: sigmacool

pkgname=shortwave-bin-hack
pkgver=f6e31bf9
pkgrel=1
pkgdesc="Find and listen to internet radio stations."
arch=(any)
url="https://gitlab.gnome.org/World/Shortwave/"
license=(GPL)
makedepends=(rustup ostree glib2)
depends=('gst-plugins-bad' 'libadwaita' 'libsoup')
source=("$url-/jobs/1557054/artifacts/download?file_type=archive" "fix_flatpak.rs" "shortwave")
sha256sums=('5b72f434160dce871c902218e8bfd3053ce54a028ec9b2a725356c8326e7d8d8'
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
  ostree --repo=shortwave_repo checkout -U c6d9bca966412dc84cf01f6bbceffb7964b401e880d4387599db32111dd4c3c6 shortwave_build


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

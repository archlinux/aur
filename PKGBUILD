# Maintainer: sigmasd

pkgname=shortwave-bin-hack
pkgver=1673135
pkgrel=2
pkgdesc="Find and listen to internet radio stations.
This pkg uses a fork and some hacks to make it work, checkout (https://aur.archlinux.org/packages/shortwave-bin-hack/) for more infos."
arch=(any)
url="https://gitlab.gnome.org/World/Shortwave/"
license=(GPL)
provides=("shortwave")
conflicts=("shortwave")
makedepends=(cargo)
depends=('gst-plugins-bad' 'libadwaita' 'libsoup')
# use fork in order to comment out gtk4.6 usage
source=("https://gitlab.gnome.org/sigmaSd/Shortwave/-/jobs/$pkgver/artifacts/download" "fix_flatpak.rs" "shortwave")

sha256sums=('c5a02e584f9152d0735d38174e0fa8c1e5a58d4a8f6517b20c846a95740c4c15'
            '7fabb61c7bf97396ced87e1e45064c38cdf8fde2f3f1f52030706293132f6843'
            '58f061f909b6a8eff030ba1058a3c70c3ca3680ed13b865a118671388a3f3a9d')


prepare() {
    # Build flatpak-fix dylib
    rustc -O --crate-type cdylib fix_flatpak.rs
}

package() {
  # Entry point
  install -Dm755 "$srcdir/app/files/bin/shortwave" "$pkgdir/usr/share/shortwave/shortwave"

  # Cleanup pkg and install Extra (desktop,icons)
  sed "s%Exec=/app%Exec=/usr%" -i "$srcdir/app/files/share/dbus-1/services/de.haeckerfelix.Shortwave.service"
  rm "$srcdir/app/files/share/applications/mimeinfo.cache"
  rm "$srcdir/app/files/share/glib-2.0/schemas/gschemas.compiled"
  rm "$srcdir/app/files/share/icons/hicolor/icon-theme.cache"
  cp -r "$srcdir/app/files/share/" "$pkgdir/usr/"

  # Actual program
  install -m755 "$srcdir/libfix_flatpak.so" "$pkgdir/usr/share/shortwave/"
  install -m755 "$srcdir/app/files/lib/libshumate-0.0.so.0.0" "$pkgdir/usr/share/shortwave/libshumate-0.0.so.0"
  install -Dm755 "$srcdir/shortwave" "$pkgdir/usr/bin/shortwave"

  # Gschema
  install -Dm755 "$srcdir/app/files/share/glib-2.0/schemas/de.haeckerfelix.Shortwave.gschema.xml" "$pkgdir/usr/share/glib-2.0/schemas/de.haeckerfelix.Shortwave.gschema.xml"
}

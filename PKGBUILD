# Maintainer: Dråfølin <derg at drafolin dot ch>

_pkgname=tidalwave
pkgname="${_pkgname}-git"

pkgver=r335.c1ac176
pkgver() {
    cd "${_pkgname}"
    ( set -o pipefail
      git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}
pkgrel=2

pkgdesc="Unofficial native GTK4 / Adwaita music streaming client for TIDAL"
arch=("x86_64")
url="https://codeberg.org/dergs/TidalWave"
license=("GPL-3.0-or-later")

depends=(gtk4 gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad)
makedepends=(git go)
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")

source=("${_pkgname}::git+https://codeberg.org/dergs/TidalWave.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/${_pkgname}"
    go build -ldflags="-X codeberg.org/derg/tidalwave/internal/ui.Commit=$(git describe --tags --long --abbrev=7 2>/dev/null || git rev-parse HEAD 2>/dev/null)" ./cmd/tidalwave
}

package() {
    cd "$srcdir/${_pkgname}"
    install -Dm0755 "tidalwave" "$pkgdir/usr/bin/${_pkgname}"
    install -Dm0644 "internal/icons/hicolor/256x256/apps/dev.dergs.tidalwave.png" -t "$pkgdir/usr/share/icons/hicolor/256x256/apps"
    install -Dm0644 "internal/settings/dev.dergs.tidalwave.gschema.xml" -t "$pkgdir/usr/share/glib-2.0/schemas"
    install -Dm0644 "build/dev.dergs.tidalwave.desktop" -t "$pkgdir/usr/share/applications"
    glib-compile-schemas "$pkgdir/usr/share/glib-2.0/schemas"
}

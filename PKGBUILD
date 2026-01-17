# Maintainer: Dråfølin <derg at drafolin dot ch>

_pkgname=tonearm
pkgname="${_pkgname}-git"

pkgver=r365.035669a
pkgver() {
    cd "${_pkgname}"
    ( set -o pipefail
      git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}
pkgrel=1

pkgdesc="Unofficial native GTK4 / Adwaita music streaming client for TIDAL"
arch=("x86_64")
url="https://codeberg.org/dergs/Tonearm"
license=("GPL-3.0-or-later")

depends=(gtk4 gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad libadwaita)
makedepends=(git go)
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")

source=("${_pkgname}::git+https://codeberg.org/dergs/Tonearm.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/${_pkgname}"
    go build -ldflags="-X codeberg.org/derg/tonearm/internal/ui.Commit=$(git describe --tags --long --abbrev=7 2>/dev/null || git rev-parse HEAD 2>/dev/null)" ./cmd/tonearm
}

package() {
    cd "$srcdir/${_pkgname}"
    install -Dm0755 "tonearm" "$pkgdir/usr/bin/${_pkgname}"
    install -Dm0644 "internal/icons/hicolor/256x256/apps/dev.dergs.Tonearm.png" -t "$pkgdir/usr/share/icons/hicolor/256x256/apps"
    install -Dm0644 "internal/icons/hicolor/scalable/apps/dev.dergs.Tonearm.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -Dm0644 "internal/icons/hicolor/symbolic/apps/dev.dergs.Tonearm-symbolic.svg" -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps"
    install -Dm0644 "internal/settings/dev.dergs.Tonearm.gschema.xml" -t "$pkgdir/usr/share/glib-2.0/schemas"
    install -Dm0644 "build/dev.dergs.Tonearm.desktop" -t "$pkgdir/usr/share/applications"
}

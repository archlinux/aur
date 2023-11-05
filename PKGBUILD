# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Maintainer: Vitaly Ankh <vitalyankh@gmail.com>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgbase=libnma-git
pkgname=(libnma-common-git libnma-git libnma-gtk4-git)
pkgver=1.10.7.dev.r2.d48911ca
pkgrel=1
pkgdesc="NetworkManager GUI client library"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/libnma"
license=('GPL' 'LGPL')
depends=('gcr-4' 'libnm' 'gtk4' 'gtk3' 'gcc-libs')
makedepends=('git' 'meson' 'mobile-broadband-provider-info' 'iso-codes' 'gobject-introspection' 'gtk-doc' 'vala' 'dconf' 'gtk3' 'gtk4' 'libnm-git')
source=('git+https://gitlab.gnome.org/GNOME/libnma')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'  )"

}

build() {
  arch-meson libnma build -D libnma_gtk4=true
  meson compile -C build
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_libnma-common-git() {
  pkgdesc+=" (common files git version)"
  depends=(
    dconf
    gcr-4
    iso-codes
    libnm
    mobile-broadband-provider-info
  )
  conflicts=(libnma-common)

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  _pick gtk3 usr/lib/libnma.so*
  _pick gtk3 usr/lib/pkgconfig/libnma.pc
  _pick gtk3 usr/lib/girepository-1.0/NMA-*
  _pick gtk3 usr/share/gir-1.0/NMA-*
  _pick gtk3 usr/share/vala/vapi/libnma.*

  _pick gtk4 usr/lib/libnma-gtk4.so*
  _pick gtk4 usr/lib/pkgconfig/libnma-gtk4.pc
  _pick gtk4 usr/lib/girepository-1.0/NMA4-*
  _pick gtk4 usr/share/gir-1.0/NMA4-*
  _pick gtk4 usr/share/vala/vapi/libnma-gtk4.*

  # Moved to network-manager-applet 1.30.0
  # https://bugs.archlinux.org/task/76489
  rm usr/share/glib-2.0/schemas/org.gnome.nm-applet.gschema.xml
}

package_libnma-git() {
  pkgdesc+=" (GTK3 git version)"
  depends=(libnma-common="$pkgver-$pkgrel" gtk3)
  provides=(libnma.so)
  conflicts=(libnma)

  mv gtk3/* "$pkgdir"
}

package_libnma-gtk4-git() {
  pkgdesc+=" (GTK4 git version)"
  depends=(libnma-common="$pkgver-$pkgrel" gtk4)
  provides=(libnma-gtk4.so)
  conflicts=(libnma-gtk3)

  mv gtk4/* "$pkgdir"
}


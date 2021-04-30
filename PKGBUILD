# Based on "upstream" by
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gtk3-no_deadkeys_underline
pkgver=3.24.29
pkgrel=1
epoch=1
pkgdesc="Like gtk3 in extra but with a patch to disable dead keys having an underline below them while typing"
arch=(x86_64)
url="https://www.gtk.org/"
depends=(atk cairo libxcursor libxinerama libxrandr libxi libepoxy gdk-pixbuf2
         dconf libxcomposite libxdamage pango shared-mime-info at-spi2-atk
         wayland libxkbcommon adwaita-icon-theme json-glib librsvg
         wayland-protocols desktop-file-utils mesa cantarell-fonts colord rest
         libcups libcanberra fribidi iso-codes libcloudproviders
         gtk-update-icon-cache)
makedepends=(gobject-introspection gtk-doc git glib2-docs sassc meson)
provides=(gtk3-print-backends libgtk-3.so libgdk-3.so libgailutil-3.so gtk3)
conflicts=(gtk3-print-backends gtk3)
replaces=("gtk3-print-backends<=3.22.26-1")
license=(LGPL)
install=gtk3.install
_commit=77f32a69c0a35ffd3a1a542a6057c1c6d13c793d  # tags/3.24.29^0
source=("git+https://gitlab.gnome.org/GNOME/gtk.git#commit=$_commit"
        gtk-query-immodules-3.0.hook
        no_deadkeys_underline.patch
        c26525f87c885929eccf248dd8cae2a2cf28b819.patch
        a0cdd25bd4274d6ff12162de3d416326ec0429e4.patch
        7b3c387af9e9c6c37c5751258ded6708094d4c73.patch
        41c3e9873cf2b388d4a91fbd86c360d53b1a00da.patch
        59397005fa8136dd73079d75b0575b00f114ce35.patch
        58b3145c90a4681bf1ee026f58e12bfb5cafe81a.patch
        8c7846733aa5e2bac866d8b8ac9eb4d8d1d6f527.patch
        b69790a7760647efcfbd7a4cd582a3824fa34ae4.patch
        ed9b3f505718f9a877f5029a002bd097635840fc.patch)
sha256sums=('SKIP'
            'a0319b6795410f06d38de1e8695a9bf9636ff2169f40701671580e60a108e229'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd gtk
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gtk
  patch -p1 -R < ../ed9b3f505718f9a877f5029a002bd097635840fc.patch
  patch -p1 -R < ../b69790a7760647efcfbd7a4cd582a3824fa34ae4.patch
  patch -p1 -R < ../8c7846733aa5e2bac866d8b8ac9eb4d8d1d6f527.patch
  patch -p1 -R < ../58b3145c90a4681bf1ee026f58e12bfb5cafe81a.patch
  patch -p1 -R < ../59397005fa8136dd73079d75b0575b00f114ce35.patch
  patch -p1 -R < ../41c3e9873cf2b388d4a91fbd86c360d53b1a00da.patch
  patch -p1 -R < ../7b3c387af9e9c6c37c5751258ded6708094d4c73.patch
  patch -p1 -R < ../a0cdd25bd4274d6ff12162de3d416326ec0429e4.patch
  patch -p1 -R < ../c26525f87c885929eccf248dd8cae2a2cf28b819.patch
  patch -p1 < ../no_deadkeys_underline.patch
}

build() {
  CFLAGS+=" -DG_ENABLE_DEBUG -DG_DISABLE_CAST_CHECKS"
  local meson_options=(
    -D broadway_backend=true
    -D cloudproviders=true
    -D tracker3=false
    -D colord=yes
    -D gtk_doc=true
    -D man=true
  )

  arch-meson gtk build "${meson_options[@]}"
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

package() {
  DESTDIR="$pkgdir" meson install -C build

  install -Dm644 /dev/stdin "$pkgdir/usr/share/gtk-3.0/settings.ini" <<END
[Settings]
gtk-icon-theme-name = Adwaita
gtk-theme-name = Adwaita
gtk-font-name = Cantarell 11
END

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 gtk-query-immodules-3.0.hook

  cd "$pkgdir"

  rm usr/bin/gtk-update-icon-cache
  rm usr/share/man/man1/gtk-update-icon-cache.1

  _pick docs usr/share/gtk-doc

  _pick demo usr/bin/gtk3-{demo,demo-application,icon-browser,widget-factory}
  _pick demo usr/share/applications/gtk3-{demo,icon-browser,widget-factory}.desktop
  _pick demo usr/share/glib-2.0/schemas/org.gtk.Demo.gschema.xml
  _pick demo usr/share/icons/hicolor/*/apps/gtk3-{demo,widget-factory}[-.]*
  _pick demo usr/share/man/man1/gtk3-{demo,demo-application,icon-browser,widget-factory}.1
}

# vim:set ts=2 sw=2 et:

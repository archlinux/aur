# Maintainer: Syboxez Blank <@Syboxez:matrix.org>
pkgbase=gtk4-git
pkgname=(gtk4-git gtk-update-icon-cache-git)
pkgver=4.7.1.r138.gaf6432aa67
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit (GIT Version)"
arch=('x86_64')
url="https://www.gtk.org/"
license=('LGPL')
depends=('at-spi2-atk' 'cairo' 'atk' 'dconf' 'glib2' 'libepoxy' 'fribidi'
         'libxcomposite' 'libxcursor' 'libxinerama' 'libxkbcommon' 'libxrandr' 'mesa'
         'pango' 'graphene' 'json-glib' 'shared-mime-info' 'gdk-pixbuf2' 'colord'
         'libcups' 'rest' 'vulkan-icd-loader' 'gst-plugins-bad-libs' 'wayland'
         'vulkan-headers' 'libcloudproviders' 'libglvnd' 'iso-codes' 'harfbuzz'
         'tracker3' 'libx11' 'libxrender' 'libxi' 'libxext' 'libxdamage' 'libxfixes'
         'fontconfig' 'ffmpeg' 'librsvg' 'desktop-file-utils' 'adwaita-icon-theme'
         'cantarell-fonts')
makedepends=('gobject-introspection' 'cmake' 'git' 'meson' 'wayland-protocols'
             'sysprof' 'python' 'shaderc' 'sassc' 'glib2-docs' 'pandoc' 'python-toml'
             'python-jinja' 'python-typogrify' 'python-pygments' 'libxslt' 'docbook-xsl'
             'gi-docgen' 'python-docutils')
source=('git+https://gitlab.gnome.org/GNOME/gtk.git'
        'gtk4-querymodules.hook'
        'gtk4-update-icon-cache.hook'
        'gtk4-update-icon-cache.script'
        'settings.ini')
sha512sums=('SKIP'
            '4adbad5b238d8326edb066de9f27bf07894137b4cb9b8a38325b80a89f928fce89c268b2270cf8bc6ca4cf311f0674bf1a756e0e28f59771e694559e1a551a6a'
            '6b7d8ecf0e98dcb35fac0c5dc96feb4d66c060c4a19801eac385827a601ae430223b3731d0de0845b0cae50e8169a95b1c13357281ca5a7c2c1ca1930163cad9'
            '05929a7816b0fb45918850d172a375a2e6915a75db879fcc2fbe3b58864e76cc50a7767645a545f48b0d15417f30d1b205a77cfd6396a66df49b28f846bf5bbb'
            '1642d77622d61234e316e8fcbc803a6a5556c606e37e56aa5981ef2f2df85bfa959c31b5d1bff248b340760e1178281cb0d7abdf540c5f7d4b62cb383a67c685')
pkgver() {
  cd gtk

  printf "%s.r%s.g%s" "$(grep -m1 'version' meson.build | sed -r 's/([^0-9]*([0-9.]+)).*/\2/')" \
                      "$(git describe --tags --long | cut -d '-' -f 2)" \
                      "$(git rev-parse --short HEAD)"
}

prepare() {
 cd gtk
}

build() {
  CFLAGS+=" -DG_ENABLE_DEBUG -DG_DISABLE_CAST_CHECKS"
  # NOTE: We cannot use arch-meson _yet_ due to building with the gtk_doc flag
  #       as gi-docgen's official upstream guidance is to include the dep. as
  #       a subproject (which arch-meson disallows). See:
  #       https://gitlab.gnome.org/ebassi/gi-docgen/-/issues/60#note_1060533
  meson setup --prefix /usr \
    --libexecdir lib \
    --sbindir bin \
    --buildtype plain \
    --auto-features enabled \
    -Db_lto=true \
    -Db_pie=true \
    -Dbroadway-backend=true \
    -Dcloudproviders=enabled \
    -Dsysprof=enabled \
    -Dtracker=enabled \
    -Dcolord=enabled \
    -Dgtk_doc=true \
    -Dman-pages=true \
    -Dvulkan=enabled \
    -Dwayland-backend=true \
    gtk build

  meson compile -C build
  ninja -C build
}

package_gtk4-git() {
  depends+=('gtk-update-icon-cache-git')
  provides+=('gtk4' 'pango' 'gtk4-demos')
  conflicts=('gtk4' 'pango' 'gtk4-demos')

  DESTDIR="$pkgdir" meson install -C build

  install -Dm 644 "settings.ini" "$pkgdir"/usr/share/gtk-4.0/settings.ini
  install -Dm 644 "gtk4-querymodules.hook" "$pkgdir"/usr/share/libalpm/hooks/gtk4-querymodules.hook

  # gtk-update-icon-cache us also used by other toolkits
  mkdir -p guic/usr/{bin,share/man/man1}
  mv {"$pkgdir",guic}/usr/bin/gtk4-update-icon-cache
  mv {"$pkgdir",guic}/usr/share/man/man1/gtk4-update-icon-cache.1
}

package_gtk-update-icon-cache-git() {
  pkgdesc="GTK icon cache updater"
  depends=('gdk-pixbuf2' 'librsvg' 'hicolor-icon-theme')
  conflicts=('gtk-update-icon-cache')
  provides+=('gtk-update-icon-cache')

  mv -t "$pkgdir" guic/*
  ln -s gtk4-update-icon-cache "$pkgdir/usr/bin/gtk-update-icon-cache"
  ln -s gtk4-update-icon-cache.1 "$pkgdir/usr/share/man/man1/gtk-update-icon-cache.1"

  install -Dm 644 "gtk4-update-icon-cache.hook" "$pkgdir"/usr/share/libalpm/hooks/gtk-update-icon-cache.hook
  install -Dm 755 "gtk4-update-icon-cache.script" "$pkgdir"/usr/share/libalpm/scripts/gtk-update-icon-cache
}

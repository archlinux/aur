# Maintainer: Andrew Crerar <andrew (at) crerar (dot) io>

pkgname=(gtk4-git)
pkgver=3.94.0.r400.g0edec9bcae
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit (GIT Version)"
arch=('x86_64')
url="https://www.gtk.org/"
license=('LGPL')
depends=('at-spi2-atk' 'cairo' 'atk' 'dconf' 'glib2' 'libepoxy'
         'libxcomposite' 'libxcursor' 'libxinerama' 'libxkbcommon' 'libxrandr' 'mesa'
         'pango' 'wayland' 'graphene' 'json-glib'
         'gdk-pixbuf2' 'wayland-protocols'
         'colord' 'libcups' 'rest' 'vulkan-icd-loader' 'gst-plugins-bad')
makedepends=('gobject-introspection' 'gtk-doc' 'git' 'meson' 'ninja' 'vulkan-headers')
optdepends=('gnome-icon-theme: Default icon theme'
            'gnome-themes-standard: Default widget theme'
            'hicolor-icon-theme: Freedesktop.org Hicolor icon theme'
            'gdk-pixbuf2: An image loading library')
source=('git+https://gitlab.gnome.org/GNOME/gtk.git'
        'gtk4.install'
        'gtk4-query-immodules.hook'
        'gtk4-update-icon-cache.hook'
        'gtk4-update-icon-cache.script'
        'settings.ini')
sha512sums=('SKIP'
            '5dcb698a15e7d5f4611c9357782d475052944cc71e73351238ffb5dfbe18d1bd1b62289da7f8066cde256c4339de5efa982088f47781876f5d8317f92b87f79f'
            '1dbcce0a3e17ee05b579613adba25feff692f6626155e91fa6859e5f176753201b5ceffa8c9c7c897cf945aeeb32fbd28affa24050dfc0d65237733964bf28de'
            '9d3bb80afb3a00dc50402d32476719daaeab017e1a066425bb602316b534d0a9899d48734a84f70af1066ed104df0491264383a34969dfad2ea9828fb41b9b6b'
            '805cf12606c738d0442d8af415223d3faada93c933b563b7c4c1d5e0c16d2d21435406add1fcc69300fb2fe534f2d0ddbf50b2c0463fc7462109d0f7802ccef1'
            '1642d77622d61234e316e8fcbc803a6a5556c606e37e56aa5981ef2f2df85bfa959c31b5d1bff248b340760e1178281cb0d7abdf540c5f7d4b62cb383a67c685')
pkgver() {
  cd gtk

  printf "%s.r%s.g%s" "$(grep -m1 'version' meson.build | sed -r 's/([^0-9]*([0-9.]+)).*/\2/')" \
                      "$(git describe --tags --long | cut -d '-' -f 2)" \
                      "$(git rev-parse --short HEAD)"
}

build() {
  cd gtk

  meson --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libdir=lib \
    -Dbroadway-backend=true \
    -Dvulkan=yes \
    _build .

  cd _build

  ninja
}

package() {
  install="gtk4.install"

  cd gtk/_build

  DESTDIR="$pkgdir" ninja install

  install -Dm 644 "../../settings.ini" "$pkgdir"/usr/share/gtk-4.0/settings.ini
  install -Dm 644 "../../gtk4-query-immodules.hook" "$pkgdir"/usr/share/libalpm/hooks/gtk4-query-immodules.hook
  install -D "gtk/tools/gtk4-update-icon-cache" "$pkgdir"/usr/bin/gtk4-update-icon-cache
  install -Dm 644 "../../gtk4-update-icon-cache.hook" "$pkgdir"/usr/share/libalpm/hooks/gtk4-update-icon-cache.hook
  install -Dm 755 "../../gtk4-update-icon-cache.script" "$pkgdir"/usr/share/libalpm/scripts/gtk4-update-icon-cache

}

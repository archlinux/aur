# Maintainer: Andrew Crerar <andrew (at) crerar (dot) io>

pkgbase=gtk4-git
pkgname=(gtk4-git)
pkgver=3.91.2.r297.gaf5d3e3299
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit (GIT Version)"
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
license=('LGPL')
depends=('at-spi2-atk'
         'atk-git>=2.15.1'
         'dconf'
         'glib2-git>=2.53.4'
         'libepoxy>=1.0'
         'libxcomposite'
         'libxcursor'
         'libxinerama'
         'libxkbcommon'
         'libxrandr'
         'mesa'
         'pango-git>=1.37.3'
         'wayland-git>=1.9.91'
         'graphene>=1.5.1')
makedepends=('gobject-introspection-git'
             'gtk-doc'
             'git'
             'colord'
             'rest'
             'libcups'
             'meson'
             'ninja')
optdepends=('gnome-icon-theme: Default icon theme'
            'gnome-themes-standard: Default widget theme'
            'hicolor-icon-theme: Freedesktop.org Hicolor icon theme'
            'gdk-pixbuf2: An image loading library')
backup=('usr/share/gtk-4.0/settings.ini')
source=('git+https://git.gnome.org/browse/gtk+'
        'gtk4.install'
        'gtk4-query-immodules.hook'
        'gtk4-update-icon-cache.hook'
        'gtk4-update-icon-cache.script'
        'settings.ini')
sha512sums=('SKIP'
            '5dcb698a15e7d5f4611c9357782d475052944cc71e73351238ffb5dfbe18d1bd1b62289da7f8066cde256c4339de5efa982088f47781876f5d8317f92b87f79f'
            '1dbcce0a3e17ee05b579613adba25feff692f6626155e91fa6859e5f176753201b5ceffa8c9c7c897cf945aeeb32fbd28affa24050dfc0d65237733964bf28de'
            'abfd73de4faa6f53784182800395aa3c39bb98e15a0eb300fb4142073ff7ce565a0836a2363393b2f132060b5293dbc0c30c380a023f38d5bd39c62cb58389c2'
            '5cd50d93bb6bc203438a2a0764bd717409658e124058b18a1da26a21f10ef7564a16f32fc0633a68b45b2e303fa63a5efefeadd6b0bf1d7f474556df8cdb6c58'
            '1642d77622d61234e316e8fcbc803a6a5556c606e37e56aa5981ef2f2df85bfa959c31b5d1bff248b340760e1178281cb0d7abdf540c5f7d4b62cb383a67c685')
pkgver() {
  cd gtk+

  printf "%s.r%s.g%s" "$(grep -m1 'version' meson.build | sed -r 's/([^0-9]*([0-9.]+)).*/\2/')" \
                      "$(git describe --tags --long | cut -d '-' -f 2)" \
                      "$(git rev-parse --short HEAD)"
}

build() {
  cd gtk+

  meson --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    -Denable-broadway-backend=true \
    _build .

  cd _build

  ninja
}

package_gtk4-git() {
  install="gtk4.install"

  cd gtk+/_build

  DESTDIR="$pkgdir" ninja install

  install -Dm644 "../../settings.ini" "$pkgdir/usr/share/gtk-4.0/settings.ini"
  install -Dm644 ../../gtk4-query-immodules.hook "$pkgdir/usr/share/libalpm/hooks/gtk4-query-immodules.hook"
}


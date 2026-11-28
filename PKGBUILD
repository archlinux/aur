# Maintainer: sfslinux <sfslinux@gmail.com>

pkgname=libadwaita-theme-colors
pkgver=1.0.0
pkgrel=1
pkgdesc="Give libadwaita apps the colors of the active GTK theme (Greybird, Arc, ...)"
arch=('x86_64')
url="https://aur.archlinux.org/packages/$pkgname"
license=('GPL-3.0-or-later')
depends=('glib2' 'gtk3' 'gtk4' 'libadwaita>=1:1.7') # 1.7: Adw.ToggleGroup
makedepends=('vala')
optdepends=('gsettings-desktop-schemas: switch the light/dark color scheme to match the theme')
install=$pkgname.install
source=('gtk2adw-cli.c'
        'gtk2adw.vala'
        'help.vala'
        'io.github.Gtk2Adw.desktop')
sha256sums=('83bb0eb576c3421d46f9d15a75e91572d58f51cc43dba4623a18bf4aaedc46b2'
            '8d4adcca30880b2b0dd4659c4779967fe2b31abae9096e5a55d8eedce23d01c4'
            'f783c81a4e1d9134f0600a4f09bee65cf76a0e6fffc9de3343b9b1d85a017f5f'
            'a95b0ee2d09a9e1c17166302f1c1b53970d3ffcaa3bb6995392b3bfd903b9252')

build() {
  # LDFLAGS before the libraries, so --as-needed drops the unused ones.
  ${CC:-cc} $CPPFLAGS $CFLAGS $LDFLAGS -o gtk2adw-cli gtk2adw-cli.c \
    $(pkg-config --cflags --libs gtk+-3.0)

  # The GUI is libadwaita/GTK4 and runs the GTK3 CLI as a subprocess: one process cannot load both.
  # -w: warnings in valac-generated C (string[] vs const char**) are not actionable here.
  valac --ccode --pkg libadwaita-1 gtk2adw.vala help.vala
  ${CC:-cc} $CPPFLAGS $CFLAGS -w $LDFLAGS -o gtk2adw gtk2adw.c help.c \
    $(pkg-config --cflags --libs libadwaita-1)
}

package() {
  install -Dm755 gtk2adw gtk2adw-cli -t "$pkgdir/usr/bin/"
  install -Dm644 io.github.Gtk2Adw.desktop -t "$pkgdir/usr/share/applications/"
}

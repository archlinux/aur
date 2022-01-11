# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Baptiste Grenier <baptiste@bapt.name>
# Contributor: Pablo Olmos de Aguilera Corradini <pablo <at] glatelier (dot} org>
# Contributor: Sander van Kasteel <info at sandervankasteel dot nl>
pkgname=gtg-git
pkgver=0.5.r149.ge37572b3
pkgrel=3
pkgdesc="Getting Things GNOME! is a personal tasks and TODO-list items organizer for GNOME"
url="https://wiki.gnome.org/Apps/GTG"
arch=('x86_64')
license=('GPL')
depends=('gtk3' 'gtksourceview4' 'libsecret' 'python-caldav' 'python-gobject'
         'python-liblarch-git' 'python-lxml')
makedepends=('git' 'itstool' 'meson')
optdepends=('python-cheetah3: for the Export and print plugin'
            'texlive-bin: pdflatex, for the Export and print plugin'
            'texlive-core: pdfjam, for the Export and print plugin'
            'pdftk: for the Export and print plugin'
            'hamster-time-tracker: send a task to the Hamster time tracking applet'
            'yelp: view user manual')
checkdepends=('gtk4' 'python-nose' 'python-mock')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/getting-things-gnome/gtg.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  sed -i "s/from gi.repository import Gtk, GLib, Gdk, GObject, GtkSource/import gi\ngi.require_version('GtkSource', '4')\nfrom gi.repository import Gtk, GLib, Gdk, GObject, GtkSource/g" \
    GTG/gtk/editor/taskview.py
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  cd "$srcdir/${pkgname%-git}"
  python run-tests
}

package() {
  meson install -C build --destdir "$pkgdir"
}

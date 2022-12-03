# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Baptiste Grenier <baptiste@bapt.name>
# Contributor: Pablo Olmos de Aguilera Corradini <pablo <at] glatelier (dot} org>
# Contributor: Sander van Kasteel <info at sandervankasteel dot nl>
pkgname=gtg-git
pkgver=0.6.r71.g25dfa55e
pkgrel=2
pkgdesc="Getting Things GNOME! is a personal tasks and TODO-list items organizer for GNOME"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/GTG"
license=('GPL')
depends=('gtk3' 'gtksourceview4' 'libsecret' 'python-gobject'
         'python-liblarch-git' 'python-lxml')
makedepends=('git' 'itstool' 'meson')
checkdepends=('python-caldav' 'python-mock' 'python-pytest') ## TODO: Drop python-mock: https://archlinux.org/todo/drop-python-mock-checkdepends/
optdepends=('python-caldav: CalDAV syncronization'
            'python-cheetah3: for the Export and print plugin'
            'texlive-bin: pdflatex, for the Export and print plugin'
            'texlive-core: pdfjam, for the Export and print plugin'
            'pdftk: for the Export and print plugin'
            'hamster-time-tracker: send a task to the Hamster time tracking applet'
            'yelp: view user manual')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/getting-things-gnome/gtg.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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

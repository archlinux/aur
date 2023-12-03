# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Baptiste Grenier <baptiste@bapt.name>
# Contributor: Pablo Olmos de Aguilera Corradini <pablo <at] glatelier (dot} org>
# Contributor: Sander van Kasteel <info at sandervankasteel dot nl>
pkgname=gtg-git
pkgver=0.6.r79.g77fe2265
pkgrel=1
pkgdesc="Getting Things GNOME! is a personal tasks and TODO-list items organizer for GNOME"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/GTG"
license=('GPL')
depends=(
  'gtk3'
  'gtksourceview4'
  'libsecret'
  'python-gobject'
  'python-liblarch-git'
  'python-lxml'
)
makedepends=('git' 'itstool' 'meson')
checkdepends=(
  'python-caldav'
  'python-mock'  ## TODO: Drop python-mock: https://archlinux.org/todo/drop-python-mock-checkdepends/
  'python-pytest'
)
optdepends=(
  'hamster-time-tracker: send a task to the Hamster time tracking applet'
  'pdftk: for the Export and print plugin'
  'python-caldav: CalDAV syncronization'
  'python-cheetah3: for the Export and print plugin'
  'python-setproctitle: to set the process title when listing processes like ps)'
  'texlive-bin: pdflatex, for the Export and print plugin'
  'texlive-binextra: pdfjam, for the Export and print plugin'
  'yelp: view user manual'
)
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

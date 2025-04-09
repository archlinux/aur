# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Baptiste Grenier <baptiste@bapt.name>
# Contributor: Pablo Olmos de Aguilera Corradini <pablo <at] glatelier (dot} org>
# Contributor: Sander van Kasteel <info at sandervankasteel dot nl>
pkgname=gtg-git
pkgver=0.6.r533.g025aebd
pkgrel=1
pkgdesc="Getting Things GNOME! is a personal tasks and TODO-list items organizer for GNOME"
arch=('any')
url="https://getting-things-gnome.github.io"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'gtksourceview5'
  'libportal-gtk4'
  'libsecret'
  'python-caldav'
  'python-dbus'
  'python-gobject'
  'python-liblarch-git'
  'python-lxml'
  'python-typing_extensions'
)
makedepends=(
  'git'
  'itstool'
  'meson'
)
#checkdepends=(
#  'python-pytest'
#  'xorg-server-xvfb'
#)
optdepends=(
  'hamster-time-tracker: send a task to the Hamster time tracking applet'
  'pdftk: for the Export and print plugin'
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
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"

  # Correct required GtkSourceView version
  sed -i 's/gtksourceview-4/gtksourceview-5/g' meson.build
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

#check() {
#  cd "${pkgname%-git}"
#  PYTHONPATH=. xvfb-run pytest
#}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}

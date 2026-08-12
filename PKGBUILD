# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Baptiste Grenier <baptiste@bapt.name>
# Contributor: Pablo Olmos de Aguilera Corradini <pablo <at] glatelier (dot} org>
# Contributor: Sander van Kasteel <info at sandervankasteel dot nl>
pkgname=gtg-git
pkgver=0.6.r652.g0e99f94
pkgrel=1
_app_id=org.gnome.GTG
pkgdesc="Getting Things GNOME! is a personal tasks and TODO-list items organizer for GNOME"
arch=('any')
url="https://getting-things-gnome.github.io"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'gtksourceview5'
  'libportal-gtk4'
  'libsecret'
  'python-dbus'
  'python-gobject'
  'python-lxml'
  'python-typing_extensions'
)
makedepends=(
  'git'
  'itstool'
  'meson'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
  # 'python-caldav'
  # 'python-pytest'
  # 'xorg-server-xvfb'
)
optdepends=(
  'hamster-time-tracker: Send a task to the Hamster time tracking applet'
  'pdftk: For the Export and print plugin'
  'python-caldav: Required to enable the CalDAV synchronization backend'
  'python-cheetah3: For the Export and print plugin'
  'python-setproctitle: Set the process title when listing processes like ps et al)'
  'texlive-bin: pdflatex, for the Export and print plugin'
  'texlive-binextra: pdfjam, for the Export and print plugin'
  'yelp: View user manual'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/getting-things-gnome/gtg.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  appstreamcli validate --no-net "build/data/${_app_id}.metainfo.xml"
  desktop-file-validate "build/data/${_app_id}.desktop"

  # cd "${pkgname%-git}"
  # export LIBGL_ALWAYS_SOFTWARE=1
  # python -m venv --clear --without-pip --system-site-packages test-env
  # xvfb-run test-env/bin/python -I -m pytest
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}

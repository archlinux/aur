# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>

pkgname=app-icon-preview
pkgver=3.3.0
pkgrel=1
pkgdesc='Tool for designing applications icons'
arch=('x86_64' 'aarch64')
url='https://gitlab.gnome.org/World/design/app-icon-preview'
license=('GPL3')
depends=('libadwaita')
makedepends=('git' 'meson' 'cargo')
checkdepends=('appstream-glib')
_commit=34cd118f83da0ad4f6d050afc0d64fb4bc25cf71  # tags/3.3.0^0
source=("git+https://gitlab.gnome.org/World/design/app-icon-preview.git#commit=$_commit"
	"git+https://gitlab.gnome.org/Teams/Design/HIG-app-icons.git")
b2sums=('SKIP'
        'SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname
  git submodule init
  git config submodule.src/hig.url "$srcdir/HIG-app-icons"
  git -c protocol.file.allow=always submodule update --init --recursive
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}

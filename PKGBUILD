# Maintainer: 
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>

pkgname=palette
pkgver=2.0.2
pkgrel=2
pkgdesc="Tool for viewing the GNOME color palette as defined by the design guidelines."
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/design/palette"
license=('GPL3')
depends=('libadwaita')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
_commit=01ce37b3e262574ad7594b5e5b906b7aacd2ab81  # tags/2.0.2^0
source=("git+https://gitlab.gnome.org/World/design/palette.git#commit=${_commit}"
        'git+https://gitlab.gnome.org/Teams/Design/HIG-app-icons.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd "${pkgname}"
  git submodule init
  git config submodule.hig.url "$srcdir/HIG-app-icons"
  git -c protocol.file.allow=always submodule update
}

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  ln -s /usr/bin/org.gnome.design.Palette "$pkgdir/usr/bin/$pkgname"
}

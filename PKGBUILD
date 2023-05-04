# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gradience-git
_pkgname=Gradience
pkgver=0.3.1.r2.ge5dd5c9
pkgrel=1
pkgdesc="Change the look of Adwaita, with ease"
arch=('x86_64')
url="https://github.com/GradienceTeam/Gradience"
sub="https://github.com/GradienceTeam/Submodules"
license=('GPL3')
depends=(
  'libadwaita' 
  'libportal-gtk4' 
  'libsoup3' 
  'python-anyascii' 
  'python-cssutils' 
  'python-gobject' 
  'python-jinja'
  'python-libsass'
  'python-lxml' 
  'python-material-color-utilities' 
  'python-pillow' 
  'python-pluggy' 
  'python-regex'
  'python-svglib' 
  'python-yapsy' 
)
makedepends=('git' 'meson' 'blueprint-compiler' 'gobject-introspection' 'sassc')
checkdepends=('appstream-glib')
optdepends=('adw-gtk3: The theme from libadwaita ported to GTK-3'
            'adw-gtk-theme: LibAdwaita Theme for all GTK3 and GTK4 Apps.')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" adwcustomizer-git)
install='xdg-config.install'
source=(
  git+$url.git
  git+$sub.git
)
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  git submodule update --init --recursive
}

build() {
  arch-meson "${_pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}

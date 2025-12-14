# Maintainter: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>
pkgname=colorway-git
pkgver=1.2.0.r69.g1133f31
pkgrel=1
pkgdesc="Generate color pairings"
arch=('x86_64')
url="https://github.com/lainsce/colorway"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libgee'
  'libhelium'
)
makedepends=(
#  'blueprint-compiler'
  'git'
  'meson'
  'python-gobject'
  'vala'
)
checkdepends=(
  'appstream-glib'
  'libadwaita'
  'xorg-server-xvfb'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/lainsce/colorway.git')
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"

  # TODO: Use system blueprint-compiler
  meson subprojects download
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  xvfb-run meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  ln -s /usr/bin/io.github.lainsce.Colorway "$pkgdir/usr/bin/${pkgname%-git}"

  # Remove conflict with blueprint-compiler
  rm -rv "$pkgdir/usr/lib/"
}

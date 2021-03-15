# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=jack_mixer
pkgname="${_pkgname}-git"
pkgver=15.1.r0.gcbedd2b
pkgrel=1
pkgdesc="A GTK based Jack audio mixer (git version)"
arch=('x86_64')
url="https://rdio.space/jackmixer/"
license=('GPL2')
groups=('pro-audio')
depends=('gcc-libs' 'hicolor-icon-theme' 'python-cairo' 'python-gobject' 'python-pyxdg')
makedepends=('cython' 'git' 'glib2' 'jack' 'meson' 'ninja' 'python-docutils')
optdepends=('new-session-manager: NSM session management support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/jack-mixer/jack_mixer.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  local ver="$(grep -A 5 project meson.build | grep version | cut -d "'" -f 2)"

  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkgname}"
  meson builddir --prefix=/usr --buildtype=release
  meson compile -C builddir
}

package() {
  depends+=('libglib-2.0.so' 'libjack.so')
  cd "${srcdir}/${_pkgname}"
  DESTDIR="${pkgdir}" meson install -C builddir
  # Install documentation
  install -Dm644 AUTHORS README.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

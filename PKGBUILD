# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=jack_mixer
pkgname="${_pkgname}-git"
pkgver=12.r290.d5c0bc6
pkgrel=1
pkgdesc="A GTK based Jack audio mixer (git version)"
arch=('x86_64')
url="https://rdio.space/jackmixer/"
license=('GPL2')
groups=('pro-audio')
depends=('gcc-libs' 'hicolor-icon-theme' 'python-cairo' 'python-gobject' 'python-xdg')
makedepends=('git' 'glib2' 'jack')
optdepends=('new-session-manager: NSM session management support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/jack-mixer/jack_mixer.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  local ver="$(grep '^AC_INIT' configure.ac | sed -E 's/.*, ([0-9]+)\)$/\1/')"
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  depends+=('libglib-2.0.so' 'libjack.so')
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  # Install documentation
  install -Dm644 AUTHORS README NEWS -t "${pkgdir}/usr/share/doc/${pkgname}"
}

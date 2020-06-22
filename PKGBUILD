# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=jack_mixer
pkgname="${_pkgname}-git"
pkgver=12.r285.5e45976
pkgrel=2
pkgdesc="A GTK based Jack audio mixer (GTK3 git version)"
arch=('x86_64')
url="https://rdio.space/jackmixer/"
license=('GPL2')
groups=('pro-audio')
depends=('gcc-libs' 'hicolor-icon-theme' 'python-cairo' 'python-gobject')
makedepends=('git' 'glib2' 'jack')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/jack-mixer/jack_mixer.git"
        'jack_mixer-12-remove_gconf.patch'
        'jack_mixer-no-gconf-gui.patch')
sha256sums=('SKIP'
            '87f41eb0e73e764af6cd9ce392c1b9a59376b120242178239dd8ad05218e258c'
            'e4284bfc4b0e09a6bdfe3e5a6f8bc1c73f1468f45ef2a977a4d0d5e2324f1b92')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  local ver="$(grep '^AC_INIT' configure.ac | sed -E 's/.*, ([0-9]+)\)$/\1/')"
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  # remove legacy gconf integration
  # https://github.com/jack-mixer/jack_mixer/issues/2
  patch -p1 -N -i "${srcdir}/jack_mixer-12-remove_gconf.patch" || :
  patch -p1 -N -i "${srcdir}/jack_mixer-no-gconf-gui.patch" || :
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
  install -Dm644 AUTHORS README NEWS \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}

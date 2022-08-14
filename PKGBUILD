# Maintainer: Denis Oster <denis.oster.dev@gmail.com>

pkgname=sessiond
pkgver=0.6.1
pkgrel=1
pkgdesc="Standalone X session manager for systemd-logind"
arch=("x86_64")
url="https://sessiond.org/"
license=("GPL" 'custom:GPL3 or any later version')
depends=(dbus-python wireplumber python-pyqt5)
makedepends=(
  git
  systemd
  meson
  perl
  glib2
  libx11
  libxi
  libxext
  python-setuptools
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/jcrd/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
  pod2man.patch
)
sha256sums=(
  d2b8e81eb33c0cbce1e9fcdd37db03b1ec93afb984479f2ab4d7e9ce25d0c5ae
  fe0708f9eada5d72d472ed110e8c53b236746fdca9be8598b89edfa41bdaab09
)
_srcdir="${pkgname}-${pkgver}"
_pydir="python-${pkgname}"

prepare() {
  patch --directory="${_srcdir}" --forward --strip=1 --input="${srcdir}/pod2man.patch"
}

build() {
  arch-meson "${_srcdir}" builddir
  meson compile -C builddir
}

package() {
  meson install -C builddir --destdir "${pkgdir}"
  
  cd "${_srcdir}/${_pydir}"
  python setup.py install --root "${pkgdir}" --optimize=1

  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

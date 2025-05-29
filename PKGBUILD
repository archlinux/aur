# Maintainer: Jenny Danzmayr <mail@scientress.de>
# Previous Maintainer: Nicolas Goy <me@kuon.ch>

_pkgname=openswitcher
pkgname="${_pkgname}-git"
pkgver=0.12.0+37+ga9b2860
pkgrel=1
pkgdesc="Library implementing the ATEM video switcher protocol and a GTK3.0 application"
arch=("any")
url="https://git.sr.ht/~martijnbraam/pyatem"
license=('GPL3' 'LGPL3')
groups=()
depends=('python' 'python-pyusb' 'python-cairo' 'libhandy')
makedepends=('git' 'meson' 'python-setuptools')
source=("$_pkgname"::"git+${url}")
b2sums=('SKIP')
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags | sed -r 's|v?(.+)|\1|'|sed 's|-|+|g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
  meson build --prefix /usr
  meson compile -C build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root "$pkgdir"
  DESTDIR=$pkgdir meson install -C build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 LICENSE-gpl3.txt "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-gpl3"
  install -Dm644 LICENSE-lgpl3.txt "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-lgpl3"
}

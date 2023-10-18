# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: bitwave <github@oomlu.de>
# Contributor: Stanislas H.B. Sodonon <bidossessi@linuxbenin.com>

pkgname=trelby-git
_pkgname=trelby
pkgver=2.4.9.r0.gd02783b
pkgrel=4
pkgdesc="The free, multiplatform, feature-rich screenwriting program!"
url="https://github.com/limburgher/trelby"
arch=('any')
license=('GPL2')
provides=("${_pkgname}")
depends=(
    'python'
    'python-lxml'
    'python-wxpython'
    'python-reportlab'
)
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
source=('git+https://github.com/limburgher/trelby.git'
        "${_pkgname}.xml"
)
sha256sums=('SKIP'
            'eb9332ff5bd22988ac87231851876df76220a581e1f5bfc5b782cff10ccffe42')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  gzip -c names.txt > names.txt.gz
  gzip -c dict_en.dat > dict_en.dat.gz
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py sdist

}

check() {
  cd "${srcdir}/${_pkgname}"
  pytest
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 "trelby.desktop" "${pkgdir}/usr/share/applications/trelby.desktop"
  install -Dm644 "resources/icon256.png" "${pkgdir}/usr/share/trelby/resources/icon256.png"
  install -Dm644 "${srcdir}/${_pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${_pkgname}.xml"
  install -Dm755 "${pkgdir}/opt/trelby/bin/trelby" "${pkgdir}/usr/bin/trelby"
}

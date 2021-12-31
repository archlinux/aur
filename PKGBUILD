# Maintainer: Jose Lopes <josemslopes at gmail dot com>

_name=blink
_pkgname=blink-qt
pkgname=blink-git
pkgver=5.1.8.r1296.a54013c
pkgrel=2
pkgdesc='Fully featured, easy to use SIP client with a Qt based UI'
arch=('aarch64' 'x86_64')
url='https://icanblink.com'
license=('GPL-3+')
depends=(
  'icu'
  'libvncserver'
  'python-gevent'
  'python-gmpy2'
  'python-google-api-python-client'
  'python-oauth2client'
  'python-pyopenssl'
  'python-pyqt5'
  'python-service-identity'
  'python-sipsimple'
  'qt5-svg'
  'qt5-webkit'
  )
conflicts=(blink)
optdepends=('x11vnc: for screen sharing')
source=("${pkgname}::git+https://github.com/AGProjects/${_pkgname}.git" 'fix_MutableSet.patch')
noextract=()
sha512sums=('SKIP'
  '6e648e733c651a780bc800f7c6228a6f56115d0bf78627de01bbfe093a6d2f68d9f1891303f9b9ee6b794db804b9c71a796dc4d9a2fc1cb7a7e2275516cc02cb'
)

pkgver() {
    cd "${pkgname}"
    base_version=$(grep __version__  blink/__info__.py | sed 's|.*"\(.*\)".*|\1|')
    printf "%s.r%s.%s" "${base_version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname}"
  patch --forward --strip=1 --input="${srcdir}/fix_MutableSet.patch"
}

build() {
  cd "${pkgname}"
  python3 setup.py build
}

package() {
  cd "${pkgname}"
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  # license
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${_name}/LICENSE"

  # desktop file
  install -Dm644 "debian/${_name}.desktop" \
    "${pkgdir}/usr/share/applications/${_name}.desktop"
}

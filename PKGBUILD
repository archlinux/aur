# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Alex Dewar <alex.dewar@gmx.co.uk>
# Contributor: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>
# Contributor: Sam S. <smls75@gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>

pkgname=mnemosyne
pkgver=2.11
pkgrel=2
pkgdesc="A flash-card tool with a sophisticated card review algorithm"
arch=('any')
url='https://www.mnemosyne-proj.org'
license=('LGPL3' 'custom:AGPL3 with Mnemosyne attribution requirement')
depends=('python' 'python-pyqt6' 'python-pyqt6-webengine' 'qt6-multimedia'
         'python-argon2_cffi' 'python-pillow' 'python-matplotlib'
         'python-cherrypy' 'python-webob')
makedepends=('python-setuptools')
optdepends=('texlive-core: support for mathematical formulae in cards'
            'ttf-ms-fonts: support for non-latin labels on statistic plots'
            'python-cheroot: support for starting a sync server'
            'python-opengl: mentioned in a non-fatal warning'
            'mplayer: for playing audio and video externally'
            'python-googletrans: support for google translate'
            'python-google_trans_new: support for google translate'
            'python-gtts: support for text-to-speech')
source=("mnemosyne-${pkgver}.tar.gz::https://github.com/mnemosyne-proj/mnemosyne/archive/refs/tags/${pkgver}.tar.gz"
        "fix-icon-search-path.patch")
sha256sums=('a042252c2fb8c69c44d048e3f3cfca142189fe7d1bb55e0ad98f8edeeb3ae1cd'
            '9aa6f5d2f15009169eba0ab5143f97cbf0e9b4522b8c00141c20d7fe5f9194ef')

prepare() {
  cd "${srcdir}/mnemosyne-${pkgver}"

  patch -Np1 < "${srcdir}/fix-icon-search-path.patch"
  # Fix Windows line endings
  find -name '*py' -exec sed -i "s/\r//g" {} \;
}

build() {
  cd "${srcdir}/mnemosyne-${pkgver}"

  # Newer, standards-based build system doesn't seem to install properly (at
  # least the desktop entry and gettext catalogs are missing and some other
  # files in seemingly strange locations). Will figure that out later.
  pushd mnemosyne/pyqt_ui
  for i in *.ui; do
    ./pyuic6 "$i" > "ui_${i%.ui}.py"
  done
  popd
  python setup.py build
}

package() {
  cd "${srcdir}/mnemosyne-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

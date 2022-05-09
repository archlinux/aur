# Maintainer: Alex Dewar <alex.dewar@gmx.co.uk>
# Contributor: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>
# Contributor: Sam S. <smls75@gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>

pkgname=mnemosyne
pkgver=2.8
pkgrel=3
pkgdesc="A flash-card tool with a sophisticated card review algorithm"
arch=('any')
url='https://www.mnemosyne-proj.org'
license=('GPL')
depends=('python-pyqt5' 'qt5-webengine' 'python-argon2_cffi'
         'python-pillow' 'python-matplotlib' 'python-cherrypy' 'python-webob'
         'python-pyqtwebengine')
makedepends=('python-setuptools')
optdepends=('texlive-core: support for mathematical formulae in cards'
            'ttf-ms-fonts: support for non-latin labels on statistic plots'
            'python-cheroot: support for starting a sync server'
            'python-opengl: mentioned in a non-fatal warning'
            'mplayer: for playing audio and video externally'
            'python-googletrans: support for google translate'
        'python-google_trans_new: support for google translate'
        'python-gtts: support for text-to-speech')
conflicts=('mnemosyne-bzr')
install='mnemosyne.install'

_dlurl="https://github.com/mnemosyne-proj/mnemosyne"
source=("https://downloads.sourceforge.net/mnemosyne-proj/Mnemosyne-${pkgver}.tar.gz"
        "make-deps-optional.patch::$_dlurl/commit/b0e85fbb54a23add1fe8a0d56123b2ddb056b325.patch")
sha256sums=('63949ad4b44188501915a0465f32d3ca066698c58f86c46cf3196f9d601f6900'
            '086691d23ab73354af338ba69c42d7facf36c2a6663271c95e242b35679a8ead')

prepare() {
  cd "Mnemosyne-${pkgver}/"

  # Fix Windows line endings
  sed -i "s/\r//g" mnemosyne/pyqt_ui/mnemosyne
  find -name '*py' -exec sed -i "s/\r//g" {} \;

  # patch to make google transate and goole text to speak optional
  patch --forward -p1 --input="$srcdir/make-deps-optional.patch"
}

build() {
  cd "Mnemosyne-${pkgver}/"

  python setup.py build
}

package() {
  cd "Mnemosyne-${pkgver}/"
  python setup.py install --root="${pkgdir}" --optimize=1
}


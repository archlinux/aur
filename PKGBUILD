# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Alex Dewar <alex.dewar@gmx.co.uk>
# Contributor: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>
# Contributor: Sam S. <smls75@gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>

pkgname=mnemosyne
pkgver=2.11
pkgrel=4
pkgdesc="A flash-card tool with a sophisticated card review algorithm"
arch=('any')
url='https://www.mnemosyne-proj.org'
license=('LGPL-3.0-only AND LicenseRef-AGPL-3.0-Attribution')
depends=('python' 'python-pyqt6' 'python-pyqt6-webengine' 'qt6-multimedia'
         'python-argon2-cffi' 'python-pillow' 'python-matplotlib'
         'python-cherrypy' 'python-webob' 'hicolor-icon-theme')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
optdepends=('texlive-basic: support for mathematical formulae in cards'
            'ttf-ms-fonts: support for non-latin labels on statistic plots'
            'python-cheroot: support for starting a sync server'
            'python-opengl: mentioned in a non-fatal warning'
            'mplayer: for playing audio and video externally'
            'python-google_trans_new: support for google translate'
            'python-gtts: support for text-to-speech')
source=("mnemosyne-${pkgver}.tar.gz::https://github.com/mnemosyne-proj/mnemosyne/archive/refs/tags/${pkgver}.tar.gz"
        "fix-wheel-includes.patch"
        "fix-icon-search-path.patch")
sha256sums=('a042252c2fb8c69c44d048e3f3cfca142189fe7d1bb55e0ad98f8edeeb3ae1cd'
            'a287237aaf0e3bd66636d3444b807ccad9d4666b3fef9aec2c7c9f0744b77176'
            '3e0da76723cc7279dc66e9bb0341ae335d5461bffe1b4e555a30e4f74d620114')

prepare() {
  cd "${srcdir}/mnemosyne-${pkgver}"

  patch -Np1 < "${srcdir}/fix-wheel-includes.patch"
  patch -Np1 < "${srcdir}/fix-icon-search-path.patch"
  # Fix Windows line endings
  find -name '*py' -exec sed -i "s/\r//g" {} \;
}

build() {
  cd "${srcdir}/mnemosyne-${pkgver}"

  make -C po
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/mnemosyne-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  # Clean up duplicate icons and other unwanted files introduced by the PEP 517 transition
  purelib="${pkgdir}$(python -c "import sysconfig; print(sysconfig.get_path('purelib'))")"
  rm -fr "${purelib}/"{makefile,pixmaps,mnemosyne/example_plugins,mnemosyne/example_scripts,mnemosyne/libmnemosyne/docs,mnemosyne/script/DO_NOT_DELETE}
  rm -f "${purelib}/"{mnemosyne,mnemosyne/libmnemosyne/renderers/anki/template,mnemosyne/pyqt_ui,openSM2sync}/{README,LICENSE}*
  find "${purelib}/mnemosyne/pyqt_ui" \( \
    -name 'makefile' -o -name 'pyuic6' -o -name '*.ui' -o -name '*.pro' -o -name '*.xcf' -o -name '*.icns' -o -name '*.ico' \
  \) -delete

  # Now install files that are missing
  for i in mo/*; do
    install -Dm644 "${i}/LC_MESSAGES/mnemosyne.mo" \
      "${pkgdir}/usr/share/locale/${i#*/}/LC_MESSAGES/mnemosyne.mo"
  done
  install -Dm644 "mnemosyne.desktop" \
    "${pkgdir}/usr/share/applications/mnemosyne.desktop"
  install -Dm644 "pixmaps/mnemosyne_small.png" \
    "${pkgdir}/usr/share/icons/hicolor/22x22/apps/mnemosyne.png"
  install -Dm644 "pixmaps/mnemosyne.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/mnemosyne.png"
  install -Dm644 "pixmaps/mnemosyne_large.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/mnemosyne.png"

  # And finally, licenses
  install -Dm644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "mnemosyne/libmnemosyne/renderers/anki/template/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.anki-template"
}

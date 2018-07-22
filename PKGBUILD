# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>
# Contributor: Francois Boulogne <fboulogne@april.org>

pkgname=paperwork
pkgver=1.2.4
pkgrel=2
pkgdesc='A tool to make papers searchable - scan & forget'
arch=('any')
url='https://gitlab.gnome.org/World/OpenPaperwork/paperwork'
license=('GPL3')
depends=('pygobject2-devel' 'pygtk' 'python-pycountry'
         'python-poppler-qt5' 'python-pyinsane2' 'python-pyocr'
         'python-levenshtein' 'python-whoosh' 'python-pyenchant'
         'python-joblib' 'python-numpy' 'python-scipy' 'python-scikit-learn'
         'python-scikit-image' 'python-gobject' 'python-nltk' 'python-termcolor'
         'python-simplebayes' 'python-pypillowfight' 'python-cairo'
         'gnome-icon-theme-symbolic' 'gnome-icon-theme' 'poppler-glib'
         'python-natsort' 'python-xdg' )
makedepends=('python' 'python-setuptools' 'git')
optdeps=('cuneiform: alternativer OCR')
source=("paperwork.desktop"
        "git+https://gitlab.gnome.org/World/OpenPaperwork/paperwork.git#tag=${pkgver}")
md5sums=('4496dc70b2f159c7ea28160d2ebb60fe'
         'SKIP')
install=paperwork.install

build() {
  cd "${srcdir}/${pkgname}/${pkgname}-backend"
  make build

  cd "${srcdir}/${pkgname}/${pkgname}-gtk"
  make build
}

package() {
  cd "${srcdir}/${pkgname}/${pkgname}-backend"
  PIP_ARGS="--root=\"${pkgdir}\" --optimize=1" make install

  cd "${srcdir}/${pkgname}/${pkgname}-gtk"
  PIP_ARGS="--root=\"${pkgdir}\" --optimize=1" make install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 "data/${pkgname}_halo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

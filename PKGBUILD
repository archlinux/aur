# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: graysky
# Contributor: Tomasz Żok <tomasz dot zok at gmail dot com>

pkgname=pymol-python2
_pkgname=pymol
pkgver=2.3.0
pkgrel=1
pkgdesc="Molecular visualization system on an Open Source foundation (Python 2 version)"
arch=('x86_64')
url="https://pymol.org/"
license=('custom')
depends=('freetype2' 'glew' 'glm' 'glut' 'python2-numpy' 'tcsh')
makedepends=('desktop-file-utils' 'gendesk' 'libmmtf' 'msgpack-c')
optdepends=('python2-pmw: pmw based UI'
            'python2-pyqt5: Qt5 based UI')
conflicts=('pymol')
provides=('pymol')
source=("https://github.com/schrodinger/pymol-open-source/archive/v${pkgver}.tar.gz"
        ${_pkgname}.png::"https://c.fsdn.com/allura/p/pymol/icon"
        "apbstools_tcltk8.6.patch")
sha512sums=('e1dcea1c97bcd9045d3543e92902f240e6affbf61a38e8d2a0be04309e3dbabfe1a869847d1423b3151008978d4c305bbf3ce994fc9d453c0063ce020100c133'
            '39917c1dc80cd6a59e8f6b3ea49a59491eaf23d14e32ac264f6d71f33007f686deb6a66e50e7f20ef9df5337038e3572b018633c361460d5ee0c1d8f0a8259d1'
            '90fce6d3c4364cd775b44bdd9013a08f26392339bec40ecd749220b3d11391381f5b159734bdb2e2ac675fbc016a6a1b9c4cec2fa8c9c0226609a5f09b610b9c')

prepare() {
  # create desktop file
  gendesk -f -n --pkgname "${_pkgname}" --pkgdesc "${pkgdesc}" \
          --name="PyMOL Molecular Graphics System" \
          --categories="Science;Chemistry"

  # suppress non-zero exit code that breaks makepkg
  sed -i '/sys.exit/ s,2,0,' "${srcdir}/${_pkgname}-open-source-${pkgver}/setup.py"
  # change python to python2
  find "${_pkgname}-open-source-${pkgver}" -name '*.py' -type f -exec \
       sed -i 's|env python|env python2|g' {} \;
  find "${_pkgname}-open-source-${pkgver}/test" -type f -exec \
       sed -i 's|bin/python|bin/python2|g' {} \;
  # fix FS#39526
  cd "${srcdir}/${_pkgname}-open-source-${pkgver}"
  patch -p0 -i "${srcdir}/apbstools_tcltk8.6.patch"
}

build() {
  cd "${srcdir}/${_pkgname}-open-source-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-open-source-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${srcdir}/pymol.desktop" "${pkgdir}/usr/share/applications/pymol.desktop"
  install -Dm644 "${srcdir}/pymol.png" "${pkgdir}/usr/share/pixmaps/pymol.png"
}

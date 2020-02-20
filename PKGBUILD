# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: graysky
# Contributor: Tomasz Żok <tomasz dot zok at gmail dot com>

pkgname=pymol-python2-git
_pkgname=pymol
pkgver=r4631.844bf876
pkgrel=1
pkgdesc="Molecular visualization system on an Open Source foundation (Python 2 git version)"
arch=(x86_64)
url="https://pymol.org/"
license=(custom)
depends=(python2 freetype2 mesa glew glm glut libpng libxml2 python2-numpy tcsh netcdf)
makedepends=('gcc>=4.7' desktop-file-utils gendesk libmmtf 'msgpack-c>=2.1.5')
optdepends=('python2-pmw: pmw based UI'
            'python2-pyqt5: Qt5 based UI')
conflicts=('pymol')
provides=('pymol')
source=("${pkgname}::git+https://github.com/schrodinger/pymol-open-source.git"
        ${_pkgname}.png::"https://c.fsdn.com/allura/p/pymol/icon"
        "apbstools_tcltk8.6.patch")
sha512sums=('SKIP'
            '39917c1dc80cd6a59e8f6b3ea49a59491eaf23d14e32ac264f6d71f33007f686deb6a66e50e7f20ef9df5337038e3572b018633c361460d5ee0c1d8f0a8259d1'
            '90fce6d3c4364cd775b44bdd9013a08f26392339bec40ecd749220b3d11391381f5b159734bdb2e2ac675fbc016a6a1b9c4cec2fa8c9c0226609a5f09b610b9c')

pkgver() {
    cd "${srcdir}/${pkgname}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # create desktop file
  gendesk -f -n --pkgname "${_pkgname}" --pkgdesc "${pkgdesc}" \
          --name="PyMOL Molecular Graphics System" \
          --categories="Science;Chemistry"

  # suppress non-zero exit code that breaks makepkg
  sed -i '/sys.exit/ s,2,0,' "${srcdir}/${pkgname}/setup.py"
  # change python to python2
  find "${srcdir}/${pkgname}" -name '*.py' -type f -exec \
       sed -i 's|env python|env python2|g' {} \;
  find "${srcdir}/${pkgname}/test" -type f -exec \
       sed -i 's|bin/python|bin/python2|g' {} \;
  # fix FS#39526
  cd "${srcdir}/${pkgname}"
  patch -p0 -i "${srcdir}/apbstools_tcltk8.6.patch"
}

build() {
  cd "${srcdir}/${pkgname}"

  python2 setup.py build --glut
}

package() {
  cd "${srcdir}/${pkgname}"

  python2 setup.py install --prefix=/usr --root="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${srcdir}/pymol.desktop" "${pkgdir}/usr/share/applications/pymol.desktop"
  install -Dm644 "${srcdir}/pymol.png" "${pkgdir}/usr/share/pixmaps/pymol.png"
}

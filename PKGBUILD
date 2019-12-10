# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

pkgname=pymol-git
_pkgname=pymol
pkgver=r4593.4948dd0f
pkgrel=1
pkgdesc="Molecular visualization system on an Open Source foundation"
arch=('x86_64')
url="https://pymol.org/"
license=('custom')
depends=('freetype2' 'glew' 'glm' 'glut' 'python-numpy' 'tcsh')
makedepends=('desktop-file-utils' 'gendesk' 'libmmtf' 'msgpack-c' 'git')
optdepends=('python-pmw: pmw based UI'
            'python-pyqt5: Qt5 based UI'
			'ffmpeg: MPEG encoding')
conflicts=('pymol')
provides=('pymol')
source=(${pkgname}::'git+https://github.com/schrodinger/pymol-open-source.git'
		${_pkgname}.png::'https://c.fsdn.com/allura/p/pymol/icon')
md5sums=('SKIP'
		 'SKIP')

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
}

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --prefix=/usr --root="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${srcdir}/pymol.desktop" "${pkgdir}/usr/share/applications/pymol.desktop"
  install -Dm644 "${srcdir}/pymol.png" "${pkgdir}/usr/share/pixmaps/pymol.png"
}


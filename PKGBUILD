# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name=pymol
pkgname="${_name}-git"
pkgver=r4707.7b4e2af9
pkgrel=1
pkgdesc="Molecular visualization system on an Open Source foundation"
arch=('x86_64')
url="https://pymol.org/"
license=('custom')
depends=('freetype2' 'glew' 'glm' 'glut' 'python-numpy' 'tcsh')
makedepends=('desktop-file-utils' 'gendesk' 'libmmtf' 'msgpack-c' 'netcdf' 'git')
optdepends=('python-pmw: pmw based UI'
            'python-pyqt5: Qt5 based UI'
			'ffmpeg: MPEG encoding')
conflicts=('pymol')
provides=("${_name}=${pkgver}")
source=(${_name}::"git+https://github.com/schrodinger/pymol-open-source.git"
		${_name}.png::"https://c.fsdn.com/allura/p/pymol/icon"
        "apbstools_tcltk8.6.patch")
md5sums=('SKIP'
         'a6b62ae41658a772f75b3b123a8e5c0b'
         '138550367b74fd62a7c7bc48d339eb2d')

pkgver() {
    cd "${srcdir}/${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # create desktop file
  gendesk -f -n --pkgname "${_name}" --pkgdesc "${pkgdesc}" \
          --name="PyMOL Molecular Graphics System" \
          --categories="Science;Chemistry"

  # suppress non-zero exit code that breaks makepkg
  sed -i '/sys.exit/ s,2,0,' "${srcdir}/${_name}/setup.py"

  # fix FS#39526
  cd "${srcdir}/${_name}"
  patch -p0 -i "${srcdir}/apbstools_tcltk8.6.patch"
}

build() {
  cd "${srcdir}/${_name}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}"
  python setup.py install --prefix=/usr --root="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/pymol.desktop" "${pkgdir}/usr/share/applications/pymol.desktop"
  install -Dm644 "${srcdir}/pymol.png" "${pkgdir}/usr/share/pixmaps/pymol.png"
}

# Maintainer : Matthijs Tadema <m dot j dot tadema at pm dot com>
# Contributor: Lorenzo Gaifas <brisvag at gmail dot com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: graysky
# Contributor: Tomasz Żok <tomasz dot zok at gmail dot com>

_name=pymol
pkgname="${_name}-git"
pkgver=r5639.ca185848f
pkgrel=1
pkgdesc='Molecular visualization system on an Open Source foundation'
arch=(x86_64)
url=https://pymol.org
license=(custom)
depends=(freetype2
         glew
         glm
         glut
         netcdf
         netcdf-cxx
         python-numpy
         tcsh)
makedepends=(desktop-file-utils
             gendesk
             mmtf-cpp
             msgpack-c
             python-{build,installer,wheel}
             python-setuptools)
optdepends=('python-pyqt5: Qt5 based UI')
conflicts=('pymol')
provides=("${_name}=${pkgver}")
source=(${_name}::"git+https://github.com/schrodinger/pymol-open-source.git"
		${_name}.png::"https://c.fsdn.com/allura/p/pymol/icon")
md5sums=('SKIP'
         'a6b62ae41658a772f75b3b123a8e5c0b')

pkgver() {
    cd "${srcdir}/${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# create desktop file
	gendesk -f -n \
			--pkgname "${_name}" \
			--name="PyMOL Molecular Graphics System" \
			--pkgdesc "$pkgdesc" \
			--exec="${_name} %F" \
			--mimetypes="chemical/x-pdb;chemical/pdby;chemical/x-mol2;chemical/x-mdl-molfile;chemical/x-mdl-sdfile;chemical/x-xyz;chemical/x-macromodel-input;chemical/x-vmd" \
			--categories="Science;Chemistry"
	cd "${srcdir}/${_name}"
	# suppress non-zero exit code that breaks makepkg
	sed -i -e '/sys.exit/ s,2,0,' setup.py
	# setup script PEP 517 compatiblitiy is broken
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	sed -i -E '/def (finalize_options|make_launch_script)/a \        self.install_libbase="'$site_packages'"' setup.py
}

build() {
  cd "${srcdir}/${_name}"
  python -m build -wn
}

package() {
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "${srcdir}/${_name}.desktop"
	install -Dm0644 -t "$pkgdir/usr/share/pixmaps/" "${srcdir}/${_name}.png"
    cd "${srcdir}/${_name}"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/${_name}/" LICENSE
}

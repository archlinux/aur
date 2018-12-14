# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=folder-color
pkgname=${_pkgname}-bzr
pkgver=0.0.86.r281
pkgrel=3
pkgdesc="Folder color switcher extension for nautilus, caja, and nemo"
arch=('any')
url="http://foldercolor.tuxfamily.org/"
license=('GPL3')
makedepends=('bzr' python{,2}-distutils-extra python{,2}-setuptools)
optdepends=('python-nautilus:    Nautilus extension'
            'nemo-python>=3.9.0: Nemo extension'
            'python2-caja:       Caja extension')
conflicts=('folder-color-nautilus-bzr')
source=("${_pkgname}"::bzr+http://bazaar.launchpad.net/~costales/folder-color/trunk)
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    echo "$(egrep -m 1 -o "([0-9]{1,}\.)+[0-9]{1,}" setup.py).r$( bzr revno )"
}

prepare() {
	cd "${srcdir}"
	for _fm in nemo caja nautilus common ; do
		cp -r "${_pkgname}" "${_pkgname}-${_fm}"
		pushd "${_pkgname}-${_fm}"/install_scripts
		./${_fm}.sh
		case "${_fm}" in 
			# patch nemo and nautilus extensions for python3
			nautilus|nemo)
				sed -i 's:urllib.unquote:urllib.parse.unquote:g' ../${_fm}-extension/folder-color.py ;;
		esac
		popd
	done
}

package() {
	for _fm in nautilus nemo common ; do
		pushd "${_pkgname}-${_fm}/"
		python ./setup.py install --root="$pkgdir"
		popd
	done

	for _fm in caja common ; do
		pushd "${_pkgname}-${_fm}/"
		python2 ./setup.py install --root="$pkgdir"
		popd
	done

}


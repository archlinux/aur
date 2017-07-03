# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=folder-color
pkgname=${_pkgname}-bzr
pkgver=0.0.80.r266
pkgrel=1
pkgdesc="Folder color switcher extension for nautilus, caja, and nemo"
arch=(any)
url="http://foldercolor.tuxfamily.org/"
license=(GPL3)
makedepends=('bzr' 'python2-distutils-extra' 'python2-setuptools')
optdepends=('python2-nautilus: Nautilus extension'
            'nemo-python:      Nemo extension'
            'python2-caja:     Caja extension')
conflicts=('folder-color-nautilus-bzr')
source=($_pkgname::bzr+http://bazaar.launchpad.net/~costales/folder-color/trunk)
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    echo "$(egrep -m 1 -o "([0-9]{1,}\.)+[0-9]{1,}" setup.py).r$( bzr revno )"
}

prepare() {
	for _fm in nemo caja nautilus common ; do
		cp -r "${_pkgname}" "${_pkgname}-${_fm}"
		cd "${_pkgname}-${_fm}"/install_scripts
		./${_fm}.sh
		cd -
	done
}

package() {
	for _fm in nemo caja nautilus common ; do
		cd "${_pkgname}-${_fm}/"
		python2 ./setup.py install --root="$pkgdir"
		cd -
	done
}


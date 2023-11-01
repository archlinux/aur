# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=folder-color
pkgname=${_pkgname}-git
epoch=1
pkgver=0.3.2+r42+61382f2
pkgrel=1
pkgdesc="Folder color switcher extension for nautilus, caja, and nemo"
arch=('any')
url="http://foldercolor.tuxfamily.org/"
license=('GPL3')
makedepends=('git' 'python-distutils-extra' 'python-setuptools')
optdepends=('python-nautilus:    Nautilus extension'
            'nemo-python>=3.9.0: Nemo extension'
            'python-caja:        Caja extension')
conflicts=('folder-color-nautilus-bzr')
source=("${_pkgname}"::git+https://github.com/costales/folder-color)
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "%s+r%s+%s" \
	    "$( grep 'version[\t\ ]*=' setup.py | grep -E -o '[0-9]+\.[0-9]+\.[0-9]+' )" \
	    "$( git rev-list --count HEAD )" \
	    "$( git rev-parse --short HEAD )"
}

prepare() {
	cd "${srcdir}"
	for _fm in nemo caja nautilus ; do
		cp -r "${_pkgname}" "${_pkgname}-${_fm}"
		pushd "${_pkgname}-${_fm}"/install-scripts
		if [[ "${_fm}" == 'nautilus' ]] ; then _gtk='4' ; else _gtk='3' ; fi
		./${_fm}.sh "GTK${_gtk}"
		popd
	done
}

package() {
	for _fm in nautilus caja nemo ; do
		pushd "${_pkgname}-${_fm}/"
		python ./setup.py install --root="$pkgdir"
		popd
	done
}


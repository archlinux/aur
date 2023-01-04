# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=clipboard-to-file
pkgname=${_pkgname}-git
pkgver=0.0.9+r36+a1861f8
pkgrel=1
pkgdesc="Folder color switcher extension for nautilus, caja, and nemo"
arch=('any')
url="https://github.com/costales/clipboard-to-file"
license=('GPL3')
makedepends=('git' 'python-distutils-extra' 'python-setuptools')
optdepends=('python-nautilus:    Nautilus extension'
            'nemo-python>=3.9.0: Nemo extension'
            'python-caja:        Caja extension')
conflicts=('folder-color-nautilus-bzr')
source=("${_pkgname}::git+${url}")
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
		pushd "${_pkgname}-${_fm}"/install_scripts
		./${_fm}.sh
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


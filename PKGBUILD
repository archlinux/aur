# Maintainer: Hao Zhang <hao@hao-zhang.com>
# Contributor: Dustin Falgout <dustin@falgout.us>
# Contributor: Gifts <gifts.antichat@gmail.com>
# Contributor: Andrey Vlasovskikh <andrey.vlasovskikh@gmail.com>

pkgname=pycharm-eap
_buildver=231.8770.15
_pkgver=2023.1.1
_eap=true
pkgver="${_pkgver}.${_buildver}"
pkgrel=1
pkgdesc="Powerful Python and Django IDE, Early Access Program (EAP) build. Professional edition."
arch=("any")
options=("!strip")
url="https://www.jetbrains.com/pycharm/nextversion/"
license=("custom")
makedepends=('python-setuptools' 'cython')
optdepends=('ipython2: For enhanced interactive Python shell v2 inside Pycharm'
            'ipython: For enhanced interactive Python shell v3 inside Pycharm'
            'openssh: For deployment and remote connections'
            'python2-setuptools: Packages manager for Python 2, for project interpreter'
            'python-setuptools: Packages manager for Python 3, for project interpreter'
            'python2-coverage: For support code coverage measurement for Python 2'
            'python-coverage: For support code coverage measurement for Python 3'
            'cython2: For performance debugger in Python 2'
            'docker-machine: For support docker inside Pycharm'
            'docker-compose: For support docker inside Pycharm'
            'vagrant: For support virtualized development environments'
            'python2-pytest: For support testing inside Pycharm with Python 2'
            'python-pytest: For support testing inside Pycharm with Python 3'
            'python2-tox: Python environments for testing tool with Python 2'
            'python-tox: Python environments for testing tool with Python 3'
            'jupyter: For support Jupyter Notebook')
provides=("pycharm" "pycharm-professional")

if [[ $_eap = false ]]; then
	source=("https://download.jetbrains.com/python/pycharm-professional-${_pkgver}.tar.gz"
	"${pkgname}.desktop")
else
	source=("https://download.jetbrains.com/python/pycharm-professional-${_buildver}.tar.gz"
	"${pkgname}.desktop")
fi
	
sha256sums=("6fc48c54e5bd738f2621c7c451740920ecd5b1fe1a927eb8b312699ae87df984"
	    "aa9573c177f5d4d3092b9dff2aef5b4c7d25ff9c2b044be222a0512dff759731")

prepare() {
	if [[ -d $srcdir/pycharm-${_pkgver} ]]; then
		mv $srcdir/pycharm-${_pkgver} $srcdir/pycharm-${_buildver}
	fi
}

build() {
	# compile PyDev debugger used by PyCharm to speedup debugging
	find $srcdir/pycharm-${_buildver}/plugins/python/helpers/pydev/ \( -name *.c -o -name *.so -o -name *.pyd \) -delete
	sed -i '1s/^/# cython: language_level=3\n/' $srcdir/pycharm-${_buildver}/plugins/python/helpers/pydev/_pydevd_bundle/pydevd_cython.pxd
	sed -i '/compatible_c/d' $srcdir/pycharm-${_buildver}/plugins/python/helpers/pydev/setup_cython.py
	python $srcdir/pycharm-${_buildver}/plugins/python/helpers/pydev/setup_cython.py build_ext --inplace --force-cython
	rm -rf $srcdir/pycharm-${_buildver}/plugins/python/helpers/pydev/build/
	find $srcdir/pycharm-${_buildver}/plugins/python/helpers/pydev/ -name __pycache__ -exec rm -rf {} \;
}

package() {
	cd "${srcdir}"
	install -dm 755 \
		"${pkgdir}/opt/${pkgname}" \
		"${pkgdir}/usr/bin/" \
		"${pkgdir}/usr/share/licenses/" \
		"${pkgdir}/usr/share/applications/"

	mv "${srcdir}"/pycharm-${_buildver}/license "${pkgdir}/usr/share/licenses/${pkgname}"
	mv "${srcdir}"/pycharm-${_buildver}/* "${pkgdir}/opt/${pkgname}"

	sed -i "s/Version=/Version=${pkgver}/g" "${pkgname}.desktop"
	install -m755 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"

	ln -s "/opt/${pkgname}/bin/pycharm.sh" "${pkgdir}/usr/bin/pycharm-eap"
}

# Maintainer: Hao Zhang <hao@hao-zhang.com>
# Contributor: Dustin Falgout <dustin@falgout.us>
# Contributor: Gifts <gifts.antichat@gmail.com>
# Contributor: Andrey Vlasovskikh <andrey.vlasovskikh@gmail.com>

pkgname=pycharm-eap
_buildver=183.4886.43
_pkgver=2018.3.2
_eap=false
pkgver="${_pkgver}.${_buildver}"
pkgrel=1
pkgdesc="Powerful Python and Django IDE, Early Access Program (EAP) build. Professional edition."
arch=("any")
options=("!strip")
url="https://www.jetbrains.com/pycharm/nextversion/"
license=("custom")
makedepends=('python2-setuptools' 'python-setuptools')
optdepends=('ipython2: For enhanced interactive Python shell v2 inside Pycharm'
            'ipython: For enhanced interactive Python shell v3 inside Pycharm'
            'openssh: For deployment and remote connections'
            'python2-setuptools: Packages manager for Python 2, for project interpreter'
            'python-setuptools: Packages manager for Python 3, for project interpreter'
            'python2-coverage: For support code coverage measurement for Python 2'
            'python-coverage: For support code coverage measurement for Python 3'
            'cython2: For performance debugger in Python 2'
            'cython: For performance debugger in Python 3'
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
	
sha256sums=("fe42e3bff84397447a7218a08f4e7730bd5cecc293e23eeb396f7fb5a458c611"
	    "aa9573c177f5d4d3092b9dff2aef5b4c7d25ff9c2b044be222a0512dff759731")

prepare() {
	if [[ -d $srcdir/pycharm-${_pkgver} ]]; then
		mv $srcdir/pycharm-${_pkgver} $srcdir/pycharm-${_buildver}
	fi
}

build() {
	# compile PyDev debugger used by PyCharm to speedup debugging
	python2 $srcdir/pycharm-${_buildver}/helpers/pydev/setup_cython.py build_ext --inplace
	python3 $srcdir/pycharm-${_buildver}/helpers/pydev/setup_cython.py build_ext --inplace
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

	if [[ "i686" = "${CARCH}" ]]; then
		rm -f "${pkgdir}/opt/${pkgname}/bin/libyjpagent-linux64.so"
		rm -f "${pkgdir}/opt/${pkgname}/bin/fsnotifier64"
	fi

	sed -i "s/Version=/Version=${pkgver}/g" "${pkgname}.desktop"
	install -m755 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"

	ln -s "/opt/${pkgname}/bin/pycharm.sh" "${pkgdir}/usr/bin/pycharm-eap"
}

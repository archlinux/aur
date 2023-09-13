pkgname="rt-pyocd-git"
pkgver=0.2.0.0.g8c6a063
pkgrel=1
pkgdesc="RT_Thread DAP-Link 调试实例!"
arch=("x86_64")
license=("")
depends=('git' 'python')
url="https://github.com/RT-Thread-Studio/sdk-debugger-pyocd"

pkggitname="sdk-debugger-pyocd"

source=(${pkggitname}::git+https://github.com/RT-Thread-Studio/${pkggitname}.git)
sha512sums=(SKIP)

ROOT="${HOME}/.rt-thread"
TOOLS_ROOT="${ROOT}/tools"
PYOCD_ROOT="${TOOLS_ROOT}/pyocd"

pkgver() {
	_ver=`cd ${pkggitname} && git describe --long --tags | sed 's/-/\./g; s/^v//; s/g*$//'`
	echo $_ver
}

build() {
	mkdir -p ${srcdir}${ROOT}
	python -m venv ${srcdir}${PYOCD_ROOT}
	${srcdir}${PYOCD_ROOT}/bin/pip install pyocd
	cp -r ${srcdir}/${pkggitname}/packs ${srcdir}${PYOCD_ROOT}/bin
	cd ${srcdir}${PYOCD_ROOT}/bin/packs && python ./update_yaml.py
}

package() {
	mkdir -p ${pkgdir}${HOME}
	chmod 700 ${pkgdir}${HOME}
	install -d -m755 "${pkgdir}${PYOCD_ROOT}"
	cp -rf ${srcdir}${PYOCD_ROOT}/* "${pkgdir}${PYOCD_ROOT}"
  	chown -R $USER:`id -g -n $USER` ${pkgdir}${PYOCD_ROOT}
}

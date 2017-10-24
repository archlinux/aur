# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

# You need to manually download the IBM ILOG CPLEX Optimization Studio installer
# and place it into the same directory as this PKGBUILD, before you proceed.

pkgname='cplex'
pkgdesc="A commercial solver for mathematical optimization problems."
pkgver=12.7.1
pkgrel=1
arch=('x86_64')
url='https://www.ibm.com/software/products/de/ibmilogcpleoptistud'
license=('custom')
makedepends=('python2-setuptools') # 'python-setuptools'
depends=('gcc-libs')
optdepends=(
	'python2: for Python2 bindings'
#	'python: for Python bindings'
)
options=('!strip')

_basename="cplex_studio${pkgver}.linux-${arch/_/-}"
_installer="${_basename}.bin"
_archdir="${arch/_/-}_linux"

source=(${_installer} installer.properties.template)

prepare() {
	chmod +x "${_installer}"

	cd "${srcdir}"

	# Installer can only work with absolute paths.
	sed "s,ROOT,${srcdir}/${_basename}," installer.properties.template > installer.properties

	# Extract source by running the installer.
	"./${_installer}" -f "${srcdir}/installer.properties"
}

package() {
	cd "${srcdir}/${_basename}"

	# Install binaries.
	install -Dm755 "./cplex/bin/${_archdir}/convert" "${pkgdir}/usr/bin/cplex-convert"
	install -Dm755 "./cplex/bin/${_archdir}/cplex" "${pkgdir}/usr/bin/cplex"
	install -Dm755 "./cplex/bin/${_archdir}/cplexamp" "${pkgdir}/usr/bin/cplexamp"

	# Install library files.
	install -dm755 "${pkgdir}/usr/lib"
	install -m755  "./cplex/bin/${_archdir}/"*.so "${pkgdir}/usr/lib/"

	# Install C headers.
	install -dm755 "${pkgdir}/usr/include"
	install -m755  "./cplex/include/ilcplex/"*.h "${pkgdir}/usr/include/"

	# Install Python2 bindings.
	cd "./cplex/python/2.7/${_archdir}/"
	python2 setup.py install --root="${pkgdir}/" --optimize=1
	cd "../../../../"

	# Install Python bindings.
	# Currently, CPLEX does not support Python 3.6.
	#cd "./cplex/python/3.5/${_archdir}/"
	#python3 setup.py install --root="${pkgdir}/" --optimize=1
	#cd "../../../../"

	# Install documentation.
	install -dm755 "${pkgdir}/usr/share/licenses/cplex"
	install -m644  "./license/"*.txt "${pkgdir}/usr/share/licenses/cplex/"
}

md5sums=('c4b6170db9b64c0afa5dbb48bfba79fa'
         'f295f6c4ecd0f3a6d2fdca21788efd0f')

# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Giacomo Vercesi <mrjackv@hotmail.it>

pkgname='python-cef'
_vermajor="66"
pkgver=66.1.r3.g5679f28
pkgrel=3
pkgdesc="CEF python bindings (with bundled spotify-built CEF)"
arch=('x86_64')
url='https://github.com/cztomczak/cefpython'
depends=('python' 'nss' 'libgl' 'libxtst' 'alsa-lib' 'gtk2' 'libxss')
makedepends=('python-docopt' 'python-setuptools' 'python-wheel' 'cython' 'git')
license=('BSD')
_cefstring="cef66_3.3359.1774.gd49d25f_linux64"
_prefix="${pkgname}-${pkgver}"
source=("git+https://github.com/cztomczak/cefpython.git#commit=5679f28cec18a57a56e298da2927aac8d8f83ad6"
        "${pkgname}-version.patch"
        "https://github.com/cztomczak/cefpython/releases/download/v${_vermajor}-upstream/${_cefstring}.zip"
        "${pkgname}-fix-build.patch")
sha256sums=('SKIP'
            '4c1402716a3d05179bbf0cc88de7dcafb0191381410347bc1747e4ac983165ea'
            'a9ec9a72cc84f290cb985bbf06b9825312b7f84cb3e1ca3f4dcfeeeef338d84b'
            '74aa087814d6f34366b0f01c95eb2d0c31dd4e9c3614f00d33436f8c733529a1')

_dirpkgver="${_vermajor}.0"
_dir="cefpython"

pkgver() {
	cd "${_dir}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${_dir}"
	patch -p1 -i "../${pkgname}-version.patch"
	patch -p1 -i "../${pkgname}-fix-build.patch"

	sed -i 's/command = sudo_command/#command = sudo_command/' 'tools/build.py'
	sed -i 's/open(header_file, "rU")/open(header_file, "r", newline=None)/' 'tools/common.py'
	sed -i 's/cpdef list headerMultimap = \[\]/cdef list headerMultimap = \[\]/' 'src/request.pyx' 'src/response.pyx'

	mkdir -p 'build'
	cd 'build'
	if [ ! -d "${_cefstring}" ]; then
		ln -s "$(realpath ../../${_cefstring})"
	fi
	#cythonver="$(pacman -Q cython | cut -d' ' -f2 | cut -d'-' -f1)"
	#sed -i "s;Cython ==;Cython == $cythonver;" '../tools/requirements.txt'
	
	sed -i '/check_cython_version()$/d' '../tools/build.py'
}

build() {
	cd "${_dir}/build"
	python '../tools/build.py' "${_dirpkgver}"
}

check() {
	cd "${_dir}/build"
	python '../unittests/_test_runner.py'
}

package() {
	cd "${_dir}/build"
	python '../tools/make_installer.py' --version "${_dirpkgver}"
	cd "cefpython3_${_dirpkgver}_linux64"
	sed -i 's;        post_install_hook();#&;g' 'setup.py'
	python 'setup.py' install --root="$pkgdir/" --optimize=1 --skip-build
	pythonver="$(python -c 'import platform; print(".".join(platform.python_version_tuple()[:2]))')"
	cp -r 'cefpython3' "${pkgdir}/usr/lib/python${pythonver}/site-packages/"
	cd "${pkgdir}/usr/lib/python${pythonver}/site-packages/cefpython3"
	pythonver="$(python -c 'import platform; print("".join(platform.python_version_tuple()[:2]))')"
	sed -i "s;    raise.*$;    from . import cefpython_py${pythonver} as cefpython\n#&;g" '__init__.py'
	chmod +x cefclient cefsimple ceftests subprocess
	find . -name '*.log' -exec chmod 666 {} \;
}

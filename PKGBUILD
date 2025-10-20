# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=python2-lxml
_pkgver=4.9.4
_libxslt_ver=1.1.41
pkgver=${_pkgver/-/.}
pkgrel=5
pkgdesc='Python2 binding for the libxml2 and libxslt libraries'
arch=('i686' 'x86_64' 'armv7h')
url='https://lxml.de/'
license=(
	'MIT'
	'BSD-3-Clause'
	'custom:ElementTree'
	'GPL-2.0-only'
)
depends=('python2' 'glibc' 'xz' 'libgcrypt' 'libxml2-2.9')
makedepends=('python2-setuptools' 'cython2' 'patchelf')
optdepends=(
	'python2-beautifulsoup4: malformed HTML parsing support'
	'python2-cssselect: CSS parsing support'
	'python2-html5lib: HTML5 parsing support'
)
checkdepends=(
	'python2-cssselect'
	#'docbook-xml'
)
source=(
	"https://github.com/lxml/lxml/archive/lxml-$_pkgver.tar.gz"
	"https://gitlab.gnome.org/GNOME/libxslt/-/archive/v${_libxslt_ver}/libxslt-v${_libxslt_ver}.tar.gz")
sha512sums=('528ef4ae057a7ee54d3193a042a6db500ada883d1d506829b6824d91ec979feb69ec79239420112eae0e08a437b2e5da8efc35feb5d04d119bfae2679e918d29'
            '34f69bd70ae203edbed590a36f002614f9d1f3462861f61fe9251d0a026549a130e9dc2d75aea843b0e28337e676a8bf3ae1368b5d5e63c9dfe448515ba8fe94')
_dir="lxml-lxml-${_pkgver}"
_libxslt_dir="libxslt-v${_libxslt_ver}"

_python2_setup() {
	python2 setup.py "$@" \
		--with-xml2-config='xml2-config-2.9' \
		--with-xslt-config="${srcdir}/libxslt-install/bin/xslt-config" \
		--auto-rpath
}

prepare() {
	cd "${_libxslt_dir}"
	sed -i 's/\[xml2-config\]/[xml2-config-2.9]/' 'configure.ac'
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd "${_libxslt_dir}"
	#--disable-shared --enable-static
	./configure \
		--prefix="${srcdir}/libxslt-install" \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--enable-shared --disable-static \
		--without-python
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make
	make install

	cd "${srcdir}/${_dir}"
	export CFLAGS+=' -Wno-error=incompatible-pointer-types'
	_python2_setup build build_ext -i
}

check() {
	#cd "${_libxslt_dir}"
	#make check

	cd "${srcdir}/${_dir}"
	# need to use UTF-8 based locale; tests fail with e.g. LC_ALL=C
	LC_ALL=C.UTF-8 python2 test.py -p -v
}

package() {
	cd "${_dir}"
	_python2_setup install --root "${pkgdir}" --prefix=/usr --optimize=1 --skip-build

	local site_packages="$(python2 -c "import site; print(site.getsitepackages()[0])")"
	install -Dm755 "${srcdir}/libxslt-install/lib/libxslt.so"* -t "${pkgdir}${site_packages}/lxml"
	install -Dm755 "${srcdir}/libxslt-install/lib/libexslt.so"* -t "${pkgdir}${site_packages}/lxml"
	patchelf --set-rpath '/usr/lib/libxml2-2.9:$ORIGIN' "${pkgdir}${site_packages}/lxml/"*.so

	install -Dm644 'LICENSES.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 'doc/licenses/BSD.txt' "$pkgdir/usr/share/licenses/$pkgname/BSD.txt"
	install -Dm644 'doc/licenses/elementtree.txt' "$pkgdir/usr/share/licenses/$pkgname/elementtree.txt"
}

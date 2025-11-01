# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=python2-lxml
_pkgver=4.9.4
_libxslt_ver=1.1.41
_libxml2_commit=41a34e1f4ffae2ce401600dbb5fe43f8fe402641
pkgver=${_pkgver/-/.}
pkgrel=6
pkgdesc='Python2 binding for the libxml2 and libxslt libraries'
arch=('i686' 'x86_64' 'armv7h')
url='https://lxml.de/'
license=(
	'MIT'
	'BSD-3-Clause'
	'custom:ElementTree'
	'GPL-2.0-only'
)
depends=('python2' 'glibc' 'xz' 'libgcrypt' 'icu' 'ncurses' 'readline' 'zlib')
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
	"https://gitlab.gnome.org/GNOME/libxslt/-/archive/v${_libxslt_ver}/libxslt-v${_libxslt_ver}.tar.gz"
	"libxml2-2.9.tar.gz::https://gitlab.gnome.org/GNOME/libxml2/-/archive/${_libxml2_commit}/libxml2-${_libxml2_commit}.tar.gz"
	'libxml2-2.9.8-python3-unicode-errors.patch'
  'fix-relaxed-approach-to-nested-documents.patch'
  'libxml2-2.9.10-CVE-2019-20388.patch'
  'libxml2-2.9.10-CVE-2020-7595.patch'
  'libxml2-2.9.10-parenthesize-type-checks.patch'
  'libxml2-2.9.10-CVE-2020-24977.patch'
  'libxml2-2.9.10-fix-integer-overflow.patch'
  'libxml2-2.9.10-icu68.patch'
  'https://www.w3.org/XML/Test/xmlts20130923.tar.gz')
sha512sums=('528ef4ae057a7ee54d3193a042a6db500ada883d1d506829b6824d91ec979feb69ec79239420112eae0e08a437b2e5da8efc35feb5d04d119bfae2679e918d29'
            '34f69bd70ae203edbed590a36f002614f9d1f3462861f61fe9251d0a026549a130e9dc2d75aea843b0e28337e676a8bf3ae1368b5d5e63c9dfe448515ba8fe94'
            '2ebc331351d9d0000f9dc12b3801259123cecf41656891dc750ec690ef3bcb9335e52ac634f9c50a62c315d55bdccb8fe7b91d95c97c6894e344ffe5ebcbabf4'
            'a205c97fa1488fb8907cfa08b5f82e2055c80b86213dc3cc5c4b526fe6aa786bcc4e4eeb226c44635a1d021307b39e3940f706c42fb60e9e3e9b490a84164df7'
            'ea18128ebc4a90a5ca45e3f48b3d491389298c71885d7e68e049b0fd0251717e670621b7d72d3c87da190b21d3ee116ae0cbe3a169ba4256ae88854d5b140506'
            '19e65a3e38f96414c81267afd13ad8af91b7d42ce929c6db0abb41532e22990e79133bc322589a02fe50804ef21f79e868dc8607cc4895e40c101c2407f6702b'
            '90db832e60c700e971669f57a54fdb297660c42602089b4e77e013a7051c880f380f0c98c059d9f54de99855b2d9be78fcf0639443f3765a925b52fc093fb4d9'
            'ab569566779a7f7f4737ad9b27ebaae9c71ed88bdd2d599dd24610ee5d1529af7af8eed2b11945dccc25f4325f7eb3d1cdc563447edf80ce0b8fbbf502c0efaf'
            '990540cf547e94289a7636d5557602d0afd7c7dc337194be615d30cb8a65ae22a8202ee8f4d5d715e529377616f4d73eaef7354e37ad8aa69f4b9d4b5897e3b6'
            '7cdd20a6a505f1c6f8dd1514fbd34caaf7820bb97833731fb2f599c417002d2d30b222eed826b1247da1871b8fd3b0fea74b1a4c08317f3efcf3d0c145a3b769'
            '4bfa2227d8f037dcf4558abd61510c7d45a5326ad6a9ae040b11d3da9c447de4a26946685504d17b7a267d4e98d7bb9093f280096f6640f8a865bf4bcb04ede9'
            'd5c4d26b324ed21f4e0641cd7f8b76dbf9de80df8b519982e44d41c960df29fd03618e02e9693b2d11ad06d19c4a965274c95a048ec3b9653eacb919a7f8b733')
_dir="lxml-lxml-${_pkgver}"
_libxslt_dir="libxslt-v${_libxslt_ver}"
_libxml2_dir="libxml2-${_libxml2_commit}"

_python2_setup() {
	python2 setup.py "$@" \
		--with-xml2-config="${srcdir}/temp-install/bin/xml2-config-2.9" \
		--with-xslt-config="${srcdir}/temp-install/bin/xslt-config" \
		--auto-rpath
}

prepare() {
	# libxml2
	cd "${srcdir}/${_libxml2_dir}"
	# From https://src.fedoraproject.org/rpms/libxml2/tree/master
  patch -Np1 -i ../fix-relaxed-approach-to-nested-documents.patch
  patch -Np1 -i ../libxml2-2.9.8-python3-unicode-errors.patch
  patch -Np1 -i ../libxml2-2.9.10-CVE-2019-20388.patch
  patch -Np1 -i ../libxml2-2.9.10-parenthesize-type-checks.patch
  patch -Np1 -i ../libxml2-2.9.10-CVE-2020-24977.patch
  patch -Np1 -i ../libxml2-2.9.10-fix-integer-overflow.patch
  patch -Np1 -i ../libxml2-2.9.10-icu68.patch
  # icu76 needs uc
  sed -i 's/icu-i18n/icu-i18n,icu-uc/' configure.ac
  NOCONFIGURE=1 ./autogen.sh

	# libxslt
	cd "${srcdir}/${_libxslt_dir}"
	sed -i 's/\[xml2-config\]/[xml2-config-2.9]/' 'configure.ac'
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	export PATH="${srcdir}/temp-install/bin:$PATH"

	# libxml2
	cd "${srcdir}/${_libxml2_dir}"
	./configure \
		--prefix="${srcdir}/temp-install" \
		--sysconfdir='/etc' \
		--localstatedir='/var' \
		--program-suffix='-2.9' \
		--libdir="${srcdir}/temp-install/lib/libxml2-2.9" \
		--includedir="${srcdir}/temp-install/include/libxml2-2.9" \
		--with-history \
		--without-docbook \
		--with-icu \
		--without-python \
		--with-threads \
		--disable-static
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make
	make install

	# libxslt
	cd "${srcdir}/${_libxslt_dir}"
	./configure \
		--prefix="${srcdir}/temp-install" \
		--sysconfdir='/etc' \
		--localstatedir='/var' \
		--enable-shared --disable-static \
		--without-python
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make
	make install

	# python2-lxml
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
	install -Dm755 "${srcdir}/temp-install/lib/libxslt.so"* -t "${pkgdir}${site_packages}/lxml"
	install -Dm755 "${srcdir}/temp-install/lib/libexslt.so"* -t "${pkgdir}${site_packages}/lxml"
	install -Dm755 "${srcdir}/temp-install/lib/libxml2-2.9/libxml2.so"* -t "${pkgdir}${site_packages}/lxml"
	patchelf --set-rpath '$ORIGIN' "${pkgdir}${site_packages}/lxml/"*.so

	install -Dm644 'LICENSES.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 'doc/licenses/BSD.txt' "$pkgdir/usr/share/licenses/$pkgname/BSD.txt"
	install -Dm644 'doc/licenses/elementtree.txt' "$pkgdir/usr/share/licenses/$pkgname/elementtree.txt"
}

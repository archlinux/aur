# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

pkgname='python315-freethreaded'
pkgver=3.15.2
pkgrel=1
_pybasever='3.15'
pkgdesc='CPython 3.15 with free-threading support (GIL disabled)'
arch=('x86_64')
url='https://www.python.org/'
license=(
	'PSF-2.0'
	'MIT'
	'Apache-2.0'
	'BSD-2-Clause'
	'BSD-3-Clause'
	'ISC'
	'MPL-2.0'
)
depends=(
	'expat'
	'gdbm'
	'libffi'
	'ncurses'
	'openssl'
	'readline'
	'util-linux-libs'
	'zlib'
	'zstd'
)
makedepends=(
	'bluez-libs'
	'cosign'
	'gdb'
	'mpdecimal'
	'sqlite'
	'tk'
)
optdepends=(
	'mpdecimal: decimal module'
	'sqlite: SQLite bindings'
	'tk: tkinter module'
	'xz: LZMA compression'
)
options=('!emptydirs')
source=(
	"https://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tar.xz"
	"https://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tar.xz.sigstore"
	'check-freethreading.py'
	'LICENSE-mimalloc::https://raw.githubusercontent.com/microsoft/mimalloc/v2.1.9/LICENSE'
	'LICENSE-HACL::https://raw.githubusercontent.com/hacl-star/hacl-star/8ba599b2f6c9701b3dc961db895b0856a2210f76/dist/LICENSE.txt'
)
sha256sums=(
	'8b5536d280142ecf6cdfe15d12a21ba1c65e300bbf7b28a8d0cdb849575797de'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)
b2sums=(
	'SKIP'
	'SKIP'
	'47dbaab3420da37924491a19b42347aab5ef7fc45e0ab2eda4fc96180a802ec6802b53378fb73dc26db4bc457378a0f2d26cae1de645eba3770c5dd4c339b25a'
	'1366540f2137336d52454cadf92a5e1c9842c8578448bb82c8d566f529826eaafab239fe3d7a53215c176cb302b443e5fce6ed961f7f467a85333b8197f2b5ff'
	'e6b5bfd1def200509cd936af306f484acd79a6608a0597898d48fc0255ba0aa6195c568ac54507fc3ad6d3d8bc577bf09a3a938a0c391626695e857970063aed'
)

verify() {
	cosign verify-blob \
		--certificate-oidc-issuer 'https://github.com/login/oauth' \
		--certificate-identity 'hugo@python.org' \
		--bundle "${SRCDEST}/Python-${pkgver}.tar.xz.sigstore" \
		"${SRCDEST}/Python-${pkgver}.tar.xz"
}

prepare() {
	cd -- "${srcdir}/Python-${pkgver}" || return 1

	rm -rf -- Modules/expat Modules/zlib Modules/_ctypes/{darwin,libffi}* Modules/_decimal/libmpdec
}

build() {
	cd -- "${srcdir}/Python-${pkgver}" || return 1

	local _cflags="${CFLAGS} -fno-semantic-interposition -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer"
	CFLAGS="${_cflags}" ./configure \
		ax_cv_c_float_words_bigendian=no \
		--prefix=/usr \
		--enable-ipv6 \
		--enable-loadable-sqlite-extensions \
		--enable-shared \
		--with-computed-gotos \
		--with-dbmliborder=gdbm:ndbm \
		--with-lto \
		--disable-gil \
		--with-system-expat \
		--with-system-libmpdec \
		--with-tzpath=/usr/share/zoneinfo \
		--without-ensurepip

	make EXTRA_CFLAGS="${_cflags}"
}

check() {
	cd -- "${srcdir}/Python-${pkgver}" || return 1

	local _ldpath="${PWD}${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
	LD_LIBRARY_PATH="${_ldpath}" ./python -X gil=0 "${srcdir}/check-freethreading.py"
	LD_LIBRARY_PATH="${_ldpath}" ./python -X gil=0 -m test -j 2 --timeout 180 \
		test_free_threading test_threading test_sysconfig test_ssl
}

package() {
	cd -- "${srcdir}/Python-${pkgver}" || return 1

	make DESTDIR="${pkgdir}" altinstall

	rm -rf -- "${pkgdir}/usr/lib/python${_pybasever}t/test" \
		"${pkgdir}/usr/lib/python${_pybasever}t/idlelib/idle_test"

	rm -f -- "${pkgdir}/usr/lib/libpython3.so"
	mv -- "${pkgdir}/usr/bin/idle${_pybasever}" "${pkgdir}/usr/bin/idle${_pybasever}t"
	mv -- "${pkgdir}/usr/bin/pydoc${_pybasever}" "${pkgdir}/usr/bin/pydoc${_pybasever}t"
	rm -f -- "${pkgdir}/usr/bin/python${_pybasever}"
	rm -rf -- "${pkgdir}/usr/share/man"

	sed -i "s|${srcdir}/Python-${pkgver}:||" \
		"${pkgdir}/usr/lib/python${_pybasever}t/config-${_pybasever}t-${CARCH}-linux-gnu/Makefile"

	local _installed_config="/usr/lib/python${_pybasever}t/config-${_pybasever}t-${CARCH}-linux-gnu"
	local _installed_lib="${pkgdir}/usr/lib/python${_pybasever}t"
	local _sysconfig_py="${_installed_lib}/_sysconfigdata_t_linux_${CARCH}-linux-gnu.py"
	sed -i \
		-e "s|${srcdir}/Python-${pkgver}|${_installed_config}|g" \
		-e "s|LD_LIBRARY_PATH=${_installed_config}|LD_LIBRARY_PATH=/usr/lib|g" \
		"${pkgdir}${_installed_config}/Makefile" \
		"${_sysconfig_py}" \
		"${_installed_lib}/_sysconfig_vars_t_linux_${CARCH}-linux-gnu.json"

	# The installed sysconfig bytecode must match the relocated source data.
	LD_LIBRARY_PATH="${pkgdir}/usr/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" \
		PYTHONHOME="${pkgdir}/usr" \
		"${pkgdir}/usr/bin/python${_pybasever}t" -m compileall -q -f -o 0 -o 1 -o 2 \
		-s "${pkgdir}" -p / "${_sysconfig_py}"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/LICENSE-mimalloc" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-mimalloc"
	install -Dm644 "${srcdir}/LICENSE-HACL" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-HACL"
}

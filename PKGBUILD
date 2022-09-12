# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

_projectname='curl'
_libname='libcurl-gnutls'
pkgname="${_libname}.so"
pkgver='7.85.0'
pkgrel=1
pkgdesc='An URL retrieval library (without versioned symbols and linked against gnutls)'
arch=('x86_64')
url='https://curl.haxx.se'
license=('MIT')
depends=('brotli' 'ca-certificates' 'curl' 'gnutls' 'krb5' 'libbrotlidec.so'
         'libgssapi_krb5.so' 'libidn2' 'libidn2.so' 'libnghttp2' 'libpsl'
         'libpsl.so' 'libssh2' 'libssh2.so' 'openssl' 'zlib' 'zstd'
         'libzstd.so')
provides=("${_libname}" "${pkgname}")
conflicts=("${_libname}")
source=("https://curl.haxx.se/download/${_projectname}-${pkgver}.tar.gz"{,.asc})
sha512sums=('bbad693bcde9c55e5942499950d76011f53ad43d3270eee2c8db486bcf46f5fc92b32dd8752caf4c5976fe493d083e2d34fa299cb96fb8e76d8f5fcc2cc56a36'
            'SKIP')

validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2') # Daniel Stenberg

prepare() {
	cd "${srcdir}/${_projectname}-${pkgver}"
	sed -i 's/libcurl\.la/libcurl\-gnutls\.la/g;s/libcurl_la/libcurl_gnutls_la/g;' \
		"${srcdir}/${_projectname}-${pkgver}/docs/examples/Makefile.am" \
		"${srcdir}/${_projectname}-${pkgver}/lib/Makefile.am" \
		"${srcdir}/${_projectname}-${pkgver}/src/Makefile.am" \
		"${srcdir}/${_projectname}-${pkgver}/tests/libtest/Makefile.am" \
		"${srcdir}/${_projectname}-${pkgver}/lib/libcurl.vers.in"
}

_configure_options=(
	--prefix='/usr'
	--mandir='/usr/share/man'
	--disable-ldap
	--disable-ldaps
	--disable-manual
	--enable-ipv6
	--enable-threaded-resolver
	--with-gssapi
	--with-libssh2
	--with-random='/dev/urandom'
	--with-ca-bundle='/etc/ssl/certs/ca-certificates.crt'
	--disable-versioned-symbols
	--without-ssl
	--with-gnutls='/usr'
)

_make_options=(
	libcurl_gnutls_la_CPPFLAGS='$(AM_CPPFLAGS) $(libcurl_gnutls_la_CPPFLAGS_EXTRA)'
	libcurl_gnutls_la_LDFLAGS='$(AM_LDFLAGS) $(libcurl_gnutls_la_LDFLAGS_EXTRA) $(LDFLAGS) $(LIBCURL_LIBS)'
	libcurl_gnutls_la_CFLAGS='$(AM_CFLAGS) $(libcurl_gnutls_la_CFLAGS_EXTRA)'
)

build() {
	cd "${srcdir}/${_projectname}-${pkgver}"
	autoreconf -i
	"${srcdir}/${_projectname}-${pkgver}"/configure \
		"${_configure_options[@]}" \
		"${_make_options[@]}"
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make -C lib "${_make_options[@]}" all
}


package() {
	cd "${srcdir}/${_projectname}-${pkgver}"
	make -C lib DESTDIR="${pkgdir}" "${_make_options[@]}" install
	install -dm 0755 "${pkgdir}"/usr/share/licenses
	ln -s curl "${pkgdir}"/usr/share/licenses/libcurl-gnutls
}


# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
_libressl_ver='2.8.3'
_sqlite3_ver='3270100'
pkgname=slant-git
pkgver=0.0.17.r10.gc3d1f0b
pkgrel=1
pkgdesc='Minimal open source system monitor for remote UNIX machines'
url=https://kristaps.bsd.lv/slant
license=(custom:ISC)
arch=(x86_64)
makedepends=(kwebapp kcgi ksql git)
depends=(zlib sh)
source=("${pkgname}::git+https://github.com/kristapsdz/${pkgname%-git}/"
        "http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${_libressl_ver}.tar.gz"
        "http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${_libressl_ver}.tar.gz.asc"
		"https://www.sqlite.org/2019/sqlite-amalgamation-${_sqlite3_ver}.zip")
sha512sums=('SKIP'
            '3967e08b3dc2277bf77057ea1f11148df7f96a2203cd21cf841902f2a1ec11320384a001d01fa58154d35612f7981bf89d5b1a60a2387713d5657677f76cc682'
            'SKIP'
            '9e9ace498bfb89631d3798e43d3da372d204b869948ecd77fbf18a7eee2b364cdbc6d20fc0482457506a5301bb492fec3af9bf87d4d9f047e08181b7e74aeb68')
validpgpkeys=(A1EB079B8D3EB92B4EBD3139663AF51BD5E4D8D5)

pkgver () {
	cd "${pkgname}"
	( set -o pipefail
	  git describe --long --tags 2> /dev/null\
	  	| sed -e 's/^VERSION_//;s/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	# SQLite3
	msg2 "Building static SQLite3 ${_sqlite3_ver} ..."
	cd "${srcdir}/sqlite-amalgamation-${_sqlite3_ver}"
	gcc ${CFLAGS} \
		-DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 \
		-DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 \
		-DHAVE_STRINGS_H=1 -DDHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 \
		-DHAVE_UNISTD_H=1 -DHAVE_FDATASYNC=1 -DHAVE_USLEEP=1 \
		-DHAVE_LOCALTIME_R=1 -DHAVE_GMTIME_R=1 -DHAVE_DECL_STRERROR_R=1 \
		-DHAVE_STRERROR_R=1 -DHAVE_POSIX_FALLOCATE=1 -DHAVE_ZLIB_H=1 \
		-D_REENTRANT=1 -DSQLITE_THREADSAFE=1 -DSQLITE_ENABLE_FTS{4,5} \
		-DSQLITE_ENABLE_JSON1 -DSQLITE_ENABLE_RTREE \
		-DSQLITE_ENABLE_SESSION -DSQLITE_OMIT_LOAD_EXTENSION \
		-DSQLITE_ENABLE_PREUPDATE_HOOK -DSQLITE_HAVE_ZLIB \
		-c -o sqlite3.o sqlite3.c
	ar rcs libsqlite3.a sqlite3.o

	# LibreSSL
	msg2 "Building static LibreSSL ${_libressl_ver} ..."
	cd "${srcdir}/libressl-${_libressl_ver}"
	./configure \
		--disable-shared \
		--enable-static \
		--prefix=/usr \
		--sysconfdir=/etc
	make install DESTDIR="$(pwd)/prefix"
	
	# Slant
	msg2 "Building Slant ${pkgver} ..."
	cd "${srcdir}/${pkgname}"
	./configure PREFIX=/usr MANDIR=/usr/share/man SBINDIR=/usr/bin

	# Workaround things to make sure that binaries are linked to the
	# static versions of LibreSSL and SQLite3 built above. This is
	# ugly, but gets the job done.
	cat >> Makefile.configure <<-EOF
	XCFLAGS := \$(CFLAGS)
	XCFLAGS += ${CFLAGS} -fPIC -fPIE -s
	XCFLAGS += -I${srcdir}/libressl-${_libressl_ver}/prefix/usr/include
	XCFLAGS += -I${srcdir}/sqlite-amalgamation-${_sqlite3_ver}
	XCFLAGS += \$(shell pkg-config libtls libssl libcrypto --cflags) -pthread

	XLDFLAGS := \$(LDFLAGS)
	XLDFLAGS += ${LDFLAGS} -fPIE -s
	XLDFLAGS += -L${srcdir}/libressl-${_libressl_ver}/prefix/usr/lib
	XLDFLAGS += -L${srcdir}/sqlite-amalgamation-${_sqlite3_ver}
	
	XLDADD := \$(LDADD)
	XLDADD += \$(shell pkg-config libtls libssl libcrypto --libs) -lm -lresolv -pthread

	override LDADD = \$(XLDADD)
	override LDFLAGS = \$(XLDFLAGS)
	override CFLAGS = \$(XCFLAGS)

	override LDADD_SLANT_COLLECTD = \$(XLDADD)
	override LDADD_SLANT_CGI = \$(XLDADD)
	override LDADD_SLANT = \$(XLDADD)
	EOF

	PKG_CONFIG_PATH="${srcdir}/libressl-${_libressl_ver}/prefix/usr/lib/pkgconfig" \
		make
}

package () {
	cd "${pkgname}"

	# Ugh. Workaround.
	install -dm755 "${pkgdir}/usr/share/man"/man{1,8}

	PKG_CONFIG_PATH="${srcdir}/libressl-${_libressl_ver}/prefix/usr/lib/pkgconfig" \
		make install \
			DESTDIR="${pkgdir}" \
			PREFIX=/usr \
			SBINDIR=/usr/bin \
			MANDIR=/usr/share/man \
			CGIBIN=/usr/lib/slant
}

# Maintainer: Stephan Eisvogel <eisvogel at embinet dot de>
pkgname=nsjail-git
pkgver=r562.de92727
pkgrel=2
_pkgcommit=#commit=de927275919864c989972db5e8c437582a4e3055
pkgdesc="A light-weight process isolation tool, making use of Linux namespaces and seccomp-bpf syscall filters (with help of the kafel bpf language)"
arch=('x86_64')
url="http://nsjail.com"
license=('Apache')
makedepends=('git' 'autoconf-archive>2016.03.20' 're2c' 'check>=0.9.4')
depends=('libcap' 'libnl>=3' 'protobuf-c')
provides=('nsjail')
conflicts=('nsjail')

source=("${pkgname}::git+git://github.com/google/nsjail.git${_pkgcommit}"
		"protobuf-c-text-001.patch"
		"protobuf-c-text-002.patch"
		"protobuf-c-text-003.patch"
		"protobuf-c-text-004.patch"
		"protobuf-c-text-005.patch")
sha256sums=('SKIP'
			'ff97c12f9415cc662fb688111c8bc0e7136ff0fb7651e24eaa80bf10c3d62685'
			'50cc5cb09e47ddaaf666541e231429311313233a98ead550b1d46ddc0863ef1b'
			'78b4e3c5d66b7e26e25c91f62f2a3fc599356bddac8cb174a2d708d5fc2d997a'
			'970a3b464e63f5b544fb5e41f7aa6cee13161f12f79d002086fc2aab6aa765f5'
			'd9289f5b146a036dfafaa7b0cc6ecca73ab32b454ef1bef5c512874391174df2')

pkgver() {
	cd ${pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# Populate kafel and protobuf-c-text submodules
	cd "${srcdir}/${pkgname}"
	git submodule update --init

	# Package maintainer fixes

	# Fix automake breakage
	sed -i '/^include am\/aminclude_doxygen.am/c@DX_RULES@' protobuf-c-text/Makefile.am
	# Fix wrong variable usage
	sed -i 's/\$(GREP) \/libdata\//\$GREP \/libdata\//' protobuf-c-text/configure.ac
	# Fix bison warning
	sed -i '/if (!ctxt->lexical_error) {/aYYUSE(scanner);' kafel/src/parser.y

	# 3rd party fixes

	_patch="patch -N -t -p1 --no-backup-if-mismatch -i"
	cd protobuf-c-text

	# Fix includes (we ignore the additional Android stuff)
	${_patch} "$srcdir/protobuf-c-text-001.patch"
	# Fix wrong integer en- and decoding in protobuf-c-text library
	${_patch} "$srcdir/protobuf-c-text-002.patch"
	# Added sanity check for size passed to memcpy
	${_patch} "$srcdir/protobuf-c-text-003.patch"
	# esc_str: escape with octal as unsigned (buffer overflow otherwise)
	${_patch} "$srcdir/protobuf-c-text-004.patch"
	# Fixes bad mallocs and memcpys caused by invalid input
	${_patch} "$srcdir/protobuf-c-text-005.patch"
}

build() {
	cd "${srcdir}/${pkgname}/protobuf-c-text"
	autoreconf -vif
	env CFLAGS="${CFLAGS} -fPIC" ./configure --enable-shared=no --disable-doxygen-doc
	cd "${srcdir}/${pkgname}"
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	# Binary
	install -D nsjail "${pkgdir}/usr/bin/nsjail"
	# Manpage
	install -d "${pkgdir}/usr/share/man/man1"
	install -m644 ./nsjail.1 "${pkgdir}/usr/share/man/man1/"
	# Examples, documentation, license
	install -d "${pkgdir}/usr/share/${pkgname}/examples"
	install -m644 configs/*.cfg "${pkgdir}/usr/share/${pkgname}/examples"
	install -m644 LICENSE CONTRIBUTING README.md "${pkgdir}/usr/share/${pkgname}/"
	# Configuration directory
	install -d "${pkgdir}/etc/nsjail"
	echo > "${pkgdir}/etc/nsjail/.placeholder"

	echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo -e "Tip: Your kernel should have CONFIG_USER_NS=y to chroot as a normal user."
	echo -e "     Verify using e.g. this command: zgrep CONFIG_USER_NS /proc/config.gz"
	echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
}

# Maintainer: Stephan Eisvogel <eisvogel at embinet dot de>
pkgname=nsjail-git
pkgver=r450.3e99703
_pkgcommit=#commit=3e99703df21978f4f87717e1563fbbc9454c6848
pkgrel=1
pkgdesc="A light-weight process isolation tool, making use of Linux namespaces and seccomp-bpf syscall filters (with help of the kafel bpf language)"
arch=('x86_64')
url="http://nsjail.com"
license=('Apache')
makedepends=('git' 'autoconf-archive>2016.03.20' 'doxygen' 'graphviz' 're2c' 'check>=0.9.4')
depends=('libnl>=3' 'protobuf-c')
source=("${pkgname}::git+git://github.com/google/nsjail.git${_pkgcommit}"
		"https://github.com/trustm3/external_protobuf-c-text/commit/c37f8708d847319921a3fba7d6863103f6b801e2.patch"
		"https://github.com/trustm3/external_protobuf-c-text/commit/620db2f1a5bf9a1468a2f54ef904977133267aa2.patch"
		"https://github.com/trustm3/external_protobuf-c-text/commit/ccb50d69f833b4417ba66690a0257a8a64eab6ec.patch"
		"https://github.com/trustm3/external_protobuf-c-text/commit/b79ba3f1cd350a9ebc4929fa9d63368b460b8877.patch"
		"https://github.com/trustm3/external_protobuf-c-text/commit/6a8727066180615e7767b550b491e4ef4d0db514.patch")
sha256sums=('SKIP'
			'ff97c12f9415cc662fb688111c8bc0e7136ff0fb7651e24eaa80bf10c3d62685'
			'50cc5cb09e47ddaaf666541e231429311313233a98ead550b1d46ddc0863ef1b'
			'78b4e3c5d66b7e26e25c91f62f2a3fc599356bddac8cb174a2d708d5fc2d997a'
			'970a3b464e63f5b544fb5e41f7aa6cee13161f12f79d002086fc2aab6aa765f5'
			'd9289f5b146a036dfafaa7b0cc6ecca73ab32b454ef1bef5c512874391174df2')
provides=('nsjail')

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

	# 3rd party fixes

	cd protobuf-c-text
	# Fix includes (we ignore the additional Android stuff)
	patch -Np1 -i "$srcdir/c37f8708d847319921a3fba7d6863103f6b801e2.patch"
	# Fix wrong integer en- and decoding in protobuf-c-text library
	patch -Np1 -i "$srcdir/620db2f1a5bf9a1468a2f54ef904977133267aa2.patch"
	# Added sanity check for size passed to memcpy
	patch -Np1 -i "$srcdir/ccb50d69f833b4417ba66690a0257a8a64eab6ec.patch"
	# esc_str: escape with octal as unsigned (buffer overflow otherwise)
	patch -Np1 -i "$srcdir/b79ba3f1cd350a9ebc4929fa9d63368b460b8877.patch"
	# Fixes bad mallocs and memcpys caused by invalid input
	patch -Np1 -i "$srcdir/6a8727066180615e7767b550b491e4ef4d0db514.patch"
}

build() {
	cd "${srcdir}/${pkgname}/protobuf-c-text"
	autoreconf -vif
	env CFLAGS="${CFLAGS} -fPIC" ./configure
	cd "${srcdir}/${pkgname}"
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	install -d "${pkgdir}/etc/nsjail"
	install -d "${pkgdir}/usr/share/${pkgname}/examples"
	install -D nsjail "${pkgdir}/usr/bin/nsjail"
	install -m644 configs/*.cfg "${pkgdir}/usr/share/${pkgname}/examples"
	install -m644 LICENSE CONTRIBUTING README.md "${pkgdir}/usr/share/${pkgname}/"
	echo > "${pkgdir}/etc/nsjail/.placeholder"

	echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo -e "Tip: Your kernel should have CONFIG_USER_NS=y to chroot as a normal user."
	echo -e "     Verify using e.g. this command: zgrep CONFIG_USER_NS /proc/config.gz"
	echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
}

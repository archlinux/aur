# Maintainer: Stephan Eisvogel <eisvogel at embinet dot de>
pkgname=nsjail-git
pkgver=r426.0585f08
pkgrel=1
pkgdesc="A light-weight process isolation tool, making use of Linux namespaces and seccomp-bpf syscall filters (with help of the kafel bpf language)"
arch=('x86_64')
url="http://nsjail.com"
license=('Apache')
makedepends=('git' 'autoconf-archive>2016.03.20' 'doxygen' 're2c' 'check>=0.9.4')
#depends=('libnl>=3' 'protobuf-c')
depends=('libnl>=3')
source=("${pkgname}::git+git://github.com/google/nsjail.git")
sha256sums=('SKIP')
provides=('nsjail')

pkgver() {
	cd ${pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"
	git submodule update --init
	sed -i '/^include am\/aminclude_doxygen.am/c@DX_RULES@' protobuf-c-text/Makefile.am
	sed -i 's/\$(GREP) \/libdata\//\$GREP \/libdata\//' protobuf-c-text/configure.ac
	sed -i 's/-fstack-protector-all //' Makefile
}

package() {
	cd "${srcdir}/${pkgname}"
	# Build without protobuf-c-text support for now, because of build bugs
	make USE_PROTOBUF=no

	install -d "${pkgdir}/etc/nsjail"
	install -d "${pkgdir}/usr/share/${pkgname}/examples"
	install -Ds nsjail "${pkgdir}/usr/bin/nsjail"
	install -m644 configs/*.cfg "${pkgdir}/usr/share/${pkgname}/examples"
	install -m644 LICENSE CONTRIBUTING README.md "${pkgdir}/usr/share/${pkgname}/"
	echo > "${pkgdir}/etc/nsjail/.placeholder"

	echo -e "\nTip: Your kernel should have CONFIG_USER_NS=y to chroot as a normal user."
	echo -e "     Verify using e.g. this command: zgrep CONFIG_USER_NS /proc/config.gz\n"
}

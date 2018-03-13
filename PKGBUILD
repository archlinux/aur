# Maintainer: Stephan Eisvogel <eisvogel at embinet dot de>
pkgname=nsjail-git
pkgver=r836.e0c13f5
pkgrel=1
_pkgcommit=#commit=e0c13f55a87611282a526a5539ebe578541e4fef
pkgdesc="A light-weight process isolation tool, making use of Linux namespaces and seccomp-bpf syscall filters (with help of the kafel bpf language)"
arch=('x86_64')
url="http://nsjail.com"
license=('Apache')
makedepends=('git')
options=('!makeflags')
depends=('libnl>=3' 'protobuf')
provides=('nsjail')
conflicts=('nsjail')
source=("${pkgname}::git+git://github.com/google/nsjail.git${_pkgcommit}")
sha256sums=('SKIP')

pkgver() {
	cd ${pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# Populate kafel submodule
	cd "${srcdir}/${pkgname}"
	git submodule update --init
}

build() {
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
	echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo -e "Tip: Your kernel should have CONFIG_USER_NS=y to chroot as a normal user."
	echo -e "     Verify using e.g. this command: zgrep CONFIG_USER_NS /proc/config.gz"
	echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
}

# Maintainer: Stephan Eisvogel <eisvogel at seitics dot de>
pkgname=nsjail-git
_pkgcommit=#commit=5063fa5af6020bf73c0edce552a7c0156f1d8860
pkgver=r1252.5063fa5
pkgrel=1
pkgdesc="A light-weight process isolation tool, making use of Linux namespaces and seccomp-bpf syscall filters (with help of the kafel bpf language)"
url="http://nsjail.com"
arch=(x86_64)
license=(Apache-2.0)
makedepends=(git)
depends=(protobuf-21 libnl gcc-libs glibc)
provides=(nsjail)
conflicts=(nsjail)
source=(
	"${pkgname}::git+https://github.com/google/nsjail.git${_pkgcommit}"
	protobuf.patch
)
sha256sums=(
	'SKIP'
	'SKIP'
)

pkgver() {
	cd ${pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"

	# Populate kafel submodule
	git submodule update --init

	# Build fix for newer protobuf
	patch -Np1 < "${srcdir}/protobuf.patch"
}

build() {
	cd "${srcdir}/${pkgname}"
	LDFLAGS+=' -Wl,-z,shstk'
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

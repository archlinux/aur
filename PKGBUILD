# Maintainer: Timothée Ravier <tim@siosm.fr>

# Don't forget to set the EXTRAMODULES value in bus1.install

# Values for a grsecurity patched kernel (linux-grsec)
_kernel_version="4.4.8.201604201957-1"
_extramodules_version="4.4.8"

_dep_suffix="-grsec"
_extramodules_version_suffix="grsec"

# Values for an oficial Arch Linux kernel (linux)
# _kernel_version="4.5.2-1"
# _extramodules_version="4.5.2"

# _dep_suffix=""
# _extramodules_version_suffix="ARCH"

pkgname=bus1-git
_pkgname=${pkgname/-git}
pkgver=r419.7f6b78e
pkgrel=1
pkgdesc='Bus1 Out-of-Tree Kernel Module'
arch=('i686' 'x86_64')
url="https://github.com/bus1/${_pkgname}"
depends=("linux${_dep_suffix}=${_kernel_version}")
makedepends=('xmlto' 'docbook-xsl' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
license=('LGPL2.1')
options=(!strip)
source=("git+https://github.com/bus1/${_pkgname}.git")
sha256sums=('SKIP')
install="${_pkgname}.install"

pkgver() {
	cd ${_pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${_pkgname}
	make
	make -f Makefile.docs
}

package() {
	cd ${_pkgname}
	install -Dm 0644 ipc/bus1/bus1.ko \
		"${pkgdir}"/usr/lib/modules/extramodules-${_extramodules_version}-${_extramodules_version_suffix}/kernel/ipc/bus1/bus1.ko
	install -dm 0755 "${pkgdir}"/usr/share/man/man7/
	install -m 0644 Documentation/bus1/bus1*.7 "${pkgdir}"/usr/share/man/man7/
	install -Dm 0644 include/uapi/linux/bus1.h "${pkgdir}"/usr/include/linux/bus1.h
}

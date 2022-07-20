# Maintainer: Omar Pakker <archlinux@opakker.nl>
# Contributor: Parker Reed <parker.l.reed@gmail.com>
# Contributor: dale <dale@archlinux.org>

_pkgname=pilot-link
pkgname="${_pkgname}-git"
pkgver=r1916.b0d20fe
pkgrel=1
pkgdesc="A suite of tools for connecting to PalmOS handheld devices"
url="http://www.pilot-link.org/"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL' 'LGPL')
depends=('readline' 'libpng' 'libusb-compat' 'popt' 'bluez-libs')
makedepends=('git')
options=('!libtool')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/desrod/pilot-link.git"
        "config.guess::https://aur.archlinux.org/cgit/aur.git/plain/config.guess?h=${_pkgname}"
        "config.sub::https://aur.archlinux.org/cgit/aur.git/plain/config.sub?h=${_pkgname}"
	"pilot-link-png14.patch::https://aur.archlinux.org/cgit/aur.git/plain/pilot-link-png14.patch?h=${_pkgname}"
        "configure-checks.patch"
        "format-string-literals.patch")
sha512sums=('SKIP'
            'e9a80021a526299995e21094d76810a21d3982c00020f13a3c7527ba2b83459863f4f8eeb3b1ee7a4f1e2ff6c51d7b5e8ae2a6ce719392cf676ae848599117b3'
            '0ec40128c1ef50e47432ee4ebbb4ea6d2feaa411ff518626c4181b0302c5d0ff4095aaf36e433a216ce1bd5bb03ba416645a46ef3c916718761f9a21f5bdcbfd'
            'cf37e4b51d261431f42054cf05d1603e66d8eca0604ae042371c7284c8e668f49cadb3d75cf67eaf56008809d3cc2766615105658293a90cada37bdf3f553f41'
            '3a3393d8f203eb762b6505cfb7d3351b92e94ccc89934754a8784271c90e6cde717902605db24ac4021cffd7ab6a26ee22c6c4a5a3146a29823f70b6298bf52c'
            '2b5f81a2fc29a126533f48dbff297fd33fd32aaee1d34042b5b1ff7e910920a15e030e7f847935235cc8e7ee5a0aaac4b67855619ed13d75631c5ca73a3f9b19')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"

	cp "${srcdir}"/config.* .

	for patch in "${srcdir}"/*.patch; do
		patch -p1 < "${patch}"
	done
}

build() {
	cd "${srcdir}/${_pkgname}"

	./autogen.sh \
		--prefix=/usr \
		--enable-conduits \
		--enable-libusb \
		--with-libiconv \
		--with-libpng

	make
}

package() {
	cd "${srcdir}/${_pkgname}"

	make DESTDIR="${pkgdir}" install
}

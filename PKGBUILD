# Maintainer: Omar Pakker <archlinux@opakker.nl>
# Contributor: Parker Reed <parker.l.reed@gmail.com>
# Contributor: dale <dale@archlinux.org>

_pkgname=pilot-link
pkgname="${_pkgname}-git"
pkgver=r1930.55c346e3
pkgrel=1
pkgdesc="A suite of tools for connecting to PalmOS handheld devices"
url="http://www.pilot-link.org/"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL-2.0-or-later' 'LGPL-2.0-or-later')
depends=('readline' 'libpng' 'libusb-compat' 'popt' 'bluez-libs')
makedepends=('git')
options=('!libtool')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/desrod/pilot-link.git"
        "pilot-link-png14.patch::https://aur.archlinux.org/cgit/aur.git/plain/pilot-link-png14.patch?h=${_pkgname}"
        "configure-checks.patch"
        "format-string-literals.patch"
        "extern-def-match-real-def.patch"
        "pass-as-size_t.patch"
        "fix-pr38.patch")
sha512sums=('SKIP'
            'cf37e4b51d261431f42054cf05d1603e66d8eca0604ae042371c7284c8e668f49cadb3d75cf67eaf56008809d3cc2766615105658293a90cada37bdf3f553f41'
            'e87ed44f5aa9131094d7a2be805eafaf4957bf245eb1dea758c8dde0ef3c42d1bab0dabbeedac63bd961e2e247ebc0229a5b28f2935c32a26c1cd793ce9f0cad'
            '2b5f81a2fc29a126533f48dbff297fd33fd32aaee1d34042b5b1ff7e910920a15e030e7f847935235cc8e7ee5a0aaac4b67855619ed13d75631c5ca73a3f9b19'
            '4326c58e9400a3eed86e15f1c4a0757b0b9b85c0e95f3447ae9fbdc0ed1b92a79ef1bd8c92481cd4762f1c4379ceb4811eb951b0193121017a366d8e3fce9a50'
            '3f7242527a0ffe71d0500b5b532ba3b356d2df76c08d8d3919037e8cdb09061dd54a08ed9d78bfc73686d2e33fb20a8841d49e8c234004c46435e0f9d5179548'
            'a949968daa7911baa04a05d8f5e2a0261c40b783eefce823dee9555dd21b25acb868642b14024ca59fe49af50c967163c456a7e2946270655765aa2cb7262103')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"

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

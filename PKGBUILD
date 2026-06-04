# Maintainer: doclic <doclic@tutanota.com>

pkgname=mesen-ce
pkgver=2.2.0
pkgrel=1
pkgdesc='Multi-system emulator (NES, SNES, GB, GBA, PCE, SMS/GG, WS)'
arch=('x86_64')
url='https://github.com/nesdev-org/MesenCE'
license=('GPL-3.0-or-later')
depends=(sdl2 libevdev)
makedepends=(dotnet-sdk-8.0)
# The classic Mesen is no longer maintained
replaces=(mesen)
# The package breaks when stripped for some reason ¯\_(ツ)_/¯
options=(lto !strip)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nesdev-org/MesenCE/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3308832fc62a51d91e878f568657135753b094fd27afb9193157ec642c5b45a9')

build() {
	cd "MesenCE-${pkgver}"
	make \
	    USE_GCC="$([ "${CC:-gcc}" = gcc ] && printf true || printf false)" \
	    LTO=true \
	    STATICLINK=false \
	    SYSTEM_LIBEVDEV=true
}

package() {
	cd "${srcdir}/MesenCE-${pkgver}/bin/linux-x64/Release/linux-x64/publish"
	install -Dm755 Mesen "${pkgdir}/usr/bin/Mesen"
	# the classic mesen package (which we're replacing) uses 'mesen' as the
	# name of its binary
	# the MesenCE .desktop file expects Mesen, so that's what we use, but we
	# make a symlink to keep compatibility with scripts or whatever expect
	# the name from the mesen package
	ln -s Mesen "${pkgdir}/usr/bin/mesen"

	cd "${srcdir}/MesenCE-${pkgver}/Linux/appimage"
	install -Dm644 Mesen.desktop "${pkgdir}/usr/share/applications/Mesen.desktop"
	install -Dm644 Mesen.48x48.png "${pkgdir}/usr/share/icons/Mesen.48x48.png"
}

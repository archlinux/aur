# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=midisnoop-git
pkgver=0.1.2.r6.gbc30f60
_pkgname=midisnoop
debianver="0.1.2+git20141108.bc30f600187e-1"
pkgrel=1
pkgdesc="MIDI monitor and prober"
arch=(i686 x86_64)
url="https://github.com/surfacepatterns/midisnoop"
license=(GPL)
depends=(rtmidi qt5-base)
makedepends=(git)
source=("git+https://github.com/surfacepatterns/midisnoop.git"
	"http://deb.debian.org/debian/pool/main/m/${_pkgname}/${_pkgname}_${debianver}.debian.tar.xz")
sha256sums=('SKIP'
            'c4e90944da794dc3ec4d8463df7f79aa7331de27ac5c652de5f0f1783dfa890f')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long | sed 's/version-//' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"

	# apply debian patches
	sed -i '/05-pass_flag.patch/d' ../debian/patches/series
	for patch in $(cat ../debian/patches/series) ; do
		patch -p1 < ../debian/patches/$patch
	done

	# fix binary path in desktop file
	sed -i 's#${binDir}/##' templates/midisnoop.desktop
}

build() {
	cd "${srcdir}/${_pkgname}"
	./configure --build=build --prefix=/usr
	make
}

package() {
	install -Dm755 "${srcdir}/${_pkgname}"/build/bin/midisnoop "${pkgdir}"/usr/bin/midisnoop
	install -Dm644 "${srcdir}/${_pkgname}"/templates/midisnoop.desktop "${pkgdir}"/usr/share/applications/midisnoop.desktop
	install -Dm644 "${srcdir}"/debian/midisnoop.xpm "${pkgdir}"/usr/share/pixmaps/midisnoop.xpm
}

# Maintainer: Uko Koknevics <perkontevs AT gmail DOT com>

# Could make a split package with base freebsd-buildutils, but there's a nasty
# cyclic dependency:
# freebsd-buildutils -> freebsd-glue -> freebsd-mk (src in freebsd-buildutils)
_pkgbase=freebsd-buildutils
pkgname=freebsd-mk
_pkgver=10.3~svn296373
_debrel=6
pkgver=10.3_svn296373_6
pkgrel=2
pkgdesc="FreeBSD makefile templates for bmake"
arch=("any")
url="https://packages.debian.org/stable/freebsd-mk"
license=("bsd")
depends=(bmake)
source=(
	"http://archive.debian.org/debian/pool/main/f/${_pkgbase}/${_pkgbase}_${_pkgver}.orig.tar.xz"
	"http://archive.debian.org/debian/pool/main/f/${_pkgbase}/${_pkgbase}_${_pkgver}-${_debrel}.debian.tar.xz"
)
sha256sums=(
	"1b16981e42765813be3811b1eda802dccb673de1c4542ed6476f467b0b21e804"
	"050399c35a6fb66dc92723e08161b3023f577189556168e5c3eb0eceed08afc4"
)

prepare() {
	cd "${srcdir}"
	mv "${_pkgbase}-${_pkgver}/src" src
	rmdir "${_pkgbase}-${_pkgver}"

	# The rest of the patches don't matter bcs we're installing only the
	# makefile includes
	patch -p1 < debian/patches/avoid_defsyspath_collision.diff
}

# No build step

package() {
	cd "${srcdir}"

	cat debian/freebsd-mk.dirs | sed "s|^|${pkgdir}/|" | xargs install -dm755

	install -Dm644 debian/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	for file in src/share/mk/*; do
		install -Dm644 $file "${pkgdir}/usr/share/mk-freebsd/"
	done

	# Debian package didn't include the following files, so if you don't want
	# them for whatever reason, uncomment the following lines:
	# rm "${pkgdir}/usr/share/mk-freebsd/Makefile"
	# rm "${pkgdir}/usr/share/mk-freebsd/local.sys.mk"
	# rm "${pkgdir}/usr/share/mk-freebsd/netbsd-tests.test.mk"
}

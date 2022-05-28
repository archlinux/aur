pkgbase="imd-git"
pkgname="imd-git"
pkgver=2.3
pkgrel=1
pkgdesc="Improved MarkDown Reader"

arch=("any")

makedepends=("git" "binutils" "make" "gcc" "gzip")
depends=("glibc")

license=("MIT")

url="https://github.com/Noah-Arcouette/imd.git"

provides=("imd")
conflicts=("imd")

giturl="https://raw.githubusercontent.com/Noah-Arcouette/imd/master/"

source=(
	"git+${url}"
)

sha256sums=(
	"SKIP"
)


pkgver () {
	cd "imd"
	printf "${pkgver}.r%s%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
	cd "imd"

	make -j 1 build
}

package() {
	cd "imd"

	# setup dirs
	mkdir -p "${pkgdir}/usr/bin/"
	mkdir -p "${pkgdir}/etc/imd/"
	mkdir -p "${pkgdir}/usr/share/man/man1/"

	# make binary root owned and executable
	chown root:root ${srcdir}/imd/bin/imd
	chmod a+x ${srcdir}/imd/bin/imd

	# copy docs
	cp "${srcdir}/imd/doc/man.md" "${pkgdir}/etc/imd/man.md"
	cp "${srcdir}/imd/imd.1.gz" "${pkgdir}/usr/share/man/man1/imd.1.gz"

	# copy binary
	mv "${srcdir}/imd/bin/imd" "${pkgdir}/usr/bin/imd"
}

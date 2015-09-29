# Maintainer: Bastian Löher <b.loeher@gsi.de>
pkgname=r3broot-git
pkgver=jul15
pkgrel=1
pkgdesc="Analysis framework based on root for the R3B experiment provided by GSI/FAIR."
arch=('x86_64')
url="http://www.r3broot.gsi.de"
license=('unknown')
groups=()
fairsoftver=jul15p1-1
fairrootver=v-15.07-2
makedepends=('cmake'
	'clang'
	'bison'
	'flex'
	'gcc-fortran'
	'subversion'
	'curl')
depends=(
	'fairsoft'
	'fairroot'
	)
provides=('r3broot')
replaces=()
backup=()
options=('!emptydirs' 'staticlibs' 'libtool' '!strip')
install=r3broot.install
changelog=
source=("${pkgname}::git+https://github.com/R3BRootGroup/R3BRoot"
	'r3broot.install'
	)
noextract=()
md5sums=('SKIP'
         '29d9cea27a2cf33f7dfd028447f300d1')

# Do not compress the package for installation
# PKGEXT='.pkg.tar'
# Compress using lightweight gzip
PKGEXT='.pkg.tar.gz'

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" \
	    "$(git rev-parse --short HEAD)"
}

prepare() {
	# Path to fairsoft installation
	export SIMPATH=/opt/fairsoft/$fairsoftver

	# Path to fairroot installation
	export FAIRROOTPATH=/opt/fairroot/$fairrootver

	# Execute cmake
	cd ${srcdir}
	[ -d build ] || mkdir build
	cd build
	cmake \
		-DUSE_DIFFERENT_COMPILER=TRUE \
		-DCMAKE_INSTALL_PREFIX="/opt/r3broot/git" \
		../${pkgname}
:
}

build() {
	# Path to fairsoft installation
	export SIMPATH=/opt/fairsoft/$fairsoftver
	cd ${srcdir}/build
	make -j$(nproc)
}

package() {
	installdir=${pkgdir}/opt/r3broot/git

	cd ${srcdir}/build
	make DESTDIR="${pkgdir}/" install
	cd ${srcdir}/${pkgname}
	# Install macros
	cp -r macros ${installdir}
	# Install geometry data
	cp -r geometry ${installdir}
	# Install field maps
	cp -r field ${installdir}
	# Install gconfig
	cp -r gconfig ${installdir}
	# Install input files
	cp -r input ${installdir}
	# Install config files
	cd ${srcdir}/build
	cp config* ${installdir}
	cp check_system* ${installdir}
	# Move left-overs as well
	mv ${pkgdir}/${srcdir}/build/lib/* ${installdir}/lib
	# Cleanup pkgdir
	cd ${pkgdir}
	echo "Cleaning out ${srcdir#/} from ${pkgdir}"
	rm -r ${srcdir#/}
}

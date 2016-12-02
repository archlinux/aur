# Maintainer: Dan McCurry <dan.mccurry at linux dot com>
pkgname=fullprof-suite
pkgver=2016.07
pkgrel=2
pkgdesc="Crystallographic tools for Rietveld, profile matching & integrated intensity refinements of X-Ray and/or neutron data."
arch=('i686' 'x86_64')
url="https://www.ill.eu/sites/fullprof"
license=('custom')
groups=('science')
depends=('gcc-libs'
	'openmotif')
optdepends=('xterm: Needed to launch some programs from GUI')
provides=('fullprof')
conflicts=('fullprof')
install=${pkgname}.install
source_i686=("https://www.ill.eu/sites/fullprof/downloads/FullProf_Suite_Oct2013_Lin.tgz")
source_x86_64=("https://www.ill.eu/sites/fullprof/downloads/FullProf_Suite_July2016_Linux64.tgz")
source=("fullprof-bin")
noextract=("${source_i686[@]##*/}"
	"${source_x86_64[@]##*/}")
md5sums=('0382c4e999d14ce61e9c1ca8571c86da')
md5sums_i686=('db32eb6d3e9e7ef67dacbf42bd3b65d3')
md5sums_x86_64=('d112d2c9ffac37b07a26fd4c3f300671')
PKGEXT=.pkg.tar

pkgver() {
	case $CARCH in
		i686)	echo 2013.10;
			;;
		x86_64)	echo 2016.07;
			;;
		*)	error "Unsupported architecture.";
			;;
	esac
}

prepare() {
	mkdir -p ${srcdir}/${pkgname}
	mkdir -p ${srcdir}/bin

	tar -xzvf ${srcdir}/FullProf_Suite_*.tgz -C ${srcdir}/${pkgname}/

	for i in $(find ${srcdir}/${pkgname}/. \
		-maxdepth 1 -executable -type f -printf "%P "); do
		sed -e "s/\(exec.*\)/\1$i \"\$\@\"/" \
			${srcdir}/fullprof-bin > ${srcdir}/bin/fullprof-$i
	done
}	
	

package() {
	mkdir -p ${pkgdir}/opt/${pkgname}
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}

	cp -R ${srcdir}/${pkgname}/. ${pkgdir}/opt/${pkgname}/
	ln -s /opt/${pkgname}/Docs/Readme_Fp_Suite.txt \
		${pkgdir}/usr/share/licenses/${pkgname}/README

	cd ${srcdir}/bin
	for i in *; do
		install -Dm755 $i ${pkgdir}/usr/bin/$i
	done
}

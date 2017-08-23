# Maintainer: Dan McCurry <dan.mc at protonmail dot com>
pkgname=fullprof-suite
pkgver=2017.07
pkgrel=1
pkgdesc="Crystallographic tools for Rietveld, profile matching & integrated intensity refinements of X-Ray and/or neutron data."
arch=('x86_64')
url="https://www.ill.eu/sites/fullprof"
license=('custom')
groups=('science')
depends=('gcc-libs' 'libpng12')
optdepends=('xterm: Needed to launch some programs from GUI')
provides=('fullprof')
conflicts=('fullprof')
install=${pkgname}.install

# You will need to download the .tgz file from the webpage directly:
# https://www.ill.eu/sites/fullprof/php/downloads.html

source=("file://FullProf_Suite_July2017_Linux64.tgz"
	"fullprof-bin")
noextract=("${source##*/}")
md5sums=('2042ff640d1c47958809ef3a19d6725c'
         'e91280ece6411983c74b3a8071402eb9')
PKGEXT=.pkg.tar

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

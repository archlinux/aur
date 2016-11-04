# SASfit: a program for fitting structural models to small angle scattering data

# Maintainer: András Wacha <awacha@gmail.com>
pkgname=sasfit
pkgver=0.94.7
pkgrel=2
pkgdesc="A program for fitting structural models to small angle scattering data"
arch=('x86_64' 'i686')
url="https://kur.web.psi.ch/sans1/SANSSoft/sasfit.html"
license=('GPL')
makedepends=('cmake>=2.8.0')
depends=('gsl' 'tcl>=8.4' 'libxrender' 'libxfixes' 'f2c' 'fftw' 'sundials')
# don't strip the executables, it breaks them.
options=("!strip")

source=("https://github.com/SASfit/SASfit/releases/download/v${pkgver}/SASfit-${pkgver}_source.tar.gz"
        "sasfit.patch")
md5sums=('d563765b90c2826cda5b912e10d699e9'
         '4ca03b222f17c7e1f07247d00d34da34')

prepare() {
	cd "${srcdir}/SASfit-${pkgver}"
	patch -p1 -i ../sasfit.patch
}

build() {
	cd "${srcdir}/SASfit-${pkgver}"
	cmake src
	make
}


package() {
	distdir="${srcdir}/${pkgname}_${pkgver}_linux_${CARCH}"
#	rm $distdir/lib -R
	mkdir -p "$pkgdir/usr/share/doc/sasfit"
#	mkdir -p "$pkgdir/usr/include/sasfit"
	mkdir -p "$pkgdir/usr/lib/sasfit/plugins"
	mkdir -p "$pkgdir/usr/bin"
	cp ${distdir}/*.so "$pkgdir/usr/lib/sasfit/plugins"
	cp ${distdir}/*.h "$pkgdir/usr/lib/sasfit/plugins"
	cp ${distdir}/sasfit "$pkgdir/usr/lib/sasfit"
	cp ${distdir}/{CHANGES.txt,KNOWN_BUGS.txt,Readme.txt,sasfit.bib,sasfit.pdf,test.dat,groups_example.def,config.ini} "$pkgdir/usr/share/doc/sasfit"
	cat >${pkgdir}/usr/bin/sasfit <<EOF
#!/bin/sh
cd /usr/lib/sasfit
./sasfit \$*
EOF
	chmod +x ${pkgdir}/usr/bin/sasfit
}

# SASfit: a program for fitting structural models to small angle scattering data

# Maintainer: András Wacha <awacha@gmail.com>
pkgname=sasfit
pkgver=0.94.7
pkgrel=3
pkgdesc="A program for fitting structural models to small angle scattering data"
arch=('x86_64' 'i686')
url="https://kur.web.psi.ch/sans1/SANSSoft/sasfit.html"
license=('GPL')
makedepends=('cmake>=2.8.0' 'imagemagick')
depends=('gsl' 'tcl>=8.4' 'libxrender' 'libxfixes' 'f2c' 'fftw' 'sundials')
# don't strip the executables, it breaks them.
options=("!strip")

source=("https://github.com/SASfit/SASfit/releases/download/v${pkgver}/SASfit-${pkgver}_source.tar.gz"
        "sasfit.patch"
	"sasfit.desktop")
md5sums=('d563765b90c2826cda5b912e10d699e9'
         'cd01d5f14b3028ce67c18e475e4d713d'
         '319e51dc73bf05f19895a3c94728aa84')

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
	for res in 128 16 192 20 22 24 256 32 36 384 40 48 64 72 96; do
		mkdir -p "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps"
		convert "${srcdir}/SASfit-${pkgver}/doc/images/sasfit_icon_base.png" -resize ${res}x${res} "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/sasfit.png"
	done
	mkdir -p "$pkgdir/usr/share/applications"
	cp ${distdir}/*.so "$pkgdir/usr/lib/sasfit/plugins"
	cp ${distdir}/*.h "$pkgdir/usr/lib/sasfit/plugins"
	cp ${distdir}/sasfit "$pkgdir/usr/lib/sasfit"
	cp ${distdir}/{CHANGES.txt,KNOWN_BUGS.txt,Readme.txt,sasfit.bib,sasfit.pdf,test.dat,groups_example.def,config.ini} "$pkgdir/usr/share/doc/sasfit"
	cp "${srcdir}/sasfit.desktop" "$pkgdir/usr/share/applications"
	cat >${pkgdir}/usr/bin/sasfit <<EOF
#!/bin/sh
cd /usr/lib/sasfit
./sasfit \$*
EOF
	chmod +x ${pkgdir}/usr/bin/sasfit
}

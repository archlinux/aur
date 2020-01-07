# SASfit: a program for fitting structural models to small angle scattering data

# Maintainer: András Wacha <awacha@gmail.com>
pkgname=sasfit
pkgver=0.94.11
pkgrel=1
pkgdesc="A program for fitting structural models to small angle scattering data"
arch=('x86_64')
url="https://kur.web.psi.ch/sans1/SANSSoft/sasfit.html"
license=('GPL')
makedepends=('imagemagick')
depends=('gsl' 'tcl>=8.4' 'libxrender' 'libxfixes' 'f2c' 'fftw' 'sundials')
# don't strip the executables, it breaks them.
options=("!strip")

source=("https://github.com/SASfit/SASfit/releases/download/${pkgver}/sasfit_${pkgver}_linux_x86_64.tar.gz"
	"sasfiticon.png")
sha256sums=('71d2a9ea54b1ba074f633113df50865ad038a630e6ecb613d58364b60e4adcdb'
            'd2e63bfb783c35c79d24050b7d1d0062a190824d00032862b70a4e903bc74f7c')

package() {
	distdir="${srcdir}/${pkgname}_${pkgver}_linux_${CARCH}"
	# install documentation
	mkdir -p "${pkgdir}/usr/share/doc/sasfit"
	cp ${distdir}/{CHANGES.txt,KNOWN_BUGS.txt,Readme.txt,doc/manual/sasfit.bib,doc/manual/sasfit.pdf,data/test.dat,plugins/groups_example.def,config.ini} "$pkgdir/usr/share/doc/sasfit"

	# install plugins
	mkdir -p "${pkgdir}/usr/lib/sasfit"
	cp -R ${distdir}/plugins "$pkgdir/usr/lib/sasfit/"

	# install data
	mkdir -p "${pkgdir}/usr/lib/sasfit"
	cp -R ${distdir}/data "${pkgdir}/usr/lib/sasfit/"

	# generate icons
	mkdir -p "$pkgdir/usr/bin"
	for res in 128 16 192 20 22 24 256 32 36 384 40 48 64 72 96; do
		mkdir -p "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps"
		convert "${srcdir}/sasfiticon.png" -resize ${res}x${res} "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/sasfit.png"
	done

	# install desktop entry
	mkdir -p "$pkgdir/usr/share/applications"
	cat >${pkgdir}/usr/share/applications/sasfit.desktop <<EOF
[Desktop Entry]
Version=${pkgver}
Name=SASFit
GenericName=Small-angle scattering data interpretation
Exec=/usr/lib/sasfit/sasfit
Icon=sasfit
Terminal=false
Type=Application
Categories=Science;Chemistry;Physics;Education;
StartupNotify=true
EOF

	# install the binary
	cp ${distdir}/sasfit "$pkgdir/usr/lib/sasfit/"

	# make a wrapper
	cat >${pkgdir}/usr/bin/sasfit <<EOF
#!/bin/sh
cd /usr/lib/sasfit
./sasfit \$*
EOF
	chmod +x ${pkgdir}/usr/bin/sasfit
}

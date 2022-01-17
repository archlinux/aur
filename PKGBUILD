#Maintainer: Bob <animalbob03 at gmail dot com>
pkgver=4.5
pkgname='diogenes'
pkgrel=1
license=('GPL3')
arch=('x86_64')
url="https://d.iogen.es/d/index.html"
pkgdesc="Application for searching and browsing legacy databases of texts in Latin and ancient Greek."
source=("${pkgname}::git+https://github.com/pjheslin/diogenes.git" "makefile.patch")
sha512sums=('SKIP' '463e4842c87a449622e42b81a25bd1345f368427c6f87fd08abb2939b973b18d236314e299a0791b12076a5abe6119fd22ae1e42173103dd944affcf517f70ca')
depends=('perl' 'libglvnd')
makedepends=('git' 'xz' 'unzip' 'librsvg' )
conflicts=('diogenes-bin')
prepare() {
	cd "${srcdir}/${pkgname}"
	patch makefile < "${srcdir}/makefile.patch" #This patch simply deletes unneeded libaries included with Electron.
	make -f mk.prebuilt-data #Downloads dictionaries + pre-computed morphology tables. This PKGBUILD does not compile these because the sources to build them from source are not (monetarily) free.
}

build() {
	cd "${srcdir}/${pkgname}"
	make clean
	make linux64
}
package() {
	cd "${pkgdir}"
	mkdir opt/
	cp -r "${srcdir}/${pkgname}/app/linux64" opt/diogenes/
	mkdir -p usr/share/icons usr/share/applications usr/local/bin
	cp "${srcdir}/${pkgname}/dist/icon.svg" usr/share/icons/diogenes.svg
	cp "${srcdir}/${pkgname}/dist/diogenes.desktop" usr/share/applications/
	chmod +x usr/share/applications/diogenes.desktop
	ln -s /opt/diogenes/diogenes usr/local/bin/diogenes
} 

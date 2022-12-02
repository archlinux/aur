# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Christian Wolf <aur@christianwolf.email>
pkgname=circuit_macros
pkgver=10.1
pkgrel=1
epoch=
pkgdesc="Tools for drawing electric circuits and other line diagrams"
arch=('any')
url="https://ece.uwaterloo.ca/~aplevich/Circuit_macros/"
license=('LPPL')
groups=()
depends=('m4' 'dpic-git')
makedepends=()
checkdepends=()
optdepends=('texlive-core: LaTeX system to draw the diagrams')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://ece.uwaterloo.ca/~aplevich/Circuit_macros/Circuit_macros$pkgver.tar.gz" 'circuit_macros.sh')
noextract=()
md5sums=('c476bdc9d11d3b04a23349ed9c39c7e8' '298fb2cffdc119b5c9b6a01175204f90')
validpgpkeys=()

prepare() {
    :
}

build() {
    cd "Circuit_macros$pkgver"
    rm -f examples/newp.txt
    make pgfdefault
}

package() {
	pushd "Circuit_macros$pkgver"
	
	LATEXDIR=`kpsewhich -var-value=TEXMFMAIN`/tex/latex/boxdims
	install -d $pkgdir$LATEXDIR
	install -m 644 boxdims.sty $pkgdir$LATEXDIR
	
	SHAREDIR=/usr/share/circuit_macros
	install -d $pkgdir$SHAREDIR
	install -m 755 *.m4 dpictools.pic $pkgdir$SHAREDIR
	
	DOCDIR=/usr/share/doc/circuit_macros
	install -d $pkgdir$DOCDIR
	install CHANGES Copying README $pkgdir$DOCDIR
	find doc/ examples/ -type d -exec install -d $pkgdir$DOCDIR/\{\} \;
	find doc/ examples/ -type f -exec install -m 644 \{\} $pkgdir$DOCDIR/\{\} \;
	
	popd
	
	install -d $pkgdir/etc/profile.d
	install -m 755 circuit_macros.sh $pkgdir/etc/profile.d
	#make DESTDIR="$pkgdir/" install
}

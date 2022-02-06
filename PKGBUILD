# Maintainer: endlesseden
year=2019
_pkgname=opentaxsolver-$year
pkgname=$_pkgname-svn
pkgver=2019.r0
pkgrel=1
pkgdesc="An easy-to-use text-based calculator for US Tax Forms"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="http://opentaxsolver.sourceforge.net/"
license=('GPL2')
groups=(OTS)
depends=('gtk4')
makedepends=('subversion')
checkdepends=()
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::svn://svn.code.sf.net/p/opentaxsolver/SrcCodeRepo/trunk/OTS_$year")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  local ver="$(svnversion)"
  printf "$year.r%s" "${ver//[[:alpha:]]}"
}

prepare() {
    cd "$srcdir/$_pkgname"
    if [ ! -e "ots-$year" ];then 
        printf "#!/bin/bash \ncd /var/lib/${_pkgname} \n./ots-$year-gui" > ots-$year
        chmod +x ots-$year
    fi
}


build() {
	cd "$srcdir/$_pkgname"/src
    make
    cd "$srcdir/$_pkgname"/
    mv Run_taxsolve_GUI bin/ots-$year-gui
}

package() {
	cd "$srcdir/$_pkgname"
	
	install -Dm755 ots-$year -t "${pkgdir}/usr/bin/"
	install -Dm644 bin/* -t "${pkgdir}/var/lib/${_pkgname}"
	cp -r "tax_form_files" "${pkgdir}/var/lib/${_pkgname}/" 
}

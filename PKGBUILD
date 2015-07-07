# Maintainer: Gadget3000 <gadget3000 at msn dot com>
# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>

pkgname=deal
pkgver=3.1.9
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Bridge hand (deals) generator"
url="http://bridge.thomasoandrews.com/deal/"
source=(http://bridge.thomasoandrews.com/deal/deal${pkgver//./}.zip)
md5sums=('7ddeb149478fa32aa9f0432092cfd179')
license=('GPL')
depends=('tcl>=8.5' 'gcc-libs')
options=(docs)

build() {
    cd $srcdir/deal${pkgver//./}			|| return 1
    
    #Patch Makefile:
    sed -i \
	-e 'sX/usr/localX/usrXg' \
	-e 's/-fast//g' \
	-e 's/-ltcl/-ltcl8.5/g' \
	{Makefile,Make.mac-osx}
    #Patch c file to include deal.tcl from proper directory:
    sed -i -e 's|source deal.tcl|source /usr/share/deal/deal.tcl|g' \
	 tcl_deal.c					|| return 1
	 
    for i in ex format input lib
    do
	cd $i
	sed -i -e 's|source format|source /usr/share/deal/format|g' *	|| return 1
	sed -i -e 's|source input|source /usr/share/deal/input|g' *	|| return 1		
	sed -i -e 's|source "input|source "/usr/share/deal/input|g' *	|| return 1
	sed -i -e 's|source ex|source /usr/share/deal/ex|g' *		|| return 1
	sed -i -e 's|source lib|source /usr/share/deal/lib|g' *	|| return 1
	cd ..
    done
    sed -i -e 's|source lib|source /usr/share/deal/lib|g' *.tcl	|| return 1
    
    echo > ${srcdir}/deal${pkgver//./}/Make.dep
    make						|| return 1
    local destdir=$pkgdir/usr/share/deal
    install -d $destdir					|| return 1
    cp -R format $destdir/				|| return 1
    cp -R input $destdir/				|| return 1
    cp -R lib $destdir/					|| return 1
    cp -R ex $destdir/					|| return 1    
    cp deal.tcl $destdir/				|| return 1
    install -D -m755 deal $pkgdir/usr/bin/deal		|| return 1
    
    local docdst=$pkgdir/usr/share/doc/deal
    install -d $docdst					|| return 1
    cp -R html/* $docdst/				|| return 1

    mv ${pkgdir}/usr/bin/deal ${pkgdir}/usr/bin/deal-bin
    echo \#\!/bin/bash > ${pkgdir}/usr/bin/deal
    echo cd /usr/share/deal >> ${pkgdir}/usr/bin/deal
    echo deal-bin >> ${pkgdir}/usr/bin/deal
    chmod +x ${pkgdir}/usr/bin/deal
}

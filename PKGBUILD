# Maintainer: ugjka <esesmu@protonmail.com>

pkgname=calendar
pkgver=6.3_20180603
pkgverbase=6.3
pkgrel=2
pkgdesc="Reminder utility (OpenBSD)"
url="http://www.openbsd.org/cgi-bin/cvsweb/src/usr.bin/calendar"
arch=('x86_64')
license=('BSD')
makedepends=("cvs" "openssh")
source=("calendar-1.35-linux.patch"
        "Makefile.linux"
        "LICENSE")
sha256sums=('792b22f398ccf78364c1eb45cb0353599e126b6028b9afa7117e8114444b6f69'
            'e29cd94c128ecf76cb5224bd5dea4a2b199773f27226484b17804b83f6e8462a'
            '95112fa05d9b7204808ede37b1c77469826c8c3875e4b1523307b5050d966564')
TAG="OPENBSD_${pkgverbase/./_}"

pkgver(){
    cd "${SRCDEST}"/${pkgname}
    date=$(cvs -q log -l | awk '/date:/ { gsub("/",""); if ($2 > n) n = $2;} END { print n; }')
    echo "${pkgverbase}_${date}"
}

prepare() {
    cd "${SRCDEST}"
    
    CVS_RSH=ssh ; export CVS_RSH
    cvs -d anoncvs@anoncvs1.ca.openbsd.org:/cvs co \
    -d ${pkgname} -r ${TAG} src/usr.bin/${pkgname}
    
    cp -a ${pkgname} "${srcdir}" 
    
    cd "${srcdir}"/${pkgname}
    
    patch -p1 < ../calendar-1.35-linux.patch
    sed -i 's|/usr/libexec/tradcpp|/usr/bin/cpp|' pathnames.h
    cp ../Makefile.linux Makefile
}

build() {
    cd ${pkgname}
    make
}

package() {
    cd ${pkgname}
    make DESTDIR="${pkgdir}" install
    install -Dm644 ../LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

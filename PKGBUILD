# Maintainer: ugjka <esesmu@protonmail.com>

pkgname=calendar
pkgver=6.4_20180603
_pkgverbase=6.4
pkgrel=2
pkgdesc="Reminder utility (OpenBSD)"
url="http://www.openbsd.org/cgi-bin/cvsweb/src/usr.bin/calendar"
arch=('x86_64')
license=('BSD')
makedepends=("cvs" "openssh")
conflicts=("bsdmainutils")
source=("git+https://github.com/ugjka/calendar.latvia.git"
        "http://ftp.debian.org/debian/pool/main/b/bsdmainutils/bsdmainutils_9.0.14.tar.gz"
        "calendar-linux.patch"
        "Makefile.linux"
        "LICENSE")
sha256sums=('SKIP'
            '1ea1e8f11ddb9cc7c7b72d52d74ecc8e5ecdf0b05335a7e77e1c1ac98c822305'
            '792b22f398ccf78364c1eb45cb0353599e126b6028b9afa7117e8114444b6f69'
            'e29cd94c128ecf76cb5224bd5dea4a2b199773f27226484b17804b83f6e8462a'
            '95112fa05d9b7204808ede37b1c77469826c8c3875e4b1523307b5050d966564')
TAG="OPENBSD_${_pkgverbase/./_}"

pkgver(){
    cd "${SRCDEST}"/${pkgname}-${_pkgverbase}
    date=$(cvs -q log -l | awk '/date:/ { gsub("/",""); if ($2 > n) n = $2;} END { print n; }')
    echo "${_pkgverbase}_${date}"
}

prepare() {
    cd "${SRCDEST}"
    
    CVS_RSH=ssh ; export CVS_RSH
    cvs -d anoncvs@obsdacvs.cs.toronto.edu:/cvs co \
    -d ${pkgname}-${_pkgverbase} -r ${TAG} src/usr.bin/${pkgname}
    
    cp -a ${pkgname}-${_pkgverbase} "${srcdir}" 
    
    cd "${srcdir}"/${pkgname}-${_pkgverbase}
    
    patch -p1 < ../calendar-linux.patch
    sed -i 's|/usr/libexec/tradcpp|/usr/bin/cpp|' pathnames.h
    cp ../Makefile.linux Makefile
    
    # import latvian calendar from ugjka's repo
    cp ../calendar.latvia/calendar.latvia calendars/
    
    # import some calendars from debian
    cp ../bsdmainutils/usr.bin/calendar/calendars/calendar.australia calendars/
    cp ../bsdmainutils/usr.bin/calendar/calendars/calendar.freebsd calendars/
    cp ../bsdmainutils/usr.bin/calendar/calendars/calendar.southafrica calendars/
    cp ../bsdmainutils/usr.bin/calendar/calendars/calendar.lotr calendars/
    cp ../bsdmainutils/usr.bin/calendar/calendars/calendar.dutch calendars/
    cp ../bsdmainutils/debian/calendars/calendar.argentina calendars/
    cp ../bsdmainutils/debian/calendars/calendar.belgium calendars/
    cp ../bsdmainutils/debian/calendars/calendar.debian calendars/
    cp ../bsdmainutils/debian/calendars/calendar.eu calendars/
    cp ../bsdmainutils/debian/calendars/calendar.kazakhstan calendars/
    cp ../bsdmainutils/debian/calendars/calendar.thai calendars/
    cp ../bsdmainutils/debian/calendars/calendar.ubuntu calendars/
}

build() {
    cd ${pkgname}-${_pkgverbase}
    make
}

package() {
    cd ${pkgname}-${_pkgverbase}
    make DESTDIR="${pkgdir}" install
    install -Dm644 ../LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

# Maintainer: John Lane <archlinux at jelmail dot com>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=netkit-bsd-finger
pkgver=0.17
pkgrel=9
pkgdesc="BSD-finger ported to Linux"
arch=('i686' 'x86_64')
url='http://ftp.linux.org.uk/pub/linux/Networking/netkit'
license=('BSD')
depends=('glibc')

source=("http://ftp.linux.org.uk/pub/linux/Networking/netkit/bsd-finger-${pkgver}.tar.gz"
        'LICENSE'
        'fix-manpage-typo.patch'
        'finger.socket'
        'finger@.service')

sha256sums=('84885d668d117ef50e01c7034a45d8343d747cec6212e40e8d08151bc18e13fa'
            '3774a4bb6207edc124838915911bd139a78312336876a9fe59700216dfeb54b4'
            '7e264f316fa465ec1b6aa2074d552ba8fe5534e44cabe9859301feb2fd45315b'
            '6cde9cd7ec8dda157d6dcb28988d1caf2280e7e089573b1ad1824e263b8a9fb7'
            '89276c8300c7a30c7103b44bd0e80162aa86069a80d209ff95da706546a55516')


prepare() {
   cd bsd-finger-${pkgver}
   # FS#28232
   patch -p1 -i "${srcdir}"/fix-manpage-typo.patch
   sed -i 's@include <sys/time.h>@include <time.h>@' finger/lprint.c
   sed -i 's@include <sys/time.h>@include <time.h>@' finger/sprint.c
}

build() {
   cd bsd-finger-${pkgver}
   ./configure --prefix=/usr
   make
}

package() {
   cd bsd-finger-${pkgver}
   install -d "${pkgdir}"/usr/{bin,share/man/{man1,man8}}
   make INSTALLROOT="${pkgdir}" SBINDIR=/usr/bin MANDIR=/usr/share/man install

   install -D -m644 "${srcdir}/finger.socket" "${pkgdir}//usr/lib/systemd/system/finger.socket"
   install -D -m644 "${srcdir}/finger@.service" "${pkgdir}//usr/lib/systemd/system/finger@.service"

   install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

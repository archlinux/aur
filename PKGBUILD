# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Oleg Smirnov <oleg.smirnov@gmail.com>

pkgname=pam_pkcs11
pkgver=0.6.10
pkgrel=1
pkgdesc='PAM module allows a X.509 certificate based user login'
arch=('i686' 'x86_64')
url='https://opensc.github.io/pam_pkcs11/'
license=('LGPL')
depends=('pcsclite')
backup=('etc/pam_pkcs11/pam_pkcs11.conf' 'etc/pam_pkcs11/subject_mapping' 'etc/pam_pkcs11/card_eventmgr.conf')
source=("https://github.com/OpenSC/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz"
        'openssl-1.1.0.patch')
md5sums=('8ededc8acdcc6084ad52ee03bdf9e4d3'
         '36b2c236de3946fc334a8603d6db56b3')

prepare() {
    cd ${pkgname}-${pkgname}-${pkgver}
    patch -p1 -i "${srcdir}"/openssl-1.1.0.patch
}

build() {
    cd ${pkgname}-${pkgname}-${pkgver}
    ./bootstrap
    ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-ldap=no \
    --without-docbook \
    --disable-static
#    --disable-debug # build is broken
  make
}

package() {
    cd ${pkgname}-${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install

    install -d "${pkgdir}"/etc/pam_pkcs11/{cacerts,crls}
}

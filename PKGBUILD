# Maintainer: Marcel Rupp <comfix@comfix.cc>
pkgname=openldap-mod-smbkrb5pwd
pkgver=2.4.56
pkgrel=1
pkgdesc='OpenLDAP slap.d smbkrb5pwd module'
arch=('x86_64')
url='https://github.com/opinsys/smbkrb5pwd'
license=('OpenLDAP Public License')
depends=('openldap' 'krb5')
source=("https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-${pkgver}.tgz"
        "git+https://github.com/opinsys/smbkrb5pwd.git")
sha256sums=('25520e0363c93f3bcb89802a4aa3db33046206039436e0c7c9262db5a61115e0'
            "SKIP")

build() {
    cd "${srcdir}/openldap-${pkgver}"
    ./configure --prefix=/usr --libexecdir=/usr/lib
    make

    cp -r "${srcdir}/smbkrb5pwd" "${srcdir}/openldap-${pkgver}/contrib/slapd-modules/"

    cd "${srcdir}/openldap-${pkgver}/contrib/slapd-modules/smbkrb5pwd"
    patch -Np1 < ${srcdir}/../0001-smbkrb5pwd-makefile.patch
    make
}

package() {
  cd "${srcdir}/openldap-${pkgver}/contrib/slapd-modules/smbkrb5pwd"
  DESTDIR=${pkgdir} make install
}


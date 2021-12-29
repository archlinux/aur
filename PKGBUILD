# Maintainer: Marcel Rupp <comfix@comfix.cc>
# Maintainer: Nadja Reitzenstein <me@dequbed.space>
pkgname=openldap-mod-smbkrb5pwd
pkgver=2.6.0
pkgrel=1
pkgdesc='OpenLDAP slap.d smbkrb5pwd module'
arch=('x86_64')
url='https://github.com/opinsys/smbkrb5pwd'
license=('OpenLDAP Public License')
depends=('openldap' 'krb5')
source=("https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-${pkgver}.tgz"
        "git+https://github.com/opinsys/smbkrb5pwd.git")
sha256sums=("b71c580eac573e9aba15d95f33dd4dd08f2ed4f0d7fc09e08ad4be7ed1e41a4f"
            "SKIP")

build() {
    cd "${srcdir}/openldap-${pkgver}"
    ./configure --prefix=/usr --libexecdir=/usr/lib
    make

    cp -r "${srcdir}/smbkrb5pwd" "${srcdir}/openldap-${pkgver}/contrib/slapd-modules/"

    cd "${srcdir}/openldap-${pkgver}/contrib/slapd-modules/smbkrb5pwd"
    patch -Np1 < ${srcdir}/../0001-smbkrb5pwd-makefile.patch
    patch -Np1 < ${srcdir}/../0002-fixes-for-2.6.patch
    make
}

package() {
  cd "${srcdir}/openldap-${pkgver}/contrib/slapd-modules/smbkrb5pwd"
  DESTDIR=${pkgdir} make install
}


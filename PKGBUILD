# Maintainer: Denis Proskurin <dpvpro // gmail // com>

pkgname=incron-next
pkgver=0.5.17
pkgrel=1
pkgdesc="Maintainable fork for incron package. MRs are welcome"
arch=('x86_64')
url="https://github.com/dpvpro/incron-next"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
conflicts=('incron')
makedepends=('git')
options=('emptydirs')
source=("git+https://github.com/dpvpro/incron-next"
        "incron.sysusers"
        "incron.tmpfiles"
        "incrond.service")
sha256sums=('SKIP'
            'e5da0a3af368c286fa2b180015c9efc5aef5018c271a16620b8c30bfe6f9ccc2'
            '422c4a715da4037550d2f97de28f47f91d0b58983c188c6cf1d1233370e048a4'
            '3da9f54cf3b86a8195bd76c7e35ebd197f0b4935215b71f49fa9d05114204ed9')

prepare() {
  cd "${srcdir}"/$pkgname
  sed -i 's|$(DESTDIR)$(PREFIX)/sbin/|$(DESTDIR)$(PREFIX)/bin/|g' Makefile
}

build() {
  cd "${srcdir}"/$pkgname
  make CXXFLAGS+=" --std=c++14"
}

package() {
  cd "${srcdir}"/$pkgname

  install -d "${pkgdir}"/usr/share/man "${pkgdir}"/usr/{s,}bin

  make PREFIX="${pkgdir}"/usr \
    MANPATH="${pkgdir}"/usr/share/man \
    USERDATADIR="${pkgdir}"/var/spool/incron \
    INITDIR="${pkgdir}"/etc \
    CFGDIR="${pkgdir}"/etc \
    SYSDATADIR="${pkgdir}"/etc/incron.d install

  install -Dm0644 "${srcdir}/incrond.service" "${pkgdir}/usr/lib/systemd/system/incrond.service"
  install -Dm0644 "${srcdir}/incron.sysusers" "${pkgdir}/usr/lib/sysusers.d/incrond.conf"
  install -Dm0644 "${srcdir}/incron.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/incrond.conf"
  rm -r "$pkgdir"/{usr/sbin,var}
}

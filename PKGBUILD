# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: scj <scj(at)archlinux(dot)us>

pkgname=incron
pkgver=0.5.12
pkgrel=4
_commit=f45c2f5ac4baea99b48e99a713d1f4ec1854aa76
pkgdesc="Like the regular cron but is driven by filesystem events instead of time periods"
arch=('x86_64')
url="https://github.com/ar-/incron"
license=('GPL')
depends=('gcc-libs' 'bash')
makedepends=('git')
options=('emptydirs')
#source=("$pkgname-$pkgver.tar.gz::https://github.com/ar-/incron/archive/$pkgver.tar.gz"
source=("git+https://github.com/ar-/incron.git#commit=${_commit}"
        "incron.sysusers"
        "incron.tmpfiles"
        "incrond.service")
sha256sums=('SKIP'
            'e5da0a3af368c286fa2b180015c9efc5aef5018c271a16620b8c30bfe6f9ccc2'
            '422c4a715da4037550d2f97de28f47f91d0b58983c188c6cf1d1233370e048a4'
            '5ff72411c704dd38823892d7fd13992509c3d906bfe0b4a5cafbe382e4e01c24')

prepare() {
  cd "${srcdir}"/$pkgname
  sed -i 's|$(DESTDIR)$(PREFIX)/sbin/|$(DESTDIR)$(PREFIX)/bin/|g' Makefile
}

build() {
  cd "${srcdir}"/$pkgname
  make
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

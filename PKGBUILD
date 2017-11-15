# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: scj <scj(at)archlinux(dot)us>

pkgname=incron
pkgver=0.5.12
pkgrel=2
_commit=f45c2f5ac4baea99b48e99a713d1f4ec1854aa76
pkgdesc="Like the regular cron but is driven by filesystem events instead of time periods"
arch=('x86_64')
url="https://github.com/ar-/incron"
license=('GPL')
depends=('gcc-libs' 'bash')
makedepends=('git')
install=incron.install
options=('emptydirs')
#source=("$pkgname-$pkgver.tar.gz::https://github.com/ar-/incron/archive/$pkgver.tar.gz"
source=("git://github.com/ar-/incron.git#commit=${_commit}"
	'incrond.service')
sha256sums=('SKIP'
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
  rmdir "$pkgdir"/usr/sbin
}

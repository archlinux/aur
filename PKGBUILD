# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: scj <scj(at)archlinux(dot)us>

pkgname=incron
pkgver=0.5.12
pkgrel=1
pkgdesc="Like the regular cron but is driven by filesystem events instead of time periods"
arch=('i686' 'x86_64')
url="https://github.com/ar-/incron"
license=('GPL')
depends=('gcc-libs' 'bash')
install=incron.install
options=('emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ar-/incron/archive/$pkgver.tar.gz"
	'incrond.service')
md5sums=('f7456b73875f44f36eaa818e3f105f76'
         '4be206ba6ecacd9d2006cdc72b4604db')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver
  sed -i 's|$(DESTDIR)$(PREFIX)/sbin/|$(DESTDIR)$(PREFIX)/bin/|g' Makefile
}

build() {
  cd "${srcdir}"/$pkgname-$pkgver
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

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

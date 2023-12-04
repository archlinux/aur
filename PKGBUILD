# Maintainer: Alex Stelmachonak <mail@ava1ar.me>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: Manolis Tzanidakis
# Contributor: Leonid Isaev

pkgname=autofs
pkgver=5.1.9
pkgrel=1
pkgdesc='A kernel-based automounter for Linux'
arch=('x86_64')
url='https://www.kernel.org/pub/linux/daemons/autofs/'
license=('GPL2')
depends=('libxml2')
makedepends=('libldap' 'krb5' 'kmod' 'sssd' 'libnsl' 'rpcsvc-proto' 'systemd')
optdepends=('krb5: for LDAP support'
            'sssd: for SSSD integration')
backup=('etc/autofs/auto.master'
        'etc/autofs/auto.misc'
        'etc/autofs/auto.net'
        'etc/autofs/auto.smb'
        'etc/autofs/autofs.conf'
        'etc/autofs/autofs_ldap_auth.conf'
        'etc/default/autofs')
source=("https://www.kernel.org/pub/linux/daemons/${pkgname}/v5/${pkgname}-${pkgver}.tar.xz")
sha256sums=('87e6af6a03794b9462ea519781e50e7d23b5f7c92cd59e1142c85d2493b3c24b')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i -e 's|/etc/auto.misc|/etc/autofs/auto.misc|' \
         -e 's|/etc/auto.master.d|/etc/autofs/auto.master.d|' samples/auto.master

  sed -i -e "/^#include <linux\/fs.h>$/d" modules/parse_amd.c
  sed -i -e "/^#include <linux\/fs.h>$/d" modules/parse_sun.c
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
	--sysconfdir=/etc/autofs \
	--sbindir=/usr/bin \
	--with-mapdir=/etc/autofs \
	--with-confdir=/etc/default \
	--without-hesiod \
	--enable-ignore-busy \
	--with-libtirpc \
	--with-systemd
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make INSTALLROOT="${pkgdir}" install install_samples

  install -dm755 "$pkgdir/etc/autofs/auto.master.d"
}

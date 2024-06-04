# Maintainer: Alexander Jacocks <alexander@redhat.com>
# Contributor: Alex Stelmachonak <mail@ava1ar.me>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: Manolis Tzanidakis
# Contributor: Leonid Isaev

pkgname=autofs
pkgver=5.1.9
pkgrel=2
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
source=("https://www.kernel.org/pub/linux/daemons/${pkgname}/v5/${pkgname}-${pkgver}.tar.xz"
	'https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-Fix-incompatible-function-pointer-types-in-cyrus-sasl-module.patch'
	'https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-always-recreate-credential-cache.patch'
	'https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-changelog.patch'
	'https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-crash-in-make_options_string.patch'
	'https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-crash-in-make_options_string.patch'
	'https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-ldap_parse_page_control-check.patch'
	'https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-update-configure.patch'
	'https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/patch_order_5.1.9')
sha256sums=('87e6af6a03794b9462ea519781e50e7d23b5f7c92cd59e1142c85d2493b3c24b'
            '0cf9d836765d3df70994c281278b2f068f15914b03a36c7b897f8fbcd82bd27e'
            '6a9a86ad1903843276e8bb6ae0cbe5c20ed25ef7c3147f980501c24b5ffbba01'
            'ea63ce377522ee5e1a9792c6deb6deb3f9cba50b6906a3f7517f12570d89125c'
            'd437ba38d958a6bc383cf2ed4f397f8f6fcdb22f661bc0e42f140aae26ea2c0c'
            'd437ba38d958a6bc383cf2ed4f397f8f6fcdb22f661bc0e42f140aae26ea2c0c'
            '89e8e0b398afa9df49e7d2f7d38464063eae9b87c4bf13a01dee07c3b251e9cf'
            'b42ca5d2fa681062c69e90e48860e1077fe9b9d82dc1c84ece0e0a0803419326'
            'd01c9e90ba750c1a5de71ffcac9a778810a335925a4d2579d3231414de4f43f1')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  for line in $( cat ../patch_order_5.1.9 ); do
	  patch --forward --strip=1 --input=../${line}
  done

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

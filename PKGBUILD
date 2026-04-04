# Maintainer: Alexander Jacocks <alexander@redhat.com>
# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Alex Stelmachonak <mail@ava1ar.me>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: Manolis Tzanidakis
# Contributor: Leonid Isaev

pkgname=autofs
pkgver=5.1.9
pkgrel=7
pkgdesc='A kernel-based automounter for Linux'
arch=('x86_64')
url='https://www.kernel.org/pub/linux/daemons/autofs/'
license=('GPL-2.0-or-later')
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
_mirror='https://mirrors.edge.kernel.org'
_mirrorpath="${_mirror}/pub/linux/daemons/${pkgname}/v5"
source=(${_mirrorpath}/${pkgname}-${pkgver}.tar.{xz,sign}
        ${_mirrorpath}/patches-5.2.0/autofs-5.1.9-Fix-incompatible-function-pointer-types-in-cyrus-sasl-module.patch{,.sign}
        autofs-arch-configuration-path.patch)
sha256sums=('87e6af6a03794b9462ea519781e50e7d23b5f7c92cd59e1142c85d2493b3c24b'
            'SKIP'
            '0cf9d836765d3df70994c281278b2f068f15914b03a36c7b897f8fbcd82bd27e'
            'SKIP'
            'def52bda93a414896c41e587c2ffbefdd360767f938399767b7582d55c329a34')
# gpg key for Ian Kent <raven@themaw.net>, the maintainer of autofs
validpgpkeys=('CD0A6E3CBB6768800B0736A8E7677380F54FD8A9')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch --forward --strip=1 --input=../autofs-5.1.9-Fix-incompatible-function-pointer-types-in-cyrus-sasl-module.patch
  patch --forward --strip=1 --input=../autofs-arch-configuration-path.patch
}

build() {
  cd "${pkgname}-${pkgver}"

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
  cd "${pkgname}-${pkgver}"

  make INSTALLROOT="${pkgdir}" install install_samples

  install -dm755 "${pkgdir}/etc/autofs/auto.master.d"
}

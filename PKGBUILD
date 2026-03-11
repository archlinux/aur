# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Alexander Jacocks <alexander@redhat.com>
# Contributor: Alex Stelmachonak <mail@ava1ar.me>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: Manolis Tzanidakis
# Contributor: Leonid Isaev

_pkgname=autofs
pkgname=autofs-git
pkgver=5.1.9.84.g326ba347
pkgrel=1
pkgdesc='A kernel-based automounter for Linux'
arch=('x86_64')
url='https://www.kernel.org/pub/linux/daemons/autofs/'
license=('GPL2')
depends=('libxml2')
makedepends=('git' 'libldap' 'krb5' 'kmod' 'sssd' 'libnsl' 'rpcsvc-proto' 'systemd')
optdepends=('krb5: for LDAP support'
            'sssd: for SSSD integration')
provides=('autofs')
conflicts=('autofs')
backup=('etc/autofs/auto.master'
        'etc/autofs/auto.misc'
        'etc/autofs/auto.net'
        'etc/autofs/auto.smb'
        'etc/autofs/autofs.conf'
        'etc/autofs/autofs_ldap_auth.conf'
        'etc/default/autofs')
source=(git+https://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname

  git describe --tags --long | sed 's/^release_//;s/[-_]/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  sed -i -e 's|/etc/auto.misc|/etc/autofs/auto.misc|' \
         -e 's|/etc/auto.master.d|/etc/autofs/auto.master.d|' samples/auto.master
}

build() {
  cd "${srcdir}/${_pkgname}"

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
  cd "${srcdir}/${_pkgname}"

  make INSTALLROOT="${pkgdir}" install install_samples

  install -dm755 "$pkgdir/etc/autofs/auto.master.d"
}

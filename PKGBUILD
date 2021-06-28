# Maintainer: Huang-Huang Bao <eh5@sokka.cn>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: Manolis Tzanidakis
# Contributor: Leonid Isaev

_pkgbase=autofs
pkgname=${_pkgbase}-no-locking
pkgver=5.1.7
pkgrel=1
pkgdesc='A kernel-based automounter for Linux (disable mount locking, allows recursive auto-mounting)'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://www.kernel.org/pub/linux/daemons/autofs/'
license=('GPL2')
depends=('libxml2')
provides=('autofs')
conflicts=('autofs')
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
source=("https://www.kernel.org/pub/linux/daemons/${_pkgbase}/v5/${_pkgbase}-${pkgver}.tar."{xz,sign})
sha256sums=('a36b268611b79b07051749870ba540b139938efc84bc0293244c483e94f9ced7'
            'SKIP')
validpgpkeys=('CD0A6E3CBB6768800B0736A8E7677380F54FD8A9') # Ian Kent

prepare() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  sed -i -e 's|/etc/auto.misc|/etc/autofs/auto.misc|' \
         -e 's|/etc/auto.master.d|/etc/autofs/auto.master.d|' samples/auto.master
}

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  ./configure --prefix=/usr \
	--sysconfdir=/etc/autofs \
	--sbindir=/usr/bin \
	--with-mapdir=/etc/autofs \
	--with-confdir=/etc/default \
	--without-hesiod \
	--enable-ignore-busy \
	--with-libtirpc \
	--with-systemd \
	--disable-mount-locking
  make
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  make INSTALLROOT="${pkgdir}" install install_samples

  install -dm755 "$pkgdir/etc/autofs/auto.master.d"
}

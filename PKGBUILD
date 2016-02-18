pkgname=autofs-nfsfix
_pkgname=autofs
pkgver=5.1.1
pkgrel=3
pkgdesc='A kernel-based automounter for Linux. This version has a patch that fixes the bug that stops shutdowns/reboots when autofs is used to mount NFS shares. Bug report: https://bugs.archlinux.org/task/40200'
arch=('i686' 'x86_64')
url='http://freshmeat.net/projects/autofs'
license=('GPL2')
provides=('autofs')
conflicts=('autofs')
depends=('libxml2')
makedepends=('libldap' 'krb5' 'kmod' 'sssd')
optdepends=('krb5: for LDAP support'
            'sssd: for SSSD integration')
backup=('etc/autofs/auto.master'
        'etc/autofs/auto.misc'
        'etc/autofs/auto.net'
        'etc/autofs/auto.smb'
        'etc/autofs/autofs_ldap_auth.conf'
        'etc/default/autofs')
options=(!makeflags)
source=("http://www.kernel.org/pub/linux/daemons/${_pkgname}/v5/${_pkgname}-${pkgver}.tar.xz"
        "autofs.service.patch")
sha256sums=('e08ff0ef9ff365d87b6c33dca136d20e4e07675197a324f2816894cb437021c3'
            '3fa45bd073022bca24b830c4961e1a1cc5061ee7edac453ee1e051a710348c88')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  sed -i -e 's|/etc/auto.misc|/etc/autofs/auto.misc|' \
         -e 's|/etc/auto.master.d|/etc/autofs/auto.master.d|' samples/auto.master
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure --prefix=/usr --sysconfdir=/etc/autofs --sbindir=/usr/bin \
    --with-mapdir=/etc/autofs --without-hesiod \
    --enable-ignore-busy --with-systemd
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make INSTALLROOT="${pkgdir}" install
  rm -r "$pkgdir/run"
  install -dm755 "$pkgdir/etc/autofs/auto.master.d"
  patch "$pkgdir/usr/lib/systemd/system/autofs.service" "${srcdir}/autofs.service.patch"
}

# vim:set ts=2 sw=2 et:

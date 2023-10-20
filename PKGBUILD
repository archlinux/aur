# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=krb5-git
pkgver=1.21.2.r19.g6c5471176
pkgrel=1
pkgdesc="The Kerberos network authentication system"
arch=('i686' 'x86_64')
url="https://web.mit.edu/kerberos/"
license=('custom')
depends=('glibc' 'e2fsprogs' 'keyutils' 'libcom_err.so' 'libkeyutils.so' 'libldap' 'libss.so'
         'libverto-module-base' 'libverto.so' 'openssl')
makedepends=('git' 'perl')
provides=("krb5=$pkgver" 'libgssapi_krb5.so' 'libgssrpc.so' 'libk5crypto.so' 'libkadm5clnt_mit.so'
          'libkadm5srv_mit.so' 'libkdb5.so' 'libkdb_ldap.so' 'libkrad.so' 'libkrb5.so' 'libkrb5support.so')
conflicts=('krb5')
backup=('etc/krb5.conf' 'var/lib/krb5kdc/kdc.conf')
options=('!emptydirs')
source=("git+https://github.com/krb5/krb5.git"
        "https://gitlab.archlinux.org/archlinux/packaging/packages/krb5/-/raw/main/krb5-kadmind.service"
        "https://gitlab.archlinux.org/archlinux/packaging/packages/krb5/-/raw/main/krb5-kdc.service"
        "https://gitlab.archlinux.org/archlinux/packaging/packages/krb5/-/raw/main/krb5-kpropd.service"
        "https://gitlab.archlinux.org/archlinux/packaging/packages/krb5/-/raw/main/krb5-kpropd.socket"
        "https://gitlab.archlinux.org/archlinux/packaging/packages/krb5/-/raw/main/krb5-kpropd@.service")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


prepare() {
  cd "krb5"

  sed -i "/KRB5ROOT=/s/\/local//" "src/util/ac_check_krb5.m4"
}

pkgver() {
  cd "krb5"

  _tag=$(git tag -l --sort -v:refname | grep -E '^krb5-[0-9\.]+-final' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^krb5-//;s/-final//'
}

build() {
  cd "krb5/src"

  autoreconf -fi
  ./configure \
    --prefix="/usr" \
    --localstatedir="/var/lib" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc" \
    --enable-dns-for-realm \
    --with-ldap \
    --with-system-et \
    --with-system-ss \
    --with-system-verto
  make
}

check() {
  cd "krb5/src"

  #make check
}

package() {
  cd "krb5"

  make \
    -C "src" \
    DESTDIR="$pkgdir" \
    EXAMPLEDIR="/usr/share/doc/krb5/examples" \
    install
  install -Dm644 "NOTICE" -t "$pkgdir/usr/share/licenses/krb5"

  # Fix FS#29889
  install -Dm644 "src/plugins/kdb/ldap/libkdb_ldap"/kerberos.{ldif,schema} -t "$pkgdir/usr/share/doc/$pkgname/examples"

  install -Dm644 "src/config-files/krb5.conf" -t "$pkgdir/etc"
  install -Dm644 "src/config-files/kdc.conf" -t "$pkgdir/var/lib/krb5kdc"

  install -Dm644 "src/util/ac_check_krb5.m4" -t "$pkgdir/usr/share/aclocal"

  # systemd stuff
  install -Dm644 "$srcdir"/krb5-{kadmind.service,kdc.service,kpropd.service,kpropd.socket,kpropd@.service} -t "$pkgdir/usr/lib/systemd/system"
}

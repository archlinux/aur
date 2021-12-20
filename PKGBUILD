pkgname=ssmtp
pkgver=2.64
pkgrel=17
pkgdesc="Extremely simple MTA to get mail off the system to a mailhub (with Fedora patches)"
arch=('i686' 'x86_64' 'armv7' 'aarch64' 'armv6h' 'armv7h')
license=('GPL')
url="https://packages.debian.org/stable/mail/ssmtp"
depends=('openssl' 'inetutils')
makedepends=('systemd') # Needed for sysusers.d to create the 'mail' group
conflicts=('exim' 'smtp-forwarder')
provides=('smtp-forwarder')
backup=('etc/ssmtp/ssmtp.conf' 'etc/ssmtp/revaliases')
options=('!makeflags' '!emptydirs')
source=("http://ftp.debian.org/debian/pool/main/s/ssmtp/${pkgname}_${pkgver}.orig.tar.bz2"
        'aliases.patch'
        'authpass.patch'
        'defaultvalues.patch'
        'garbage_writes.patch'
        'remote-addr.patch'
        'validate-TLS-server-cert.patch'
        'openssl_crypto.patch'
)
md5sums=('65b4e0df4934a6cd08c506cabcbe584f'
         '15d3b21c64b83aba4ad2283318ac0680'
         'd2b946bd299453eb2df7bcc1d6186592'
         '9de4e3a78799492a4fa8238e13e88d06'
         '69c2bd9a00189a4c110d420b23d69258'
         '3473db24c65bbe6fdeb51e99427e8ee2'
         '237a6fad4d367b566ada3a900d1f1bc0'
         'aeb4ed09a26eefea9a5f6ac755c4dff0')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/openssl_crypto.patch"

  # Patches from https://src.fedoraproject.org/rpms/ssmtp/tree/master
  patch -p1 -i "${srcdir}/aliases.patch"
  patch -p1 -i "${srcdir}/authpass.patch"
  patch -p1 -i "${srcdir}/defaultvalues.patch"
  patch -p1 -i "${srcdir}/garbage_writes.patch"
  patch -p1 -i "${srcdir}/remote-addr.patch"
  patch -p1 -i "${srcdir}/validate-TLS-server-cert.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  autoreconf

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --mandir=/usr/share/man \
              --enable-md5auth \
              --enable-ssl\
              --enable-inet6
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  yes | make prefix="${pkgdir}/usr" mandir="${pkgdir}/usr/share/man/man8" etcdir="${pkgdir}/etc" install

  install -D -m644 ssmtp.conf.5 "${pkgdir}/usr/share/man/man5/ssmtp.conf.5"
  install -m644 ssmtp.conf "${pkgdir}/etc/ssmtp/ssmtp.conf"

  chown -R root.mail "${pkgdir}/etc/ssmtp"
  chmod 770 "${pkgdir}/etc/ssmtp"

  ln -s ssmtp "${pkgdir}/usr/sbin/sendmail"
  ln -s ssmtp "${pkgdir}/usr/sbin/newaliases"
  ln -s ssmtp "${pkgdir}/usr/sbin/mailq"
  # usrmove
  cd "$pkgdir"
  mv usr/sbin usr/bin

  chown root.mail "${pkgdir}/usr/bin/ssmtp"
  chmod 2755 "${pkgdir}/usr/bin/ssmtp"
}

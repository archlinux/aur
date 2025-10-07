# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

# To use, put `AuthMethod=XOAUTH2` and `AuthPass=<your obtained OAuth2 access token>` in `/etc/ssmtp/ssmtp.conf`.
#
# Remember that your OAuth2 access token is often short-lived and will expire in small intervals. (for example, Gmail access tokens expire in 1 hour) You will need a script to refresh it using a long-term refresh token.
#
# For Gmail, oauth2l (https://github.com/google/oauth2l, https://aur.archlinux.org/packages/oauth2l) can be used to obtain and refresh the access token using your own registered client secret with Google. Example script:
#
# #!/bin/bash
# ACCESS_TOKEN=$(oauth2l fetch --scope=https://mail.google.com/ \
#     --credentials=/etc/oauth2l.json --cache=/etc/ssmtp/oauth2l.cache --refresh)
# sed -i "s/^AuthPass=.*$/AuthPass=$ACCESS_TOKEN/" /etc/ssmtp/ssmtp.conf
#
# To refresh the access token every time before sending an email from the command line:
#
# /etc/oauth2l.json is your client ID info
# /etc/ssmtp/oauth2l.cache is the oauth2l cache location for storing the refresh token.

pkgname=ssmtp
pkgver=2.64
pkgrel=21
pkgdesc="Extremely simple MTA to get mail off the system to a mailhub (with Fedora patches)"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('GPL-2.0-or-later')
url="https://wiki.debian.org/sSMTP"
depends=('openssl' 'inetutils')
makedepends=('systemd') # Needed for sysusers.d to create the 'mail' group
conflicts=('exim' 'smtp-forwarder')
provides=('smtp-forwarder')
backup=('etc/ssmtp/ssmtp.conf' 'etc/ssmtp/revaliases')
options=('!makeflags' '!emptydirs')
source=("http://ftp.debian.org/debian/pool/main/s/ssmtp/${pkgname}_${pkgver}.orig.tar.bz2"
        'ssmtp-aliases.patch'
        'ssmtp-c23.patch'
        'ssmtp-defaultvalues.patch'
        'ssmtp-md5auth-non-rsa.patch'
        'ssmtp-validate-TLS-server-cert.patch'
        'ssmtp-authpass.patch'
        'ssmtp-configure-c99.patch'
        'ssmtp-garbage_writes.patch'
        'ssmtp-remote-addr.patch'
        'openssl_crypto.patch'
        'xoauth2.patch'
)
sha256sums=('22c37dc90c871e8e052b2cab0ad219d010fa938608cd66b21c8f3c759046fa36'
            'fe031849b891e0fa72114b01e2b87f6a2e75c51832727fb5abaf9d8db83b4d29'
            '98db498234da573a9d837dcb0220686c849411fc0aeccf0e8d702c51ac2de4f2'
            'c39c6ddd90fb7311440ec1709a4bcda2d600c9a7b3a9c93be8ab899b932f04e8'
            '71d3f333d05ffbb6dcbe27a6e4655593c8298a95ade52673c4dfd5ae46d923cd'
            '85598c3964862b4d4d2314ab8f783eefaef6cbb22fb8a3a339cd60e611dad6ff'
            '7f89cfa626e198660da37cae0339d02f42216cf92eadcdeda05efe35c3c41a71'
            '1fa4fe4070ced28ccdd74dc284c71fe13e19091f7d01b47fdf34fe23539b8d58'
            '831caf28a16c729e56e08600eee8d19c20f3bdb3a5df56815cde45a248555358'
            '36edd03e4cfcde14830e345256b05b8630d9f25ce714455cf1a910d5ab30c341'
            '6cfcc8660968c97ff95e1df0b0725076838b4d35ffaa17c65afcf09ebca3170d'
            'fc8d166a97329755cff25a1f444b3892071ff5618ef698e27de5bfb004373937')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Patches from https://src.fedoraproject.org/rpms/ssmtp/tree/main
  patch -p1 -i "${srcdir}/ssmtp-md5auth-non-rsa.patch"
  patch -p1 -i "${srcdir}/ssmtp-garbage_writes.patch"
  patch -p1 -i "${srcdir}/ssmtp-authpass.patch"
  patch -p1 -i "${srcdir}/ssmtp-aliases.patch"
  patch -p1 -i "${srcdir}/ssmtp-remote-addr.patch"
  patch -p1 -i "${srcdir}/ssmtp-validate-TLS-server-cert.patch"
  patch -p1 -i "${srcdir}/ssmtp-defaultvalues.patch"
  patch -p1 -i "${srcdir}/ssmtp-configure-c99.patch"
  patch -p1 -i "${srcdir}/ssmtp-c23.patch"

  # Other patches
  patch -p1 -i "${srcdir}/openssl_crypto.patch"
  patch -p1 -i "${srcdir}/xoauth2.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  autoreconf

  CFLAGS="-Wno-pointer-to-int-cast -Wno-discarded-qualifiers -Wno-int-conversion" \
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --mandir=/usr/share/man \
              --enable-ssl\
              --enable-inet6
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  yes | make prefix="${pkgdir}/usr" mandir="${pkgdir}/usr/share/man/man8" etcdir="${pkgdir}/etc" install

  install -D -m644 ssmtp.conf.5 "${pkgdir}/usr/share/man/man5/ssmtp.conf.5"
  install -m644 ssmtp.conf "${pkgdir}/etc/ssmtp/ssmtp.conf"

  chown -R root:mail "${pkgdir}/etc/ssmtp"
  chmod 770 "${pkgdir}/etc/ssmtp"

  ln -s ssmtp "${pkgdir}/usr/sbin/sendmail"
  ln -s ssmtp "${pkgdir}/usr/sbin/newaliases"
  ln -s ssmtp "${pkgdir}/usr/sbin/mailq"
  cd "$pkgdir"
  mv usr/sbin usr/bin

  chown root:mail "${pkgdir}/usr/bin/ssmtp"
  chmod 2755 "${pkgdir}/usr/bin/ssmtp"
}

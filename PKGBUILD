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
pkgrel=18
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
        'xoauth2.patch'
)
sha256sums=('22c37dc90c871e8e052b2cab0ad219d010fa938608cd66b21c8f3c759046fa36'
            'b0203e2bed2a3c053b47fc7e36b48decf1157ec2fc3eae130b9a1bc46bd2d357'
            'eaa35ea5cee7ba471791555e5017c4565de4d527d15d9d3c86f36b985373f325'
            '108d1a04dac1d99bb5bc67829f64cab5dc95c44611ebe4f535d0a5b5e8f3a49f'
            'd0c05b24ff27c781a3e0379769f4af3ad1f0244c8899344928805a95a6ded8b3'
            '3f9f21f6363cee92c1e5763b9bd491e262258d39b401dccc8efc2b40c8e0dd0a'
            '280ac74257ad89029f91dc47b78ce3c1f9f4a96696b31f82b66d64bb3b2bcc47'
            '6cfcc8660968c97ff95e1df0b0725076838b4d35ffaa17c65afcf09ebca3170d'
            'fc8d166a97329755cff25a1f444b3892071ff5618ef698e27de5bfb004373937')

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
  patch -p1 -i "${srcdir}/xoauth2.patch"
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
  cd "$pkgdir"
  mv usr/sbin usr/bin

  chown root.mail "${pkgdir}/usr/bin/ssmtp"
  chmod 2755 "${pkgdir}/usr/bin/ssmtp"
}

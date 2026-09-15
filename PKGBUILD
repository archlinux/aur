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
pkgver=2.66
pkgrel=1
pkgdesc="Extremely simple MTA to get mail off the system to a mailhub (with Fedora patches)"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('GPL-2.0-or-later')
url="https://github.com/Project-OSS-Revival/ssmtp"
depends=('openssl' 'inetutils')
makedepends=('systemd') # Needed for sysusers.d to create the 'mail' group
conflicts=('exim' 'smtp-forwarder')
provides=('smtp-forwarder')
backup=('etc/ssmtp/ssmtp.conf' 'etc/ssmtp/revaliases')
options=('!makeflags' '!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Project-OSS-Revival/ssmtp/archive/refs/tags/v${pkgver}.tar.gz"
        'ssmtp-defaultvalues.patch'
        'ssmtp-aliases.patch'
        'xoauth2.patch'
)
sha256sums=('6e639eafce4c8a3b7782c2a8a2d467be097c5896eae86fcde0f608666ea88249'
            '4d50ffa5e6fb52c69fe05fd19ec8e76c71199e29bb515a95ea08aecd79f54a0a'
            'd2c8f7ea00c4ec4f1be5b26ec058c342f9bb6676c84f3cad934ff12a80417236'
            '6006a3e14f45b69618c4f2bf982b820938f306ab21aa2a0b7d1b4309d59f6cb5')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Patches from https://src.fedoraproject.org/rpms/ssmtp/tree/main
  patch -p1 -i "${srcdir}/ssmtp-defaultvalues.patch"
  patch -p1 -i "${srcdir}/ssmtp-aliases.patch"

  # Other patches
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

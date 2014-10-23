# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <nicky726@gmail.com>

pkgname=pam-selinux
pkgver=1.1.8
pkgrel=5
pkgdesc="SELinux aware PAM (Pluggable Authentication Modules) library"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://linux-pam.org"
depends=('glibc' 'cracklib' 'libtirpc' 'pambase-selinux' 'libselinux')
makedepends=('flex' 'w3m' 'docbook-xml>=4.4' 'docbook-xsl')
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
backup=(etc/security/{access.conf,group.conf,limits.conf,namespace.conf,namespace.init,pam_env.conf,time.conf} etc/default/passwd etc/environment)
groups=('selinux')
source=(https://fedorahosted.org/releases/l/i/linux-pam/Linux-PAM-$pkgver.tar.bz2
        ftp://ftp.archlinux.org/other/pam_unix2/pam_unix2-2.9.1.tar.bz2
        pam_unix2-glibc216.patch
        pam-1.1.8-cve-2013-7041.patch
        pam-1.1.8-cve-2014-2583.patch
        pam_unix2-rm_selinux_check_access.patch)
md5sums=('35b6091af95981b1b2cd60d813b5e4ee'
         'da6a46e5f8cd3eaa7cbc4fc3a7e2b555'
         'dac109f68e04a4df37575fda6001ea17'
         '653661bea920de3bb2713bb85b408bc2'
         '144ea8e2f9d49a0f4021027ca2c1558f'
         '6a0a6bb6f6f249ef14f6b21ab9880916')

options=('!emptydirs')

prepare () {
  cd $srcdir/Linux-PAM-$pkgver
  # fix CVEs in pam
  patch -Np1 -i  "${srcdir}/pam-1.1.8-cve-2013-7041.patch"
  patch -Np1 -i  "${srcdir}/pam-1.1.8-cve-2014-2583.patch"

  # fix pam_unix2 building
  cd $srcdir/pam_unix2-2.9.1
  patch -Np1 -i "${srcdir}/pam_unix2-glibc216.patch"
  patch -Np1 -i "${srcdir}/pam_unix2-rm_selinux_check_access.patch"
}

build() {
  cd $srcdir/Linux-PAM-$pkgver
  ./configure --libdir=/usr/lib --sbindir=/usr/bin --disable-db \
              --enable-selinux
  make

  cd $srcdir/pam_unix2-2.9.1
  # modify flags to build against the pam compiled here, not a system lib.
  ./configure \
      CFLAGS="$CFLAGS -I$srcdir/Linux-PAM-$pkgver/libpam/include/" \
      LDFLAGS="$LDFLAGS -L$srcdir/Linux-PAM-$pkgver/libpam/.libs/" \
      --libdir=/usr/lib \
      --sbindir=/usr/bin
  make
}

package() {
  cd $srcdir/Linux-PAM-$pkgver
  make DESTDIR=$pkgdir SCONFIGDIR=/etc/security install

  # build pam_unix2 module
  # source ftp://ftp.suse.com/pub/people/kukuk/pam/pam_unix2
  cd $srcdir/pam_unix2-2.9.1
  make DESTDIR=$pkgdir install

  # add the realtime permissions for audio users
  sed -i 's|# End of file||' $pkgdir/etc/security/limits.conf
  cat >>$pkgdir/etc/security/limits.conf <<_EOT
*               -       rtprio          0
*               -       nice            0
@audio          -       rtprio          65
@audio          -       nice           -10
@audio          -       memlock         40000
_EOT

  # fix some missing symlinks from old pam for compatibility
  cd $pkgdir/usr/lib/security
  ln -s pam_unix.so pam_unix_acct.so
  ln -s pam_unix.so pam_unix_auth.so
  ln -s pam_unix.so pam_unix_passwd.so
  ln -s pam_unix.so pam_unix_session.so

  # set unix_chkpwd uid
  chmod +s $pkgdir/usr/bin/unix_chkpwd
  # remove doc which is not used anymore
  # FS #40749
  rm $pkgdir/usr/share/doc/Linux-PAM/sag-pam_userdb.html
}

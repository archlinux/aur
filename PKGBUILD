# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <nicky726@gmail.com>
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=pam-selinux
pkgver=1.5.0
pkgrel=2
pkgdesc="SELinux aware PAM (Pluggable Authentication Modules) library"
arch=('x86_64')
license=('GPL2')
url="http://linux-pam.org"
depends=('glibc' 'libtirpc' 'audit' 'libselinux' 'pambase-selinux' 'libaudit.so' 'libxcrypt' 'libcrypt.so')
makedepends=('flex' 'w3m' 'docbook-xml>=4.4' 'docbook-xsl')
provides=('libpam.so' 'libpamc.so' 'libpam_misc.so')
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
backup=(etc/security/{access.conf,faillock.conf,group.conf,limits.conf,namespace.conf,namespace.init,pam_env.conf,time.conf} etc/environment)
groups=('selinux')
source=(https://github.com/linux-pam/linux-pam/releases/download/v$pkgver/Linux-PAM-$pkgver.tar.xz{,.asc}
        CVE-2020-27780.patch  # https://github.com/linux-pam/linux-pam/commit/30fdfb90d9864bcc254a62760aaa149d373fd4eb.patch
        ${pkgname/-selinux}.tmpfiles)
validpgpkeys=(
        '8C6BFD92EE0F42EDF91A6A736D1A7F052E5924BB' # Thorsten Kukuk
        '296D6F29A020808E8717A8842DB5BD89A340AEB7' #Dimitry V. Levin <ldv@altlinux.org>
)

sha256sums=('02d39854b508fae9dc713f7733bbcdadbe17b50de965aedddd65bcb6cc7852c8'
            'SKIP'
            'b785b637e4bf4c0a1601c296b562ee2eed09916cc589dc4021fa1abc6c5394c8'
            '5631f224e90c4f0459361c2a5b250112e3a91ba849754bb6f67d69d683a2e5ac')

options=('!emptydirs')

prepare() {
  cd Linux-PAM-$pkgver
  patch -Np1 < ../CVE-2020-27780.patch
}

build() {
  cd Linux-PAM-$pkgver
  # Enable building deprecated pam_tally2.so module (--enable-tally2) in order
  # to smooth the transition to pam_faillock.so
  # https://github.com/archlinuxhardened/selinux/issues/41#issuecomment-668202328
  ./configure --libdir=/usr/lib --sbindir=/usr/bin --disable-db \
              --enable-selinux --enable-tally2
  make
}

package() {
  install -Dm 644 ${pkgname/-selinux}.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/${pkgname/-selinux}.conf
  cd Linux-PAM-$pkgver
  make DESTDIR="$pkgdir" SCONFIGDIR=/etc/security install

  # set unix_chkpwd uid
  chmod +s "$pkgdir"/usr/bin/unix_chkpwd

  # remove doc which is not used anymore
  # FS #40749
  rm "$pkgdir"/usr/share/doc/Linux-PAM/sag-pam_userdb.html
}

# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <nicky726@gmail.com>
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=pam-selinux
pkgver=1.5.2
pkgrel=1
pkgdesc="SELinux aware PAM (Pluggable Authentication Modules) library"
arch=('x86_64' 'aarch64')
license=('GPL2')
url="http://linux-pam.org"
depends=('glibc' 'libtirpc' 'audit' 'libselinux' 'pambase-selinux' 'libaudit.so' 'libxcrypt' 'libcrypt.so')
makedepends=('flex' 'w3m' 'docbook-xml>=4.4' 'docbook-xsl')
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=('libpam.so' 'libpamc.so' 'libpam_misc.so'
          "${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
backup=(etc/security/{access.conf,faillock.conf,group.conf,limits.conf,namespace.conf,namespace.init,pam_env.conf,time.conf} etc/environment)
groups=('selinux')
source=(https://github.com/linux-pam/linux-pam/releases/download/v$pkgver/Linux-PAM-$pkgver.tar.xz{,.asc}
        ${pkgname/-selinux}.tmpfiles)
validpgpkeys=(
        '8C6BFD92EE0F42EDF91A6A736D1A7F052E5924BB' # Thorsten Kukuk
        '296D6F29A020808E8717A8842DB5BD89A340AEB7' #Dimitry V. Levin <ldv@altlinux.org>
)

sha256sums=('e4ec7131a91da44512574268f493c6d8ca105c87091691b8e9b56ca685d4f94d'
            'SKIP'
            '5631f224e90c4f0459361c2a5b250112e3a91ba849754bb6f67d69d683a2e5ac')

options=('!emptydirs')

build() {
  cd Linux-PAM-$pkgver
  # Enable building deprecated pam_tally2.so module (--enable-tally2) in order
  # to smooth the transition to pam_faillock.so
  # https://github.com/archlinuxhardened/selinux/issues/41#issuecomment-668202328
  ./configure \
    --libdir=/usr/lib \
    --sbindir=/usr/bin \
    --disable-db \
    --enable-selinux \
    --enable-tally2
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

# vim: ts=2 sw=2 et:

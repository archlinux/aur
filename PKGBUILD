# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <nicky726@gmail.com>
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=pam-selinux
pkgver=1.4.0
pkgrel=3
pkgdesc="SELinux aware PAM (Pluggable Authentication Modules) library"
arch=('x86_64')
license=('GPL2')
url="http://linux-pam.org"
depends=('glibc' 'libtirpc' 'audit' 'libselinux')
makedepends=('flex' 'w3m' 'docbook-xml>=4.4' 'docbook-xsl')
optdepends=('pambase-selinux: SELinux aware base PAM configuration')
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
backup=(etc/security/{access.conf,faillock.conf,group.conf,limits.conf,namespace.conf,namespace.init,pam_env.conf,time.conf} etc/environment)
groups=('selinux')
source=(https://github.com/linux-pam/linux-pam/releases/download/v$pkgver/Linux-PAM-$pkgver.tar.xz
        https://github.com/linux-pam/linux-pam/releases/download/v$pkgver/Linux-PAM-$pkgver.tar.xz.asc
        395915dae1571e10e2766c999974de864655ea3a.patch
        af0faf666c5008e54dfe43684f210e3581ff1bca.patch
        0e9b286afe1224b91ff00936058b084ad4b776e4.patch
        ${pkgname/-selinux}.tmpfiles)
validpgpkeys=(
        '8C6BFD92EE0F42EDF91A6A736D1A7F052E5924BB' # Thorsten Kukuk
        '296D6F29A020808E8717A8842DB5BD89A340AEB7' #Dimitry V. Levin <ldv@altlinux.org>
)

sha256sums=('cd6d928c51e64139be3bdb38692c68183a509b83d4f2c221024ccd4bcddfd034'
            'SKIP'
            'cd2440d7bec55fa91e499060c0bf248f4fd20e7a0ef613eb7a06ee083f7ce21b'
            'ac3e1d307756f5975587a7846500414c02d2b60acb271017b9c7aa6f47c89875'
            '68f81b67dde5ee6003524b6b14e2d6f27edcfc0a2bde4c55a1cacbc6e299c207'
            '5631f224e90c4f0459361c2a5b250112e3a91ba849754bb6f67d69d683a2e5ac')

options=('!emptydirs')

prepare() {
  cd Linux-PAM-$pkgver
  patch -p1 -i ../395915dae1571e10e2766c999974de864655ea3a.patch
  patch -p1 -i ../af0faf666c5008e54dfe43684f210e3581ff1bca.patch
  patch -p1 -i ../0e9b286afe1224b91ff00936058b084ad4b776e4.patch
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

# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: judd <jvinet@zeroflux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <nicky726@gmail.com>
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=pam-selinux
pkgver=1.6.0
pkgrel=4
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
backup=(etc/security/{access.conf,faillock.conf,group.conf,limits.conf,namespace.conf,namespace.init,pwhistory.conf,pam_env.conf,time.conf} etc/environment)
groups=('selinux')
source=(https://github.com/linux-pam/linux-pam/releases/download/v$pkgver/Linux-PAM-$pkgver{,-docs}.tar.xz{,.asc}
        https://github.com/linux-pam/linux-pam/commit/470b5bdd8fd29d6b35e3a80f9a57bdd4b2438200.patch
        https://github.com/linux-pam/linux-pam/commit/b7b96362087414e52524d3d9d9b3faa21e1db620.patch
        ${pkgname/-selinux}.tmpfiles)
validpgpkeys=(
        '8C6BFD92EE0F42EDF91A6A736D1A7F052E5924BB' # Thorsten Kukuk
        '296D6F29A020808E8717A8842DB5BD89A340AEB7' #Dimitry V. Levin <ldv@altlinux.org>
)

sha256sums=('fff4a34e5bbee77e2e8f1992f27631e2329bcbf8a0563ddeb5c3389b4e3169ad'
            'SKIP'
            '3e82730d3350795c42f3708f6609a92c1df841d518aa17c28fd702fe5ec23a32'
            'SKIP'
            'ee7333ad2c8b2a710c73d8a2d202027d0c79d3628fefe58073f2d78ecefa121e'
            '450760e1989f036acee157f91a3028264f8ce7fb0cbdd65eccf8a0fc0084497c'
            '5631f224e90c4f0459361c2a5b250112e3a91ba849754bb6f67d69d683a2e5ac')

options=('!emptydirs')

prepare() {
  cd Linux-PAM-$pkgver
  # apply patch from the source array (should be a pacman feature)
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build() {
  cd Linux-PAM-$pkgver
  ./configure \
    --libdir=/usr/lib \
    --sbindir=/usr/bin \
    --enable-logind \
    --disable-db \
    --enable-selinux
  make
}

package() {
  install -Dm 644 ${pkgname/-selinux}.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/${pkgname/-selinux}.conf
  cd Linux-PAM-$pkgver
  make DESTDIR="$pkgdir" SCONFIGDIR=/etc/security install

  # set unix_chkpwd uid
  chmod +s "$pkgdir"/usr/bin/unix_chkpwd
}

# vim: ts=2 sw=2 et:

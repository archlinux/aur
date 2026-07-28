# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=sudo-selinux
_sudover=1.9.17p2
pkgrel=6
pkgver=${_sudover/p/.p}
pkgdesc="Give certain users the ability to run some commands as root - SELinux support"
arch=('x86_64' 'aarch64')
url="https://www.sudo.ws/sudo/"
license=('custom')
groups=('selinux')
depends=('glibc' 'openssl' 'pam-selinux' 'libldap' 'zlib' 'libselinux')
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
backup=('etc/pam.d/sudo'
        'etc/sudo.conf'
        'etc/sudo_logsrvd.conf'
        'etc/sudoers')
install=${pkgname/-selinux}.install
source=(https://www.sudo.ws/sudo/dist/${pkgname/-selinux}-$_sudover.tar.gz{,.sig}
        sudo_logsrvd.service
        sudo.pam)
sha256sums=('4a38a1ab3adb1199257edc2a7c4a2bd714665eb605b04368843b06dada2cfcfb'
            'SKIP'
            'bd4bc2f5d85cbe14d7e7acc5008cb4fe62c38de7d42dc6876c87bfaa273c0a6e'
            '7ec1c668c10e0f83d00e25f336872212fe04ce2c2563e1d661d34d28852f4649')
validpgpkeys=('59D1E9CCBA2B376704FDD35BA9F4C021CEA470FB')

prepare() {
  cd "${pkgname/-selinux}-$_sudover"
}

build() {
  cd "${pkgname/-selinux}-$_sudover"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --with-rundir=/run/sudo \
    --with-vardir=/var/db/sudo \
    --with-logfac=auth \
    --enable-tmpfiles.d \
    --with-pam \
    --with-sssd \
    --with-ldap \
    --with-ldap-conf-file=/etc/openldap/ldap.conf \
    --with-env-editor \
    --with-passprompt="[sudo] password for %p: " \
    --with-secure-path-value=/usr/local/sbin:/usr/local/bin:/usr/bin \
    --with-all-insults \
    --with-selinux
  make
}

check() {
  cd "${pkgname/-selinux}-$_sudover"
  make check
}

package() {
  depends+=('libcrypto.so' 'libssl.so')

  cd "$srcdir/${pkgname/-selinux}-$_sudover"
  make DESTDIR="$pkgdir" install

  # sudo_logsrvd service file (taken from sudo-logsrvd-1.9.0-1.el8.x86_64.rpm)
  install -Dm644 -t "$pkgdir/usr/lib/systemd/system" ../sudo_logsrvd.service

  # Remove sudoers.dist; not needed since pacman manages updates to sudoers
  rm "$pkgdir/etc/sudoers.dist"

  # Remove /run/sudo directory; we create it using systemd-tmpfiles
  rmdir "$pkgdir/run/sudo"
  rmdir "$pkgdir/run"

  install -Dm644 "$srcdir/sudo.pam" "$pkgdir/etc/pam.d/sudo"

  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/sudo-selinux"
}

# vim:set ts=2 sw=2 et:

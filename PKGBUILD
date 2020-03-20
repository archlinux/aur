# Maintainer: zer0def <zer0def@freenode>
# Maintainer: Björn Wiedenmann <archlinux cat xorxor dog de>
# Contributor: Jonathan Yantis <yantis cat yantis dog net>
# Contributor: Christian Hesse <mail cat eworm dog de>
# Contributor: Gaetan Bisson <bisson cat archlinux dog org>
# Contributor: Caspar Verhey <caspar at verhey dot net>
# Contributor: Seth Fulton  <seth cat sysfu dog com>
# Contributor: Aaron Griffin <aaron cat archlinux dog org>
# Contributor: judd <jvinet cat zeroflux dog org>
# Contributor: benetnash <benetnash cat mail dog icpnet dog pl>
# Contributor: Thomas Haider <t.haider cat vcnc dog org>

# Note: The bulk of this PKGBUILD is based off:
# https://aur.archlinux.org/packages/op/openssh-git/PKGBUILD
# https://aur.archlinux.org/packages/op/openssh-hpn/PKGBUILD

# IMPORTANT SECURITY NOTE:
# This PKGBUILD does NOT (!!!) follow the upstream
# OpenSSH-Portable distribution (at
# https://github.com/openssh/openssh-portable ) but rather a
# fork which is maintained by rapier (primarily for Gentoo
# Linux I believe). The fork includes the HPN patches and can be
# found at https://github.com/rapier1/openssh-portable
#
# Since I do NOT maintain this fork in any way, but merely
# package it for Arch Linux, there is absolutely no warranty for
# this code. It is very possible that the current version of the
# fork still contains open security bugs which have already been
# fixed in upstream OpenSSH.
#
# USE THIS PKGBUILD AT YOUR OWN RISK AND ONLY IF YOU FULLY
# UNDERSTAND THE SECURITY IMPLICATIONS OF NOT USING THE MOST
# RECENT OFFICIAL OPENSSH !
#
# Consider yourself warned.
#
# If security is paramount for you or in case of any doubt,
# please use the official OpenSSH distribution instead.

# This package should probably follow chutzpah@gentoo's patches in the future

pkgname=openssh-hpn
_openssh_ver=8.1p1
_hpn_ver=hpn14v20
#_pkgver="`sed -e 's/\./_/' -e 's/p/_P/' <<< ${_openssh_ver}`_new"
_pkgver="`sed -e 's/\./_/' -e 's/p/_P/' <<< ${_openssh_ver}`"
pkgver="${_openssh_ver}.${_hpn_ver}"
pkgrel=2
pkgdesc='A Secure SHell server/client fork with High Performance patches included'
url='https://www.psc.edu/index.php/hpn-ssh/'
license=('custom:BSD')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('krb5' 'ldns>=1.7.1' 'libedit' 'openssl' 'pam')
makedepends=('git')
optdepends=('xorg-xauth: X11 forwarding'
            'x11-ssh-askpass: input passphrase in X')
provides=('openssh'
          'openssh-hpn')
conflicts=('openssh'
           'openssh-hpn'
           'openssh-hpn-git')
source=("https://github.com/rapier1/openssh-portable/archive/hpn-${_pkgver}.tar.gz"
        'http://www.eworm.de/download/linux/openssh-tests-scp.patch'
        #'openssl11.patch'
        'hpn-banner.patch'
        'glibc-2.31.patch'
        'sshdgenkeys.service'
        'sshd@.service'
        'sshd.service'
        'sshd.socket'
        'sshd.pam')
backup=('etc/ssh/ssh_config'
        'etc/ssh/sshd_config'
        'etc/pam.d/sshd')

sha256sums=('e159af51f51e6f78634b9fea0b8a4fe2c9e4f98609a07e1fe815e710f104c779'
            '007a8888855570296c36716df18e986b7265c283e8fc8f6dfd4b3c411905fdb3'
            #'6c6deb799fc918b4d90899d664a23b3a99e2973d61b5a2cf68e1ea9a6604ca9a'
            '57bb8c4800afc5314ad1f3ac24bc838f1f63c626171d3c5ad4b843bfef2391fe'
            '25b4a4d9e2d9d3289ef30636a30e85fa1c71dd930d5efd712cca1a01a5019f93'
            'ff3cbdd0e59ff7dac4dc797d5c0f2b1db4117ddbb49d52f1c4f1771961903878'
            '69cc2abaaae0aa8071b8eac338b2df725f60ce73381843179b74eaac78ba7f1d'
            'c5ed9fa629f8f8dbf3bae4edbad4441c36df535088553fe82695c52d7bde30aa'
            'de14363e9d4ed92848e524036d9e6b57b2d35cc77d377b7247c38111d2a3defd'
            '64576021515c0a98b0aaf0a0ae02e0f5ebe8ee525b1e647ab68f369f81ecd846')

install=$pkgname.install

build() {
  cd openssh-portable-hpn-${_pkgver}/

  # fix building if scp is not installed on host
  if [ ! -x /usr/bin/scp ]; then
    patch -Np1 < ${srcdir}/openssh-tests-scp.patch
  fi
  # https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=371794f20c7eb2b88cae2619b6fa3444452aafb4
  #patch -Np1 < ${srcdir}/openssl11.patch
  patch -Np1 < ${srcdir}/hpn-banner.patch
  patch -Np1 < ${srcdir}/glibc-2.31.patch
  autoreconf -fi

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/ssh \
    --sysconfdir=/etc/ssh \
    --with-ldns \
    --with-libedit \
    --with-ssl-engine \
    --with-pam \
    --with-privsep-user=nobody \
    --with-kerberos5=/usr \
    --with-xauth=/usr/bin/xauth \
    --with-mantype=man \
    --with-md5-passwords \
    --with-pid-dir=/run \

  make
}

package() {
  cd openssh-portable-hpn-${_pkgver}/

  make DESTDIR="${pkgdir}" install

  ln -sf ssh.1.gz "${pkgdir}"/usr/share/man/man1/slogin.1.gz
  install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"

  install -Dm644 ../sshdgenkeys.service "${pkgdir}"/usr/lib/systemd/system/sshdgenkeys.service
  install -Dm644 ../sshd@.service "${pkgdir}"/usr/lib/systemd/system/sshd@.service
  install -Dm644 ../sshd.service "${pkgdir}"/usr/lib/systemd/system/sshd.service
  install -Dm644 ../sshd.socket "${pkgdir}"/usr/lib/systemd/system/sshd.socket
  install -Dm644 ../sshd.pam "${pkgdir}"/etc/pam.d/sshd

  install -Dm755 contrib/findssl.sh "${pkgdir}"/usr/bin/findssl.sh
  install -Dm755 contrib/ssh-copy-id "${pkgdir}"/usr/bin/ssh-copy-id
  install -Dm644 contrib/ssh-copy-id.1 "${pkgdir}"/usr/share/man/man1/ssh-copy-id.1

  sed \
    -e '/^#ChallengeResponseAuthentication yes$/c ChallengeResponseAuthentication no' \
    -e '/^#PrintMotd yes$/c PrintMotd no # pam does that' \
    -e '/^#UsePAM no$/c UsePAM yes' \
    -i "${pkgdir}"/etc/ssh/sshd_config
}


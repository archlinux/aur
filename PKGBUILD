# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=openssh-selinux
pkgver=9.1p1
pkgrel=1
pkgdesc="SSH protocol implementation for remote login, command execution and file transfer, with SELinux support"
arch=('x86_64' 'aarch64')
url='https://www.openssh.com/portable.html'
license=('custom:BSD')
depends=(
  'glibc'
  'krb5' 'libkrb5.so' 'libgssapi_krb5.so'
  'ldns'
  'libedit'
  'libxcrypt' 'libcrypt.so'
  'openssl'
  'pam' 'libpam.so'
  'zlib'
  'libselinux'
)
makedepends=('libfido2' 'linux-headers')
optdepends=(
  'libfido2: FIDO/U2F support'
  'x11-ssh-askpass: input passphrase in X'
  'xorg-xauth: X11 forwarding'
)
backup=(
  'etc/pam.d/sshd'
  'etc/ssh/ssh_config'
  'etc/ssh/sshd_config'
)
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
groups=('selinux')
source=(
  "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${pkgname/-selinux}-${pkgver}.tar.gz"{,.asc}
  "${pkgname/-selinux}-9.0p1-sshd_config.patch"
  'sshdgenkeys.service'
  'sshd.service'
  'sshd.conf'
  'sshd.pam'
)
sha256sums=('19f85009c7e3e23787f0236fbb1578392ab4d4bf9f8ec5fe6bc1cd7e8bfdd288'
            'SKIP'
            '27e43dfd1506c8a821ec8186bae65f2dc43ca038616d6de59f322bd14aa9d07f'
            'e5305767b2d317183ad1c5022a5f6705bd9014a8b22495a000fd482713738611'
            'e40f8b7c8e5e2ecf3084b3511a6c36d5b5c9f9e61f2bb13e3726c71dc7d4fbc7'
            '4effac1186cc62617f44385415103021f72f674f8b8e26447fc1139c670090f6'
            '64576021515c0a98b0aaf0a0ae02e0f5ebe8ee525b1e647ab68f369f81ecd846')
b2sums=('287b6b1cc4858b27af88f4a4674670afff1fb5b99461892083393c53ef3747c5a0fcd90cba95d2c27465a919e00f7f42732c93af4f306665ba0393bbb7a534f5'
        'SKIP'
        '29e1a1c2744e0234830c6f93a46338ea8dc943370e20a24883d207d611025e54643da678f2826050c073a36be48dfdc7329d4cfb144c2ff90607a5f10f73dc59'
        '09fad3648f48f13ee80195b90913feeba21240d121b1178e0ce62f4a17b1f7e58e8edc22c04403e377ab300f5022a804c848f5be132765d5ca26a38aab262e50'
        '07ad5c7fb557411a6646ff6830bc9d564c07cbddc4ce819641d31c05dbdf677bfd8a99907cf529a7ee383b8c250936a6423f4b4b97ba0f1c14f627bbd629bd4e'
        '27571f728c3c10834a81652f3917188436474b588f8b047462e44b6c7a424f60d06ce8cb74839b691870177d7261592207d7f35d4ae6c79af87d6a7ea156d395'
        '557d015bca7008ce824111f235da67b7e0051a693aaab666e97b78e753ed7928b72274af03d7fde12033986b733d5f996faf2a4feb6ecf53f39accae31334930')
validpgpkeys=('7168B983815A5EEF59A4ADFD2A3F414E736060BA')  # Damien Miller <djm@mindrot.org>

prepare() {
  patch -Np1 -d "${pkgname/-selinux}-$pkgver" -i ../${pkgname/-selinux}-9.0p1-sshd_config.patch
}

build() {
  cd "${pkgname/-selinux}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/ssh \
    --sysconfdir=/etc/ssh \
    --disable-strip \
    --with-ldns \
    --with-libedit \
    --with-security-key-builtin \
    --with-ssl-engine \
    --with-pam \
    --with-privsep-user=nobody \
    --with-kerberos5=/usr \
    --with-xauth=/usr/bin/xauth \
    --with-pid-dir=/run \
    --with-default-path='/usr/local/sbin:/usr/local/bin:/usr/bin' \
    --with-selinux \

  make
}

check() {
  cd "${pkgname/-selinux}-${pkgver}"

  # NOTE: make t-exec does not work in our build environment
  make file-tests interop-tests unit
}

package() {
  cd "${pkgname/-selinux}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  ln -sf ssh.1.gz "${pkgdir}"/usr/share/man/man1/slogin.1.gz
  install -Dm644 LICENCE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -Dm644 ../sshdgenkeys.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 ../sshd.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 ../sshd.conf -t "${pkgdir}"/usr/lib/tmpfiles.d/
  install -Dm644 ../sshd.pam "${pkgdir}"/etc/pam.d/sshd

  install -Dm755 contrib/findssl.sh -t "${pkgdir}"/usr/bin/
  install -Dm755 contrib/ssh-copy-id -t "${pkgdir}"/usr/bin/
  install -Dm644 contrib/ssh-copy-id.1 -t "${pkgdir}"/usr/share/man/man1/
}

# vim: ts=2 sw=2 et:

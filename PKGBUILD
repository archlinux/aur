# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=openssh-gssapi
_pkgname=openssh
pkgver=9.4p1
_patch=1
pkgrel=1
pkgdesc="SSH protocol implementation with GSSAPI support"
arch=('x86_64')
url='https://www.openssh.com/portable.html'
license=('custom:BSD')
conflicts=(${_pkgname})
provides=(${_pkgname})
depends=(
  'glibc'
  'krb5' 'libkrb5.so' 'libgssapi_krb5.so'
  'ldns'
  'libedit'
  'libxcrypt' 'libcrypt.so'
  'openssl'
  'pam' 'libpam.so'
  'zlib'
)
makedepends=('libfido2' 'linux-headers' 'git')
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
source=(
  "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${_pkgname}-${pkgver}.tar.gz"{,.asc}
  "${_pkgname}-9.0p1-sshd_config.patch"
  "${pkgname}-${pkgver}-${_patch}-gssapi.patch::https://sources.debian.org/data/main/o/openssh/1:${pkgver}-${_patch}/debian/patches/gssapi.patch"
  'zlib-1.3.patch::https://github.com/openssh/openssh-portable/commit/cb4ed12ffc332d1f72d054ed92655b5f1c38f621.patch'
  'sshdgenkeys.service'
  'sshd.service'
  'sshd.conf'
  'sshd.pam'
)
sha256sums=('3608fd9088db2163ceb3e600c85ab79d0de3d221e59192ea1923e23263866a85'
            'SKIP'
            '27e43dfd1506c8a821ec8186bae65f2dc43ca038616d6de59f322bd14aa9d07f'
            '9492c1db4307aa3fe6e12d77fff01376bf275af2980ae55b926a505aae9e9b14'
            '937d7d028574a06823e7aa92499a679a826245b3118e8f7cd4141d8d06012727'
            'e5305767b2d317183ad1c5022a5f6705bd9014a8b22495a000fd482713738611'
            'e40f8b7c8e5e2ecf3084b3511a6c36d5b5c9f9e61f2bb13e3726c71dc7d4fbc7'
            '4effac1186cc62617f44385415103021f72f674f8b8e26447fc1139c670090f6'
            '64576021515c0a98b0aaf0a0ae02e0f5ebe8ee525b1e647ab68f369f81ecd846')
b2sums=('d13d758129cce947d3f12edb6e88406aad10de6887b19ffa3ebd8e382b742a05f2a692a8824aec99939f6c7e13fbccc3bb14e5ee112f9a9255d4882eb87dcf53'
        'SKIP'
        '29e1a1c2744e0234830c6f93a46338ea8dc943370e20a24883d207d611025e54643da678f2826050c073a36be48dfdc7329d4cfb144c2ff90607a5f10f73dc59'
        '70f7dae4cb4014499037cfdc661e4b9d5ec29a664c79e55e5442eb87483bc4391d59ca835e5d8dec33e2322845f3c239016f285063fc9f273dcc9642d464bea9'
        'd41f1ecea7b4ebcfb3003826fb51c2a0c27178590c755a61752389606df35544284cb24ea8bf4fcb280eec4c6c5cb410662862b27af47f3aca63f7f638efcc9f'
        '09fad3648f48f13ee80195b90913feeba21240d121b1178e0ce62f4a17b1f7e58e8edc22c04403e377ab300f5022a804c848f5be132765d5ca26a38aab262e50'
        '07ad5c7fb557411a6646ff6830bc9d564c07cbddc4ce819641d31c05dbdf677bfd8a99907cf529a7ee383b8c250936a6423f4b4b97ba0f1c14f627bbd629bd4e'
        '27571f728c3c10834a81652f3917188436474b588f8b047462e44b6c7a424f60d06ce8cb74839b691870177d7261592207d7f35d4ae6c79af87d6a7ea156d395'
        '557d015bca7008ce824111f235da67b7e0051a693aaab666e97b78e753ed7928b72274af03d7fde12033986b733d5f996faf2a4feb6ecf53f39accae31334930')
validpgpkeys=('7168B983815A5EEF59A4ADFD2A3F414E736060BA')

prepare() {
  patch -Np1 -d "$_pkgname-$pkgver" -i ../${_pkgname}-9.0p1-sshd_config.patch
  patch -Np1 -d "$_pkgname-$pkgver" -i ../${pkgname}-${pkgver}-${_patch}-gssapi.patch
  patch -Np1 -d "$_pkgname-$pkgver" -i ../zlib-1.3.patch
  cd "${srcdir}/${_pkgname}-${pkgver}"
  autoreconf
}

build() {
  local configure_options=(
    --prefix=/usr
    --sbindir=/usr/bin
    --libexecdir=/usr/lib/ssh
    --sysconfdir=/etc/ssh
    --disable-strip
    --with-ldns
    --with-libedit
    --with-security-key-builtin
    --with-ssl-engine
    --with-pam
    --with-privsep-user=nobody
    --with-kerberos5=/usr
    --with-xauth=/usr/bin/xauth
    --with-pid-dir=/run
    --with-default-path='/usr/local/sbin:/usr/local/bin:/usr/bin'
    --with-gssapi
  )

  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure "${configure_options[@]}"
  make
}

check() {
  cd "${_pkgname}-${pkgver}"

  # NOTE: make t-exec does not work in our build environment
  make file-tests interop-tests unit
}

package() {
  cd "${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  ln -sf ssh.1.gz "${pkgdir}"/usr/share/man/man1/slogin.1.gz
  install -Dm644 LICENCE -t "${pkgdir}/usr/share/licenses/${_pkgname}/"

  install -Dm644 ../sshdgenkeys.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 ../sshd.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 ../sshd.conf -t "${pkgdir}"/usr/lib/tmpfiles.d/
  install -Dm644 ../sshd.pam "${pkgdir}"/etc/pam.d/sshd

  install -Dm755 contrib/findssl.sh -t "${pkgdir}"/usr/bin/
  install -Dm755 contrib/ssh-copy-id -t "${pkgdir}"/usr/bin/
  install -Dm644 contrib/ssh-copy-id.1 -t "${pkgdir}"/usr/share/man/man1/
}

# vim: ts=2 sw=2 et:

# Maintainer: David Runge <dvzrv@archlinux.org>
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
pkgver=10.4p1
pkgrel=3
pkgdesc="SSH protocol implementation for remote login, command execution and file transfer, with SELinux support"
arch=(x86_64 aarch64)
url='https://www.openssh.com/portable.html'
license=(
  0BSD
  BSD-2-Clause
  BSD-3-Clause
  ISC
  LicenseRef-Public-Domain
  MIT
)
depends=(
  glibc
  libselinux
)
makedepends=(
  krb5
  libedit
  libfido2
  libxcrypt
  linux-headers
  openssl
  pam
  zlib
)
optdepends=(
  'libfido2: FIDO/U2F support'
  'sh: for ssh-copy-id and findssl.sh'
  'x11-ssh-askpass: input passphrase in X'
  'xorg-xauth: X11 forwarding'
)
backup=(
  etc/pam.d/sshd
  etc/ssh/ssh_config
  etc/ssh/sshd_config
)
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
groups=('selinux')
source=(
  https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${pkgname/-selinux}-${pkgver}.tar.gz{,.asc}
  0001-fix-GSSAPI-option-names.patch
  99-archlinux.conf
  ${pkgname/-selinux}.tmpfiles
  sshdgenkeys.service
  10-openssh-mark-sshd-for-restart.hook
  sshd.service
  sshd@.service
  ssh-agent.service
  ssh-agent.socket
  sshd.pam
  LICENSE
)
sha256sums=('ef6026dd2aea8d56059638d5d3262902c892ceba9f88395835e0d06d3fb63238'
            'SKIP'
            '67ad6f713dc45f8a746c726319e085db76e7aa1b46761cde21980f610b130181'
            '78b806c38bc1e246daaa941bfe7880e6eb6f53f093bea5d5868525ae6d223d30'
            'fadd31c107aee3fc6b501ca046aeb5e6fb1b0256cc5cdcade4e2c95205823a28'
            'e4dbff8e04a363a557c19d150e7e3a4317126a0371375771ae800bddf26860a7'
            '52e23d53c1967ecce1d2f1010e965e5583dfad51590ab3af490223ad8a4bc4a9'
            '25aea12c4c7fcc3636cae75b3b3cdb1c1bf513659b1e62b8ed67e02afeefc1b4'
            '048c07e2085147a7626c2d3f82c9523b1bec6890c1173486de44b2b70624d3e3'
            '824bf888ad0cb20ff3c2e13292389eb355ab91c3d9cc2fe0c8c5c60365d4a9c7'
            'a16492e1eb9219d47a9053f0c83cdc323bff3c6f5b573bc6509ec40e40e4d04b'
            '633e24cbfcb045ba777d3e06d5f85dfaa06d44f4727d38c7fb2187c57498221d'
            '7056c04df17a4e0f0bac9f787f347c9cd892cee6323d1c89528090afd0b934a3')
b2sums=('3051a345fd24333708277a1de781deca9094dd07cc55e613e93715b1266d80d59043bf5cdb2282d02c797cb9446916020e70fbd4c7a2470da7ab98eb612f6b74'
        'SKIP'
        'a443d46d1e38ff36ec76ca43b5327e72063266bdbe04394acb53880a437c3a8e3e8ede0c7f4f989ac4ca19beb57ba4ecad884a86890e76f7de3e121a3fa82367'
        '1ff8cd4ae22efed2b4260f1e518de919c4b290be4e0b5edbc8e2225ffe63788678d1961e6f863b85974c4697428ee827bcbabad371cfc91cc8b36eae9402eb97'
        '57e77e55fcbd9d7b9951adbafe11ba62e4b8b7338c2a6fe3f163afe5b84458db042024cefbc55f9393cf17d97d067f1c2d9c61880516501bfa4e5c92371e494a'
        '2031e10746edb77c190fb762ab82ff9dae2ad801d06d4c5eff2a8fcc459b873cf7c653e320c289f075f440d2079dd2430e0996a87511d3c8587903c622e8b44c'
        '120dd272dde778fee749b1606d26c2caeaba40d875231f6f1398b990fa80adba1658cd6da91e336b5fd45d7703cdbf12294e7528e1d3f90a2a33c108e84a4dbb'
        'f0687d2acfbe81af6b26f93d5fa507f4a4566a79e7c5e27796698b81d2b5aaf56be54a3a519680f9df076adff2455ecce9ffb789a05af9fd353b69c17742b362'
        '8c843c40bf98703fb1eb6280ce1fb4aee7bd3c8632aaaa8598afc02921c4aa9906fde97850e150fd7c67e91a562c7578b17250589be5ad592ac89ccff9da9d99'
        '6a80552260bc016757725602638478345565e1466335da8a70e0b4e49fe2e9d3b863df83764696cd91637c17dd137ed7c26188a1d795af3d024d89c9c229829b'
        'f161cdb54609bd4521d9517c5c9d97a87f7de5c7504bf46d870ee814624817050ca9f68d42a1e661ecc7c3ede1a440b5b159df18f3b16b3c2e90ecfbd0dfd258'
        '1d24cc029eccf71cee54dda84371cf9aa8d805433e751575ab237df654055dd869024b50facd8b73390717e63100c76bca28b493e0c8be9791c76a2e0d60990a'
        'a29664104e1ee73ca0aee1d633e9095d92a57c92787f8d8740bdb7211ba3205782ed8677f539bdb8cae3dd75a3694be3132e185fa3fc4b3f401e1f88eb776101')
validpgpkeys=('7168B983815A5EEF59A4ADFD2A3F414E736060BA')  # Damien Miller <djm@mindrot.org>

prepare() {
  cd ${pkgname/-selinux}-$pkgver
  # remove variable (but useless) first line in config (related to upstream VCS)
  sed '/^#.*\$.*\$$/d' -i ssh{,d}_config

  # prepend configuration option to include drop-in configuration files for sshd_config
  printf "# Include drop-in configurations\nInclude /etc/ssh/sshd_config.d/*.conf\n" | cat - sshd_config > sshd_config.tmp
  mv -v sshd_config.tmp sshd_config
  # prepend configuration option to include drop-in configuration files for ssh_config
  printf "# Include drop-in configurations\nInclude /etc/ssh/ssh_config.d/*.conf\n" | cat - ssh_config > ssh_config.tmp
  mv -v ssh_config.tmp ssh_config

  # extract separate licenses
  sed -n '89,113p' LICENCE > ../rijndael.Public-Domain.txt
  sed -n '116,145p' LICENCE > ../ssh.BSD-3-Clause.txt
  sed -n '148,209p' LICENCE > ../BSD-2-Clause.txt
  sed -n '213,218p' LICENCE > ../snprintf.Public-Domain.txt
  sed -n '222,258p' LICENCE > ../openbsd-compat.BSD-3-Clause.txt
  sed -n '260,278p' LICENCE > ../openbsd-compat.ISC.txt
  sed -n '280,308p' LICENCE > ../openbsd-compat.MIT.txt
  sed -n '280,308p' LICENCE > ../openbsd-compat.MIT.txt
  sed -n '310,338p' LICENCE > ../blowfish.BSD-3-Clause.txt
  sed -n '340,368p' LICENCE > ../replacement.BSD-2-Clause.txt

  # fix GSSAPI option name
  patch -Np1 < ../0001-fix-GSSAPI-option-names.patch
}

build() {
  local configure_options=(
    --disable-lastlog
    --disable-strip
    --libexecdir=/usr/lib/ssh
    --prefix=/usr
    --sbindir=/usr/bin
    --sysconfdir=/etc/ssh
    --with-default-path='/usr/local/sbin:/usr/local/bin:/usr/bin'
    --with-kerberos5=/usr
    --with-libedit
    --with-pam
    --with-pid-dir=/run
    --with-privsep-path=/usr/share/empty.sshd
    --with-privsep-user=nobody
    --with-security-key-builtin
    --with-ssl-engine
    --with-xauth=/usr/bin/xauth
    --without-zlib-version-check
    --with-selinux
  )

  cd ${pkgname/-selinux}-$pkgver

  ./configure "${configure_options[@]}"
  make
}

check() {
  # NOTE: make t-exec does not work in our build environment
  make file-tests interop-tests unit -C ${pkgname/-selinux}-$pkgver
}

package() {
  depends+=(
    krb5 libkrb5.so libgssapi_krb5.so
    libedit libedit.so
    libxcrypt libcrypt.so
    openssl libcrypto.so
    pam libpam.so
    zlib libz.so
  )

  cd ${pkgname/-selinux}-$pkgver

  make DESTDIR="$pkgdir" install

  install -vDm 644 ../99-archlinux.conf -t "$pkgdir/etc/ssh/sshd_config.d/"
  install -vdm 755 "$pkgdir/etc/ssh/ssh_config.d"

  install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/${pkgname/-selinux}/"
  install -Dm644 ../*.txt -t "$pkgdir/usr/share/licenses/${pkgname/-selinux}/"

  install -Dm644 ../sshdgenkeys.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm644 ../sshd.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm644 ../sshd@.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm644 ../ssh-agent.{service,socket} -t "$pkgdir"/usr/lib/systemd/user/
  install -Dm644 ../sshd.pam "$pkgdir"/etc/pam.d/sshd
  install -vDm 644 ../10-openssh-mark-sshd-for-restart.hook -t "$pkgdir/usr/share/libalpm/hooks/"

  # factory files
  install -Dm644 ../sshd.pam "$pkgdir"/usr/share/factory/etc/pam.d/sshd
  install -Dm644 "$pkgdir/etc/ssh/moduli" -t "$pkgdir"/usr/share/factory/etc/ssh/
  install -Dm644 "$pkgdir/etc/ssh/ssh_config" -t "$pkgdir"/usr/share/factory/etc/ssh/
  install -Dm644 "$pkgdir/etc/ssh/sshd_config" -t "$pkgdir"/usr/share/factory/etc/ssh/
  install -vDm 644 ../99-archlinux.conf -t "$pkgdir/usr/share/factory/etc/ssh/sshd_config.d/"

  install -vDm 644 ../${pkgname/-selinux}.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/${pkgname/-selinux}.conf"
  install -vDm 644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/0BSD.txt"

  install -Dm755 contrib/findssl.sh -t "$pkgdir"/usr/bin/
  install -Dm755 contrib/ssh-copy-id -t "$pkgdir"/usr/bin/
  install -Dm644 contrib/ssh-copy-id.1 -t "$pkgdir"/usr/share/man/man1/
}

# vim: ts=2 sw=2 et:

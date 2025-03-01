# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=openssh-dnat
_pkgname=openssh
conflicts=(${_pkgname})
provides=(${_pkgname})
pkgver=9.9p2
pkgrel=1
pkgdesc="SSH protocol implementation for remote login, command execution and file transfer with DNAT patch"
arch=(x86_64)
url='https://www.openssh.com/portable.html'
license=(
  BSD-2-Clause
  BSD-3-Clause
  ISC
  LicenseRef-Public-Domain
  MIT
)
depends=(
  glibc
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
source=(
  https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/$_pkgname-$pkgver.tar.gz{,.asc}
  99-archlinux.conf
  $_pkgname.tmpfiles
  sshdgenkeys.service
  sshd.service
  ssh-agent.service
  sshd.pam
)
sha256sums=('91aadb603e08cc285eddf965e1199d02585fa94d994d6cae5b41e1721e215673'
            'SKIP'
            '78b806c38bc1e246daaa941bfe7880e6eb6f53f093bea5d5868525ae6d223d30'
            'fadd31c107aee3fc6b501ca046aeb5e6fb1b0256cc5cdcade4e2c95205823a28'
            'ff4e190dc90db51b71b724e8a801496846e1d63a32a5ce35494cdde8743c9833'
            '201af9f6e00700ebbfd3600c0025c022bff28f9bfd073e1a55756bfdf3bb2d5a'
            'fc70b23ec083a5fc45f37049ba7fa12164a800d83c701e852a8315d48a0ff13e'
            '633e24cbfcb045ba777d3e06d5f85dfaa06d44f4727d38c7fb2187c57498221d')
b2sums=('1b5bc09482b3a807ccfee52c86c6be3c363acf0c8e774862e0ae64f76bfeb4ce7cf29b3ed2f99c04c89bb4977da0cf50a7a175b15bf1d9925de1e03c66f8306d'
        'SKIP'
        '1ff8cd4ae22efed2b4260f1e518de919c4b290be4e0b5edbc8e2225ffe63788678d1961e6f863b85974c4697428ee827bcbabad371cfc91cc8b36eae9402eb97'
        '57e77e55fcbd9d7b9951adbafe11ba62e4b8b7338c2a6fe3f163afe5b84458db042024cefbc55f9393cf17d97d067f1c2d9c61880516501bfa4e5c92371e494a'
        '5ffd9bd6dfda8c632f7cad1cc7ac5c5bc155d08f22c0d5b9395895db81b24846af0c6d43fab750f1ac089e98ca55585351d14e38f37b3a32cab326e0fffdcba2'
        '6faea668a21c3f2c3e8cb973a55e53ccef6037a1d772d18e71d545b18bf63e7c9618f416c1b6e93672aadbdd9024408d41bfba69ddfe3d3ed9e42964130c968a'
        '12a02423bfdbe79f528ea06d70746362ea6aaaf07f28bb4a7efe707ace06429e86e4f5fe7758c3e865c20976faa614102b924725ea0e833690d3732e386fee33'
        '1d24cc029eccf71cee54dda84371cf9aa8d805433e751575ab237df654055dd869024b50facd8b73390717e63100c76bca28b493e0c8be9791c76a2e0d60990a')
validpgpkeys=('7168B983815A5EEF59A4ADFD2A3F414E736060BA')  # Damien Miller <djm@mindrot.org>

prepare() {
  cd $_pkgname-$pkgver
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
}

build() {
  local configure_options=(
    --prefix=/usr
    --sbindir=/usr/bin
    --libexecdir=/usr/lib/ssh
    --sysconfdir=/etc/ssh
    --disable-strip
    --with-libedit
    --with-security-key-builtin
    --with-ssl-engine
    --with-pam
    --with-privsep-user=nobody
    --with-privsep-path=/usr/share/empty.sshd
    --with-kerberos5=/usr
    --with-xauth=/usr/bin/xauth
    --with-pid-dir=/run
    --with-default-path='/usr/local/sbin:/usr/local/bin:/usr/bin'
    --without-zlib-version-check
  )

  cd $_pkgname-$pkgver

  ./configure "${configure_options[@]}"
  patch --ignore-whitespace -p1 < ../../patch-openssh-DNAT.txt && make
}

check() {
  # NOTE: make t-exec does not work in our build environment
  make file-tests interop-tests unit -C $_pkgname-$pkgver
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

  cd $_pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  install -vDm 644 ../99-archlinux.conf -t "$pkgdir/etc/ssh/sshd_config.d/"
  install -vdm 755 "$pkgdir/etc/ssh/ssh_config.d"

  install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/$_pkgname/"
  install -Dm644 ../*.txt -t "$pkgdir/usr/share/licenses/$_pkgname/"

  install -Dm644 ../sshdgenkeys.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm644 ../sshd.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm644 ../ssh-agent.service -t "$pkgdir"/usr/lib/systemd/user/
  install -Dm644 ../sshd.pam "$pkgdir"/etc/pam.d/sshd

  # factory files
  install -Dm644 ../sshd.pam "$pkgdir"/usr/share/factory/etc/pam.d/sshd
  install -Dm644 "$pkgdir/etc/ssh/moduli" -t "$pkgdir"/usr/share/factory/etc/ssh/
  install -Dm644 "$pkgdir/etc/ssh/ssh_config" -t "$pkgdir"/usr/share/factory/etc/ssh/
  install -Dm644 "$pkgdir/etc/ssh/sshd_config" -t "$pkgdir"/usr/share/factory/etc/ssh/
  install -vDm 644 ../99-archlinux.conf -t "$pkgdir/usr/share/factory/etc/ssh/sshd_config.d/"

  install -vDm 644 ../$_pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"

  install -Dm755 contrib/findssl.sh -t "$pkgdir"/usr/bin/
  install -Dm755 contrib/ssh-copy-id -t "$pkgdir"/usr/bin/
  install -Dm644 contrib/ssh-copy-id.1 -t "$pkgdir"/usr/share/man/man1/
}

# vim: ts=2 sw=2 et:
